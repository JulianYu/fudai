//
//  APITESTViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/23.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "APITESTViewModel.h"

@interface APITESTViewModel ()

@end
@implementation APITESTViewModel

+ (void)uCenterRequestWithMethod:(NSString *)method params:(NSDictionary *)params {
    APITESTViewModel *viewModel = [[self alloc] init];
    
    [viewModel requestWithParams:params method:method type:1];
    
}
+ (void)publicApiRequestWithMethod:(NSString *)method params:(NSDictionary *)param {
    APITESTViewModel *viewModel = [[self alloc] init];
    [viewModel requestWithParams:nil method:method type:2];
}

- (void)requestWithParams:(NSDictionary *)params method:(NSString *)method  type:(NSInteger)type {
    NSString *urlString = nil;
    if (type == 1) {
        urlString = UcenterApi(method);
    }else if(type == 2) {
        urlString = PublicApi(method);
    }
    [self.httpManager POST:urlString parameters:params success:^(NSURLSessionDataTask *task, id data, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        if (1 == status) {
            
        }else {
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
    }];
}

@end
