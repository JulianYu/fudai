//
//  NSObject+conversion.h
//  StockRight
//
//  Created by 虞军军 on 16/10/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (conversion)

- (NSInteger)toInteger;
- (CGFloat)toFloat;
- (NSNumber *)toNumber;
- (NSString *)toString;
- (NSDate *)toDate;
- (NSString *)toDateString;
- (NSString *)toDateAndTimeString;
@end
