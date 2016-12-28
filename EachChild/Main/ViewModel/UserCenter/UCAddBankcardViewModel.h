//
//  UCAddBankcardViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface UCAddBankcardViewModel : BaseRequestViewModel

- (void)requestForAddingBankcardWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

@end
