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

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *fudai_no;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *is_del;
@property (nonatomic, copy) NSString *redo_order_id;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *update_time;

@end


@interface FMPayType : BaseModel
@property (nonatomic, copy) NSString *id;
//@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *class_name;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, copy) NSString *client_type;
@property (nonatomic, copy) NSString *poundage_type;
@property (nonatomic, copy) NSString *poundage;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *logo;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSString *config_param;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *status;
@end


