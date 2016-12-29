//
//  UCFudaiModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"
@class UCFudai;

/**我的福袋订单列表*/
@interface UCFudaiOrder : BaseModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *pay_time;
@property (nonatomic, copy) NSString *pay_status;
@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, strong) UCFudai *fu_dai;
@property (nonatomic, copy) NSString *fudai_order_no;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *order_id;
@property (nonatomic, copy) NSString *pay_type;
@property (nonatomic, copy) NSString *trade_no;
@property (nonatomic, copy) NSString *is_del;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *fudai_id;
@property (nonatomic, copy) NSString *status;
@end
/**订单当中的福袋*/
@interface UCFudai : BaseModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *fudai_id;
@property (nonatomic, copy) NSString *u_time;
@property (nonatomic, copy) NSString *fudai_no;
@property (nonatomic, copy) NSString *c_time;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *is_del;
@property (nonatomic, copy) NSString *good_product_ids;
@property (nonatomic, copy) NSString *redo_order_id;
@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *update_time;
@end

/** 福袋当中的产品 **/
@interface UCFudaiGood : BaseModel
@property (nonatomic, copy) NSString *up_time;
@property (nonatomic, copy) NSString *ad_img;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *cost_price;
@property (nonatomic, copy) NSString *comments;

//@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *is_del;
@property (nonatomic, copy) NSString *visit;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *brand_id;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *is_share;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *model_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *favorite;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *store_nums;
@property (nonatomic, copy) NSString *exp;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *market_price;
@property (nonatomic, copy) NSString *goods_no;
@property (nonatomic, copy) NSString *sell_price;
@property (nonatomic, copy) NSString *down_time;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *keywords;
@property (nonatomic, copy) NSString *sale;
@property (nonatomic, copy) NSString *search_words;
@property (nonatomic, copy) NSString *point;
@property (nonatomic, copy) NSString *seller_id;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *spec_array;
@end



