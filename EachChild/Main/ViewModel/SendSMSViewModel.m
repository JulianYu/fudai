//
//  SendSMSViewModel.m
//  StockRight
//
//  Created by 虞军军 on 16/12/14.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "SendSMSViewModel.h"

@implementation SendSMSViewModel

- (void)sendSMSWithPhomeNumber:(NSString *)number completion:(void (^)(NSInteger))completion
{
    
    [self.httpManager POST:OauthApi(sendMobileCodeMethod) parameters:@{@"phone":number} success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
        if (1 != status) {
            
        }
        completion(status);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

@end
