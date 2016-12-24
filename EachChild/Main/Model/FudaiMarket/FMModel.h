//
//  FMModel.h
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"


@interface SlidesShow : BaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *img;

@end

@interface FMFudai : BaseModel

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *fudai_no;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, strong) NSNumber *is_del;
@property (nonatomic, strong) NSNumber *redo_order_id;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, strong) NSNumber *sort;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, copy) NSString *update_time;

@end
