//
//  LoginViewModel.m
//  StockRight
//
//  Created by 虞军军 on 16/10/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

#import "AppDelegate.h"


@interface LoginViewModel ()

@property (nonatomic, strong) LoginViewController *viewController;

@end

@implementation LoginViewModel
- (instancetype)initWithViewController:(BaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[LoginViewController class]]) {
            _viewController = (LoginViewController *)viewController;
        }
    }
    return self;
    
}
- (void)onRegister {
    
    RegisterViewController *regVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self.viewController.navigationController pushViewController:regVC animated:YES];
    
}
- (void)login {
    
    // 配置网络请求参数
    NSDictionary *parameters = @{@"login_info": self.username,@"password":self.password};
    
    // 发起请求
    
    
    [self.httpManager POST:OauthApi(authorizeMethod) parameters:parameters success:^(NSURLSessionDataTask *task, id responseDict, NSUInteger status, NSString *msg) {
        
        
        if (status == 1) {
            // 将请求下来的字典->模型
            NSDictionary *data = [responseDict valueForKey:@"data"];
            [UserModel shareInstance].oauth_secret = data[@"oauth_secret"];
            [UserModel shareInstance].uid = data[@"uid"];
            [UserModel shareInstance].pay_password_stat = data[@"pay_password_stat"];
            [self loginSuccess];
        }else {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}
- (void)loginSuccess {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate loginSuccess];
}


@end
