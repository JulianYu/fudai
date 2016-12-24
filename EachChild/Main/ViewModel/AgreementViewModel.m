//
//  AgreementViewModel.m
//  StockRight
//
//  Created by 虞军军 on 16/12/6.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "AgreementViewModel.h"

@implementation AgreementViewModel

- (void)sendRequestToGetURLString:(void(^)(NSString *urlString))completion {
    
//    [ProgressHUD showWithStatus:@"正在获取用户协议..."];
//    [self.httpManager POST:kUserURL(@"service") parameters:@{@"id":@(42)} success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
////        [ProgressHUD dismiss];
//        if (1 == status) {
//            NSString *urlString = [data objectForKey:@"content"];
//            completion(urlString);
//        }else {
////            [ProgressHUD showErrorWithStatus:msg];
//        }
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
////        [ProgressHUD dismiss];
//    }];
}

@end
