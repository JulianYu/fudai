//
//  ConfigModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"

@interface ConfigModel : BaseModel

+ (instancetype)config;

@property (nonatomic, copy, readonly, getter=getImageUrl) NSString *imageUri;

@property (nonatomic, copy, readonly) NSString *kRongCloudAppKey;
@property (nonatomic, copy, readonly) NSString *kRongCloudSecret;

@end
