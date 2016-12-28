//
//  UCAddAddressViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface UCAddAddressViewModel : BaseRequestViewModel

@property (nonatomic, strong) NSArray *dataArray;

- (void)requestForAreaWithParentID:(NSString *)parentID completion:(void(^)(NSInteger status))completion;

- (void)requestForAddingAddressWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

@end
