//
//  RegisterViewController.m
//  StockRight
//
//  Created by 虞军军 on 16/10/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterViewModel.h"
#import "AgreementViewController.h"


@interface RegisterViewController ()<UITextFieldDelegate>
{
    CGFloat kAnimateDuration;
    CGFloat kOriginYOfUIKeyboard;
    CGFloat kCurrentGap;
}
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *mobileTF;
@property (strong, nonatomic) IBOutlet UITextField *validationTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong, nonatomic) IBOutlet UITextField *rePassowrdTF;


@property (nonatomic, strong) RegisterViewModel *viewModel;

@property (strong, nonatomic) IBOutlet UIButton *smsBtn;

@property (strong, nonatomic) IBOutlet UIButton *confirmBtn;

@property (strong, nonatomic) IBOutlet UIButton *agreeBtn;




@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation RegisterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
//    [self.smsBtn.layer masksToBounds];
//    self.smsBtn.layer.cornerRadius = 5;
//    [self.confirmBtn.layer masksToBounds];
    self.confirmBtn.layer.cornerRadius = 5;
    [[_mobileTF rac_signalForControlEvents:UIControlEventEditingDidEndOnExit] subscribeNext:^(id x) {
        [_validationTF becomeFirstResponder];
    }];
    [[_validationTF rac_signalForControlEvents:UIControlEventEditingDidEndOnExit] subscribeNext:^(id x) {
        [_passwordTF becomeFirstResponder];
    }];
    [[_passwordTF rac_signalForControlEvents:UIControlEventEditingDidEndOnExit] subscribeNext:^(id x) {
        [_rePassowrdTF becomeFirstResponder];
    }];
    
    RACSignal *formValid = [RACSignal
                            combineLatest:@[
                                            self.mobileTF.rac_textSignal,
                                            self.validationTF.rac_textSignal,
                                            self.passwordTF.rac_textSignal,
                                            self.rePassowrdTF.rac_textSignal,
                                            RACObserve(self.agreeBtn, selected)]
                            reduce:^(NSString *mobile,NSString *validation, NSString *password, NSString *repassword,  id isSelected) {
                                return @([mobile length] > 0 && [validation length] > 0 && [password length] > 0 && [repassword length] > 0 && [isSelected floatValue] != 0);
                            }];
    
    RAC(self.confirmBtn, enabled) = formValid;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
}
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect frame = [value CGRectValue];
    kAnimateDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] toFloat];
    kOriginYOfUIKeyboard = frame.origin.y;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark-UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    kCurrentGap = kOriginYOfUIKeyboard - textField.maxY;
    if (kCurrentGap < 0) {
        [UIView animateWithDuration:kAnimateDuration animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, kCurrentGap);
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:kAnimateDuration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    
    kCurrentGap = 0;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.timer) {
        dispatch_source_cancel(self.timer);
    }
}


- (IBAction)sendSMSAction:(id)sender {
    
    [self.viewModel sendSMSWithPhomeNumber:self.mobileTF.text completion:^(NSInteger status) {
        
    }];
    
    [self btnAction2:sender];
    
    
}
- (void)btnAction2:(UIButton *)btn
{
    __block int timeout = 60;
    
    /*! 倒计时时间 */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(self.timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    
    /*! 每秒执行 */
    dispatch_source_set_event_handler(self.timer, ^{
        
        if(timeout <= 0)
        {
            /*! 倒计时结束，关闭 */
            dispatch_source_cancel(self.timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                /*! 设置界面的按钮显示 根据自己需求设置 */
                [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
                
            });
        }
        else
        {
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            if ([strTime isEqualToString:@"0"])
            {
                strTime = [NSString stringWithFormat:@"%d", 60];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                /*! 设置界面的按钮显示 根据自己需求设置 */
                // BALog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [btn setTitle:[NSString stringWithFormat:@"%@秒后重发",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                btn.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(self.timer);
}

- (IBAction)regAction:(id)sender {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:4];
    if (_usernameField.text.length > 0) {
        [params setValue:_usernameField.text forKey:@"username"];
    }
    if ([_mobileTF.text isPhoneNumber]) {
        [params setObject:_mobileTF.text forKey:@"mobile"];
    }
    if ([_validationTF.text isValidationCode]) {
        [params setObject:_validationTF.text forKey:@"mobile_code"];
    }
    if ([_passwordTF.text isPassword]) {
        [params setObject:_passwordTF.text forKey:@"password"];
    }
    if ([_rePassowrdTF.text isPassword]) {
        [params setObject:_rePassowrdTF.text forKey:@"repassword"];
    }
    
    [self.viewModel sendRequestWithParameters:params];
}
- (IBAction)agreeeAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}



- (RegisterViewModel *)viewModel {
    if (!_viewModel) {
        __weak typeof(self) weakself = self;
        _viewModel = [[RegisterViewModel alloc] initWithViewController:weakself];
    }
    return _viewModel;
}
/** 用户服务协议 **/
- (IBAction)pushAction:(id)sender {
    AgreementViewController *agreementVCtrl = [[AgreementViewController alloc] initWithNibName:@"AgreementViewController" bundle:nil];
    [self.navigationController pushViewController:agreementVCtrl animated:YES];
}

- (void)dealloc {
    
}

@end
