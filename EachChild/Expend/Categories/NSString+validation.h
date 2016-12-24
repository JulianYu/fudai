//
//  NSString+validation.h
//  StockRight
//
//  Created by 虞军军 on 16/10/31.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (validation)

- (BOOL)isMobile;
- (BOOL)isEmail;
- (BOOL)isIDCard;
- (BOOL)isPassport;
- (BOOL)isValidationCode;
- (BOOL)isPassword;
- (BOOL)isUInteger;

@end
