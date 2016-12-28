//
//  UCSettingViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface UCSettingViewModel : BaseRequestViewModel

- (void)requestForLogoutWithCompletion:(void(^)(NSInteger status))completion;

- (void)requestForChangePasswordWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;
- (void)requestForFeedbackWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

@end
