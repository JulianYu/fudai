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
#import <RongIMKit/RongIMKit.h>


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
- (void)loginWithCompletion:(void (^)(NSInteger))completion {
    
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
            [UserModel shareInstance].userInfo = [UserInfo mj_objectWithKeyValues:[data valueForKey:@"userInfo"]];
            
        }else {
            
        }
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
    
}
- (void)requestForRongCloudTokenWithCompletion:(void (^)(NSInteger))completion {
    
    [self.httpManager POST:UcenterApi( getRongcloudTokenMethod ) parameters:@{@"nickname":[UserModel shareInstance].userInfo.true_name,@"head_ico":[UserModel shareInstance].userInfo.head_ico} success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        RCTOKEN *token = [RCTOKEN mj_objectWithKeyValues:[response valueForKey:@"data"]];
        [UserModel shareInstance].token = token;
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}



@end
