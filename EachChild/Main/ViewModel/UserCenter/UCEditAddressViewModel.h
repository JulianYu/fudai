//
//  UCEditAddressViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface UCEditAddressViewModel : BaseRequestViewModel

- (void)requestForDefaultAddressWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;
- (void)requestForDeletingAddressWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

- (void)requestForEdittingAddressWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

@end
