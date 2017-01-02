//
//  LoginViewController.m
//  StockRight
//
//  Created by 虞军军 on 16/10/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "PayPasswordViewController.h"
#import "LoginViewModel.h"
#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
   
//    NSString *username = [NSString userDefaultsRead:@"Login.username"];
//    NSString *password = [NSString userDefaultsRead:@"Login.password"];
    
    [[_usernameTextField rac_signalForControlEvents:UIControlEventEditingDidEndOnExit] subscribeNext:^(id x) {
        [_passwordTextField becomeFirstResponder];
    }];
//    _usernameTextField.text = username;
//    _passwordTextField.text = password;
    RACSignal *formValid = [RACSignal
                            combineLatest:@[
                                            self.usernameTextField.rac_textSignal,
                                            self.passwordTextField.rac_textSignal,]
                            reduce:^(NSString *username, NSString *password) {
                                return @([username length] > 0 && [password length] > 0);
                            }];
    
    RAC(self.loginBtn, enabled) = formValid;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self.viewModel action:@selector(onRegister)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    @weakify(self);
    [self.usernameTextField.rac_textSignal subscribeNext:^(id x) {
        @strongify(self);
        NSString *text = (NSString *)x;
        self.viewModel.username = text;
    }];
    [self.passwordTextField.rac_textSignal subscribeNext:^(id x) {
        @strongify(self);
        self.viewModel.password = (NSString *)x;
    }];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}


- (IBAction)forgetPasswordAction:(UIButton *)sender {
    ForgetPasswordViewController *forgetPassword = [[ForgetPasswordViewController alloc] initWithNibName:@"ForgetPasswordViewController" bundle:nil];
    [self.navigationController pushViewController:forgetPassword animated:YES];
}

- (IBAction)loginAction:(UIButton *)sender {
    @weakify(self);
    [NSObject startActivityIndicatorInView:self.view withMessage:@"正在登录..."];
    [self.viewModel loginWithCompletion:^(NSInteger status) {
        @strongify(self);
        [NSObject stopActivityIndicatorInView:self.view];
        if (1 ==status) {
            if (![[UserModel shareInstance].pay_password_stat isEqualToNumber:@1]) {
                PayPasswordViewController *vc = [[PayPasswordViewController alloc] initWithNibName:@"PayPasswordViewController" bundle:nil];
                [self.navigationController pushViewController:vc animated:YES];
            }else {
                [self requestForRongCloudToken];
            }
        }
    }];
}
- (BOOL)validateLogin {
    return YES;
}

- (LoginViewModel *)viewModel {
    if (!_viewModel) {
        __weak typeof(self) weakself = self;
        _viewModel = [[LoginViewModel alloc] initWithViewController:weakself];
    }
    return _viewModel;
}

- (void)requestForRongCloudToken {
    @weakify(self);
    [self.viewModel requestForRongCloudTokenWithCompletion:^(NSInteger status) {
        @strongify(self);
        if (1 == status) {
            [self connectingToRongCloudWithToken:[UserModel shareInstance].token.token];
        }
    }];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate loginSuccess];
}

- (void)connectingToRongCloudWithToken:(NSString *)token {
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
}



@end
