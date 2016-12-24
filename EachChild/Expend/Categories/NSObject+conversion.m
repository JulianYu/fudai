//
//  NSObject+conversion.m
//  StockRight
//
//  Created by 虞军军 on 16/10/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "NSObject+conversion.h"

@implementation NSObject (conversion)

- (NSInteger)toInteger {
    NSNumber *num = [self toNumber];
    return [num integerValue];
}
- (CGFloat)toFloat {
    return [(NSNumber *)[self toNumber] floatValue];
}
- (NSNumber *)toNumber {
    if ( [self isKindOfClass:[NSNumber class]] )
    {
        return (NSNumber *)self;
    }
    else if ( [self isKindOfClass:[NSString class]] )
    {
        return [NSNumber numberWithInteger:[(NSString *)self doubleValue]];
    }
    else if ( [self isKindOfClass:[NSDate class]] )
    {
        return [NSNumber numberWithDouble:[(NSDate *)self timeIntervalSince1970]];
    }
    else if ( [self isKindOfClass:[NSNull class]] )
    {
        return [NSNumber numberWithInteger:0];
    }
    
    return nil;
}
- (NSString *)toString
{
    if ( [self isKindOfClass:[NSNull class]] )
        return nil;
    
    if ( [self isKindOfClass:[NSString class]] )
    {
        return (NSString *)self;
    }
    else if ( [self isKindOfClass:[NSData class]] )
    {
        NSData * data = (NSData *)self;
        
        NSString * text = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
        if ( nil == text )
        {
            text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if ( nil == text )
            {
                text = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            }
        }
        return text;
    }
    else
    {
        return [NSString stringWithFormat:@"%@", self];
    }
}
- (NSDate *)toDate
{
    if ( [self isKindOfClass:[NSDate class]] )
    {
        return (NSDate *)self;
    }
    else if ( [self isKindOfClass:[NSString class]] )
    {
        NSDate * date = nil;
        
        if ( nil == date )
        {
            static NSDateFormatter * formatter = nil;
            
            if ( nil == formatter )
            {
                formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
                [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
            }
            
            date = [formatter dateFromString:(NSString *)self];
        }
        return date;
    }
    else
    {
        return [NSDate dateWithTimeIntervalSince1970:[self toNumber].doubleValue];
    }
    
    return nil;
}
- (NSString *)toDateString {
    
    
    return [[[self toDate] toString] substringToIndex:10];
    
}
- (NSString *)toDateAndTimeString {
    return [[[self toDate] toString] substringToIndex:20];
}

@end
