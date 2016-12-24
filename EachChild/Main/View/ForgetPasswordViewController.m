//
//  ForgetPasswordViewController.m
//  StockRight
//
//  Created by 虞军军 on 16/11/14.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ForgetPasswordViewModel.h"

@interface ForgetPasswordViewController ()
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *validationTextField;
@property (strong, nonatomic) IBOutlet UIButton *sendSMSBtn;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *repasswordTextField;


@property (strong, nonatomic) IBOutlet UIButton *comfirmBtn;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) ForgetPasswordViewModel *viewModel;

@end

static int fade = 60;
@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"忘记密码"];
    [self.sendSMSBtn.layer masksToBounds];
    self.sendSMSBtn.layer.cornerRadius = 5;
    [self.comfirmBtn.layer masksToBounds];
    self.comfirmBtn.layer.cornerRadius = 5;
}
- (IBAction)sendSMSAction:(UIButton *)sender {
    [sender setEnabled:NO];
    [self.viewModel sendSMSWithPhomeNumber:self.phoneNumberTextField.text completion:^(NSInteger status) {
        
    }];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scheduledAction) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (IBAction)comfirm:(id)sender {
    
    [self.viewModel resetPasswordWithNumber:self.phoneNumberTextField.text code:self.validationTextField.text password:self.passwordTextField.text repassword:self.repasswordTextField.text completion:^(NSInteger status) {
        if (1 == status) {
            
        }
    }];
}

- (void)scheduledAction {
    
    [self.sendSMSBtn setTitle:[NSString stringWithFormat:@"%d秒后重发",fade] forState:UIControlStateNormal];
    fade--;
    if (0 == fade) {
        fade = 60;
        [self.timer invalidate];
        self.timer = nil;
        [self.sendSMSBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.sendSMSBtn setEnabled:YES];
    }
}

- (ForgetPasswordViewModel *)viewModel {
    if (!_viewModel) {
        __weak typeof(self) weakself = self;
        _viewModel = [[ForgetPasswordViewModel alloc] initWithViewController:weakself];
    }
    return _viewModel;
}

@end
