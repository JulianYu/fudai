//
//  UCEditAddressViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCEditAddressViewModel.h"

@implementation UCEditAddressViewModel

- (void)requestForDefaultAddressWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(set_default_addressMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
        completion(-1);
    }];
    
}
- (void)requestForDeletingAddressWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(address_delMethod) parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        if (1 == status) {
            
        }
        [NSObject showHudTipStr:msg];
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [NSObject showHudTipError:error];
        completion(-1);
    }];
}

- (void)requestForEdittingAddressWithParams:(NSDictionary *)params completion:(void (^)(NSInteger))completion {
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
