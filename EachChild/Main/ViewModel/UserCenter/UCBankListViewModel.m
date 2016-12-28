//
//  BankcardLiveViewModel.m
//  StockRight
//
//  Created by 虞军军 on 16/10/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCBankListViewModel.h"




@implementation UCBankListViewModel

- (void)requestForBankList:(void (^)(NSInteger))completion {
    @weakify(self);
    [self.httpManager POST:UcenterApi(bank_listMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        @strongify(self);
        if (1 == status) {
            self.dataArray = [BANK mj_objectArrayWithKeyValuesArray:[response valueForKey:@"data"]];
        }else {
            [NSObject showHudTipStr:msg];
        }
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
    }];
}

@end
