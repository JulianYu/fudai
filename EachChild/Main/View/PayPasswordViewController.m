//
//  PayPasswordViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/23.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "PayPasswordViewController.h"
#import "SendSMSViewModel.h"
#import "PayPasswordViewModel.h"
#import "AppDelegate.h"

@interface PayPasswordViewController ()

@property (nonatomic, strong) SendSMSViewModel *smsViewModel;
@property (nonatomic, strong) PayPasswordViewModel *viewModel;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (strong, nonatomic) IBOutlet UITextField *mobileField;
@property (strong, nonatomic) IBOutlet UITextField *codeField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *rePasswordField;

@end

@implementation PayPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付密码";
    // Do any additional setup after loading the view from its nib.
    
}
- (IBAction)SMSAction:(UIButton *)sender {
    
    [self.smsViewModel sendPayPasswordSMSWithPhoneNumber:self.mobileField.text completion:^(NSInteger status) {
        if (1 == status) {
            
        }
    }];
}
- (IBAction)comfirmAction:(UIButton *)sender {
    if (self.codeField.text.length > 0) {
        [self.params setValue:self.codeField.text forKey:@"mobilecode"];
    }else {
        [NSObject showHudTipStr:@"请输入验证码！"];
    }
    if (self.passwordField.text.length > 0) {
        [self.params setValue:self.passwordField.text forKey:@"pay_password"];
    }else {
        [NSObject showHudTipStr:@"请输入密码！"];
    }
    if (self.rePasswordField.text.length > 0) {
        [self.params setValue:self.rePasswordField.text forKey:@"pay_repassword"];
    }else {
        [NSObject showHudTipStr:@"请输入验证密码！"];
    }
    
    [self.viewModel requestForSettingPayPasswordWithParams:self.params completion:^(NSInteger status) {
        if (1 == status) {
            [self loginSuccess];
        }
    }];
}


- (void)loginSuccess {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate loginSuccess];
}
- (SendSMSViewModel *)smsViewModel {
    if (!_smsViewModel) {
        _smsViewModel = [[SendSMSViewModel alloc] init];
    }
    return _smsViewModel;
}
- (PayPasswordViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PayPasswordViewModel alloc] init];
    }
    return _viewModel;
}
- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
        [_params setValue:@"15976861039" forKey:@"mobile"];
    }
    return _params;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
