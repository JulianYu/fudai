//
//  FMPayTypeViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FMPayTypeViewModel.h"

@implementation FMPayTypeViewModel

- (void)requestForPayTyeCompletion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(paymentlistMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        if (1 == status) {
            self.payTypeArray = [FMPayType mj_objectArrayWithKeyValuesArray:response[@"data"]];
        }else {
            [NSObject showHudTipStr:msg];
        }
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}

- (void)payWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion {
    [self.httpManager POST:UcenterApi(PayMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

@end
