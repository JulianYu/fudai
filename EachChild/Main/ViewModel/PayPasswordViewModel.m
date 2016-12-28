//
//  PayPasswordViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "PayPasswordViewModel.h"

@implementation PayPasswordViewModel

- (void)requestForSettingPayPasswordWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(Paypassword_editMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}

@end
