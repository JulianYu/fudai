//
//  LoginViewController.m
//  StockRight
//
//  Created by 虞军军 on 16/10/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "LoginViewModel.h"

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
    [self.viewModel login];
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

- (BOOL)shouldAutorotate {
    
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
