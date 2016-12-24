//
//  NSDictionary+conponent.h
//  StockRight
//
//  Created by 虞军军 on 16/10/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (conponent)

- (NSDictionary *)dictionaryAtPath:(NSString *)path;
- (NSDictionary *)dictionaryAtPath:(NSString *)path otherWise:(NSDictionary *)dict;
- (NSArray *)arrayAtPath:(NSString *)path;
- (NSArray *)arrayAtPath:(NSString *)path otherwise:(NSArray *)other;
+ (NSDictionary *)dictionaryWithJSONString:(NSString *)jsonString;

@end
