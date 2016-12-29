//
//  RequestMethodsModel.h
//  EachChild

//
//  Created by 虞军军 on 16/12/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"


#define local 1

#ifndef kBaseUrl
#if local
#define kBaseUrl @"http://192.168.1.102/fudai"
//#define kBaseUrl @"http://192.168.1.230/fudai/index.php"
#else
#define kBaseUrl @""
#endif
#endif

//#define kBaseImgUrl [NSString stringWithFormat:@"%@/",kBaseUrl]

/** 开放API **/
#define PublicApi(method_name) [NSString stringWithFormat:@"%@/PublicApi/%@",kBaseUrl, method_name]
/** 私有API **/
#define UcenterApi(method_name) [NSString stringWithFormat:@"%@/UcenterApi/%@",kBaseUrl, method_name]
/** 第三方登录API **/
#define OauthApi(method_name) [NSString stringWithFormat:@"%@/OauthApi/%@",kBaseUrl, method_name]

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
/** base image url **/
extern NSString *const getWebHostMethod;

#pragma mark- 私有API
/** 我-系统设置-注销 **/
extern NSString *const logoutMethod;
/** 我-系统设置-修改密码 **/
extern NSString *const password_editMethod;
/** 我-系统设置-建议反馈 **/
extern NSString *const complain_sendMethod;
/** 市场-支付方式 **/
extern NSString *const paymentlistMethod;
/** 支付 **/
extern NSString *const fdOrderRedoActionMethod;

/** 支付 **/
extern NSString *const PayMethod;

/** 我-银行卡-获取我的银行卡列表 **/
extern NSString *const bank_card_listMethod;
/** 我-银行卡-删除银行卡 **/
extern NSString *const bank_card_delMethod;
/** 我-银行卡-获取银行列表 **/
extern NSString *const bank_listMethod;
extern NSString *const bank_card_addMethod;
/** 我-地址管理-地址列表 **/
extern NSString *const addressMethod;
/** 我-地址管理-添加地址 **/
extern NSString *const address_editMethod;
/** 我-地址管理-删除地址 **/
extern NSString *const address_delMethod;
/** 我-地址管理-默认地址 **/
extern NSString *const set_default_addressMethod;
/** 我-修改支付密码-验证码 **/
extern NSString *const payPwdModifysendCodeMethod;
/** 我-修改支付密码**/
extern NSString *const Paypassword_editMethod;
/** 我-我的福袋 **/
extern NSString *const myFudaiOrderMethod;
/** 我-我的福袋-确认购买 **/
extern NSString *const fdOrderConfirmBuyActionMethod;
/** 我-已确认福袋 **/
extern NSString *const myConfirmFudaiOrderMethod;
/** 我-我的挂单列表 **/
extern NSString *const myHoldFudaiOrderMethod;




















