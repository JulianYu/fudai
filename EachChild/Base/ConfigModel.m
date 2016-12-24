//
//  ConfigModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "ConfigModel.h"

@implementation ConfigModel

+ (instancetype)shareConfig {
    static ConfigModel *shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ConfigModel alloc] init];
    });
    return shareInstance;
}




@end
