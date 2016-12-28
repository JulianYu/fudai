//
//  UCSettingViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCSettingViewModel.h"


@implementation UCSettingViewModel

- (void)requestForLogoutWithCompletion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(logoutMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
        completion(-1);
    }];
}
- (void)requestForChangePasswordWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(password_editMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}
- (void)requestForFeedbackWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(complain_sendMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
        completion(-1);
    }];
}

@end
