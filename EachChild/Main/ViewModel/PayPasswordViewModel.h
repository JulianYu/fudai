//
//  PayPasswordViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface PayPasswordViewModel : BaseRequestViewModel

- (void)requestForSettingPayPasswordWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

@end
