//
//  ForgetPasswordViewModel.m
//  StockRight
//
//  Created by 虞军军 on 16/11/14.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "ForgetPasswordViewModel.h"
#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewModel()

@property (nonatomic, strong) ForgetPasswordViewController *viewController;

@end

@implementation ForgetPasswordViewModel
- (instancetype)initWithViewController:(BaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[ForgetPasswordViewController class]]) {
            self.viewController = (ForgetPasswordViewController *)viewController;
        }
    }
    return self;
}


- (void)sendSMSWithPhomeNumber:(NSString *)number completion:(void (^)(NSInteger))completion
{
    
    [self.httpManager POST:OauthApi(sendMobileCodeMethod) parameters:@{@"mobile":number} success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
        if (1 != status) {
            
        }
        completion(status);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)resetPasswordWithNumber:(NSString *)number code:(NSString *)code password:(NSString *)password repassword:(NSString *)repassword completion:(void (^)(NSInteger))completion
{
//    NSDictionary *params = @{@"phone":number,@"code":code,@"password":password,@"repassword":repassword};
//    [self.httpManager POST:kUserURL(@"resetPassword") parameters:params success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
//        if (1 == status) {
//            [self.viewController.navigationController popViewControllerAnimated:YES];
//        }else {
//            
//        }
//    
//        completion(status);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
}


@end
