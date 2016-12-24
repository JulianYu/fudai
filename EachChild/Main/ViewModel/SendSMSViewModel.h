//
//  SendSMSViewModel.h
//  StockRight
//
//  Created by 虞军军 on 16/12/14.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface SendSMSViewModel : BaseRequestViewModel
- (void)sendSMSWithPhomeNumber:(NSString *)number completion:(void(^)(NSInteger status))completion;

@end
