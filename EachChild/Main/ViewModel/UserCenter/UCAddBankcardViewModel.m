//
//  UCAddBankcardViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddBankcardViewModel.h"

@implementation UCAddBankcardViewModel

- (void)requestForAddingBankcardWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion {
    [self.httpManager POST:UcenterApi(bank_card_addMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}

@end
