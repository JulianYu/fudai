//
//  PublicModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/21.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"




@interface UserInfo : BaseModel
@property (nonatomic, copy) NSString *time;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSNumber *user_id;
@property (nonatomic, copy) NSString *group_name;
@property (nonatomic, strong) NSNumber *sex;
@property (nonatomic, copy) NSString *last_login;
@property (nonatomic, copy) NSString *balance; //账户余额
@property (nonatomic, strong) NSNumber *point;
@property (nonatomic, strong) NSNumber *exp;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *mobile;
@property (nonatomic, copy) NSString *true_name;//昵称
@property (nonatomic, copy) NSString *head_ico;
@property (nonatomic, copy) NSString *username;//用户名(可用于登录)（不可修改）
@end

/** 地区 **/
@interface Area : BaseModel

@property (nonatomic, copy) NSString *area_id;
@property (nonatomic, copy) NSString *parent_id;
@property (nonatomic, copy) NSString *area_name;
@property (nonatomic, copy) NSString *sort;

@end

@interface ADDRESS : BaseModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *accept_name;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *province_id;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *area_id;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *telphone;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *city_id;
@property (nonatomic, copy) NSString *is_default;
@end

/** 银行卡 **/
@interface BANKCARD : BaseModel
@property (nonatomic, copy) NSString *bankid;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *cardnum;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *realname;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *bankfullname;
@end

/** 银行列表 */
@interface BANK : BaseModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *bankname;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *update_time;

@end
