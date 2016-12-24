//
//  ForgetPasswordViewModel.h
//  StockRight
//
//  Created by 虞军军 on 16/11/14.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface ForgetPasswordViewModel : BaseRequestViewModel

- (void)sendSMSWithPhomeNumber:(NSString *)number completion:(void(^)(NSInteger status))completion;

- (void)resetPasswordWithNumber:(NSString *)number
                           code:(NSString *)code
                       password:(NSString *)password
                     repassword:(NSString *)repassword
                     completion:(void(^)(NSInteger status))completion;

@end
