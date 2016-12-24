//
//  RequestMethodsModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"

#pragma mark- 登录注册API OauthApi
/** 发送注册时手机验证码 **/
extern NSString *const sendMobileCodeMethod;
/** 用户注册 **/
extern NSString *const registerMethod;
/** 用户登录 **/
extern NSString *const authorizeMethod;


#pragma mark- 公共API PublicApi
/** 首页-地区-获取地区 **/
extern NSString *const getAreaMethod;
/** 首页-轮播图接口 **/
extern NSString *const index_bannersMethod;
/** 首页-目录分类 **/
extern NSString *const getCategoryListTopMethod;
/** 首页-统计chart  **/
extern NSString *const index_fd_chartMethod;
/** 首页-搜索-商家列表 **/
extern NSString *const sellerListMethod;
/** 商家详情 **/
extern NSString *const sellerDetailMethod;


/** 市场-轮播图 **/
extern NSString *const sc_bannersMethod;
/** 市场 福袋列表接口 **/
extern NSString *const fd_listMethod;

#pragma mark- 私有API

/** 获取我的银行卡列表 **/
extern NSString *const bankcardList;
/** 删除银行卡 **/
extern NSString *const deleteBankcard;
/** 获取银行列表 **/
extern NSString *const bankList;
