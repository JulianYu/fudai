//
//  NSDictionary+conponent.m
//  StockRight
//
//  Created by 虞军军 on 16/10/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "NSDictionary+conponent.h"


@implementation NSDictionary (conponent)

- (NSDictionary *)dictionaryAtPath:(NSString *)path {
    NSMutableDictionary *status = [self objectForKey:@"status"];
    if ([path isEqualToString:@"status"] && [[status objectForKey:@"succeed"] integerValue] == 200) {
        [status setObject:@(1) forKey:@"succeed"];
        NSDictionary *statusDict = status;
        return statusDict;
    }else {
        
        NSObject * obj = [self objectAtPath:path];
        return [obj isKindOfClass:[NSDictionary class]] ? (NSDictionary *)obj : nil;
    }
}
- (NSDictionary *)dictionaryAtPath:(NSString *)path otherWise:(NSDictionary *)other {
    NSDictionary *obj = [self dictionaryAtPath:path];
    return obj ? obj : other;
}
- (NSArray *)arrayAtPath:(NSString *)path {
    NSObject * obj = [self objectAtPath:path];
    return [obj isKindOfClass:[NSArray class]] ? (NSArray *)obj : nil;
}
- (NSArray *)arrayAtPath:(NSString *)path otherwise:(NSArray *)other
{
    NSArray * obj = [self arrayAtPath:path];
    return obj ? obj : other;
}

- (id)objectAtPath:(NSString *)path
{
    return [self objectAtPath:path separator:nil];
}


- (id)objectAtPath:(NSString *)path separator:(NSString *)separator {
    if ( nil == separator )
    {
        path = [path stringByReplacingOccurrencesOfString:@"." withString:@"/"];
        separator = @"/";
    }
    NSArray * array = [path componentsSeparatedByString:separator];
    if ( 0 == [array count] )
    {
        return nil;
    }
    
    NSObject * result = nil;
    NSDictionary * dict = self;
    
    for ( NSString * subPath in array )
    {
        if ( 0 == [subPath length] )
            continue;
        
        result = [dict objectForKey:subPath];
        if ( nil == result )
            return nil;
        
        if ( [array lastObject] == subPath )
        {
            return result;
        }
        else if ( NO == [result isKindOfClass:[NSDictionary class]] )
        {
            return nil;
        }
        
        dict = (NSDictionary *)result;
    }
    
    return (result == [NSNull null]) ? nil : result;
}
+ (NSDictionary *)dictionaryWithJSONString:(NSString *)jsonString{
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}


@end
