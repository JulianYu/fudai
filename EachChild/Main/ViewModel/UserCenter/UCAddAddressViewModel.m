//
//  UCAddAddressViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddAddressViewModel.h"


@implementation UCAddAddressViewModel

- (void)requestForAreaWithParentID:(NSString *)parentID completion:(void (^)(NSInteger))completion
{
    NSDictionary *params = nil;
    if (parentID.length > 0) {
        params = @{@"parent_id":parentID};
    }
    @weakify(self);
    [self.httpManager POST:PublicApi(getAreaMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        @strongify(self);
        if (1 == status) {
            self.dataArray = [Area mj_objectArrayWithKeyValuesArray:[response[@"data"] valueForKey:@"regions"]];
        }else {
            [NSObject showHudTipStr:msg];
        }
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}

- (void)requestForAddingAddressWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion {
    [self.httpManager POST:UcenterApi(address_editMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        if (1 == status) {
            
        }
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
        [NSObject showHudTipError:error];
    }];
}


@end
