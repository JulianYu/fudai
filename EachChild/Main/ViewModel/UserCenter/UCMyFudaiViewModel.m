//
//  UCMyFudaiViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCMyFudaiViewModel.h"
#import "UCFudaiModel.h"

@implementation UCMyFudaiViewModel

- (void)requestForMyFudaiListWithCompletion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(myFudaiOrderMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        if (1 == status) {
            self.dataArray = [UCFudaiOrder mj_objectArrayWithKeyValuesArray:[response objectForKey:@"data"]];
        }else {
            [NSObject showHudTipStr:msg];
        }
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}

@end
