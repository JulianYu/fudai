//
//  RequestsModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "RequestMethodsModel.h"

#pragma mark- 登录注册API OauthApi
/** 发送注册时手机验证码 **/
 NSString *const sendMobileCodeMethod = @"sendMobileCode";
/** 用户注册 **/
 NSString *const registerMethod = @"register";
/** 用户登录 **/
 NSString *const authorizeMethod = @"authorize";


#pragma mark- 公共API PublicApi
/** 首页-地区 **/
NSString *const getAreaMethod = @"getArea";
/** app首页获取所有目录分类 **/
NSString *const getCategoryListTopMethod = @"getCategoryListTop";
/** 商家详情 **/
 NSString *const sellerDetailMethod = @"sellerDetail";
/** 商家列表 **/
 NSString *const sellerListMethod = @"sellerList";
/** 首页统计chart  **/
 NSString *const index_fd_chartMethod = @"index_fd_chart";
/** 福袋市场slide banner **/
 NSString *const sc_bannersMethod = @"sc_banners";
/** 首页slide banner **/
 NSString *const index_bannersMethod = @"index_banners";

/** 市场 福袋列表接口 **/
NSString *const fd_listMethod = @"fd_list";

#pragma mark- 私有API

NSString *const bankcardListMethod = @"";
NSString *const deleteBankcard = @"";
NSString *const bankList = @"";
