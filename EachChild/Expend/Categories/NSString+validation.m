//
//  NSString+validation.m
//  StockRight
//
//  Created by 虞军军 on 16/10/31.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "NSString+validation.h"

@implementation NSString (validation)

- (BOOL)isMobile {
    return YES;
}
- (BOOL)isEmail {
    return YES;
}
- (BOOL)isValidationCode {
    return YES;
}
- (BOOL)isIDCard {
    
    return YES;
}
- (BOOL)isPassport {
    
    return YES;
}
- (BOOL)isPassword {
    return YES;
}
- (BOOL)isUInteger {
    
    
    return [self validateWithRegExp:@"^(0|[1-9][0-9]*)$"];
}

- (BOOL)validateWithRegExp:(NSString *)reg {
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", reg];
    return [predicate evaluateWithObject: self];
}

@end
