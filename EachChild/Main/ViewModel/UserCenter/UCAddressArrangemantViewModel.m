//
//  UCAddressArrangemantViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddressArrangemantViewModel.h"


@interface UCAddressArrangemantViewModel ()



@end

@implementation UCAddressArrangemantViewModel


- (void)requestForAddressList:(void (^)(NSInteger))completion
{
    [self.httpManager POST:UcenterApi(addressMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        if (1 == status) {
            self.dataArray = [ADDRESS mj_objectArrayWithKeyValuesArray:response[@"data"]];
        }
        completion(status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(-1);
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
