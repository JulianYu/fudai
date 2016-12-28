//
//  InitialRequestViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "InitialRequestViewModel.h"

@implementation InitialRequestViewModel

- (void)requestForBaseImageUrl:(void (^)(NSString *, NSInteger))url
{
    [self.httpManager POST:PublicApi(getWebHostMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        NSString *urlStr = nil;
        if (1 == status) {
           urlStr = response[@"data"];
        }else {
            [NSObject showHudTipStr:msg];
        }
        url(urlStr, status);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
        url(nil, -1);
    }];
}

@end
