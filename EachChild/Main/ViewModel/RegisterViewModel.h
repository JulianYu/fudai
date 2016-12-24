//
//  RegisterViewModel.h
//  StockRight
//
//  Created by 虞军军 on 16/10/31.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface RegisterViewModel : BaseRequestViewModel

- (void)sendRequestWithParameters:(NSDictionary *)params;

- (void)sendSMSWithPhomeNumber:(NSString *)number completion:(void(^)(NSInteger status))completion;

@end
