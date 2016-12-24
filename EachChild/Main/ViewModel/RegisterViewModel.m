//
//  RegisterViewModel.m
//  StockRight
//
//  Created by 虞军军 on 16/10/31.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "RegisterViewModel.h"
#import "RegisterViewController.h"
#import "AppDelegate.h"


@interface RegisterViewModel ()

@property (nonatomic, strong) RegisterViewController *viewController;

@end

@implementation RegisterViewModel
- (instancetype)initWithViewController:(BaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[RegisterViewController class]]) {
            self.viewController = (RegisterViewController *)viewController;
        }
    }
    return self;
}

- (void)sendRequestWithParameters:(NSDictionary *)params {
    
    [self.httpManager POST:OauthApi(registerMethod) parameters:params success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
        
        if (1 == status) {
            [NSObject showHudTipStr:msg];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [delegate reset];
            
        }else {
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
    }];
}
- (void)sendSMSWithPhomeNumber:(NSString *)number completion:(void (^)(NSInteger))completion
{
    
    [self.httpManager POST:PublicApi(index_bannersMethod) parameters:nil success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        completion(status);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
        completion(-1);
    }];
}

@end
