//
//  UCBankcardListViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCBankcardListViewModel.h"



@interface UCBankcardListViewModel ()



@end

@implementation UCBankcardListViewModel

- (void)requestForBankcardListWithCompeltion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(bank_card_listMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        self.dataArray = [BANKCARD mj_objectArrayWithKeyValuesArray:response[@"data"]];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (void)requestForDeletingBankcard:(NSDictionary *)params withithCompletion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(bank_card_delMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
    }];
}

@end
