//
//  NSString+regularExpression.h
//  EachChild
//
//  Created by 虞军军 on 16/12/21.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (regularExpression)

- (BOOL)isPhoneNumber;
- (BOOL)isEmail;
- (BOOL)isIDCard;
//- (BOOL)isPassport;
- (BOOL)isValidationCode;
- (BOOL)isPassword;
- (BOOL)isUInteger;

@end
