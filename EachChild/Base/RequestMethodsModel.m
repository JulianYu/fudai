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

NSString *const getWebHostMethod = @"getWebHost";

#pragma mark- 私有API
/** 注销 **/
NSString *const logoutMethod = @"logout";
/** 我-系统设置-修改密码 **/
NSString *const password_editMethod = @"password_edit";
/** 我-系统设置-建议反馈 **/
NSString *const complain_sendMethod = @"complain_send";
NSString *const paymentlistMethod = @"paymentlist";
NSString *const fdOrderRedoActionMethod = @"fdOrderRedoAction";

NSString *const PayMethod = @"Pay";

NSString *const bank_card_listMethod = @"bank_card_list";
NSString *const bank_card_delMethod = @"bank_card_del";
NSString *const bank_listMethod = @"bank_list";
NSString *const bank_card_addMethod = @"bank_card_add";
/** 我-地址管理-地址列表 **/
NSString *const addressMethod = @"address";
/** 我-地址管理-添加地址 **/
NSString *const address_editMethod = @"address_edit";
/** 我-地址管理-删除地址 **/
NSString *const address_delMethod = @"address_del";
/** 我-地址管理-默认地址 **/
NSString *const set_default_addressMethod = @"set_default_address";
/** 我-修改支付密码 **/
NSString *const payPwdModifysendCodeMethod = @"payPwdModifysendCode";
/** 我-修改支付密码**/
NSString *const Paypassword_editMethod = @"Paypassword_edit";
/** 我-我的福袋 **/
NSString *const myFudaiOrderMethod = @"myFudaiOrder";
/** 我-我的福袋-确认购买 **/
NSString *const fdOrderConfirmBuyActionMethod = @"fdOrderConfirmBuyAction";
/** 我-已确认福袋 **/
NSString *const myConfirmFudaiOrderMethod = @"myConfirmFudaiOrder";
/** 我-我的挂单列表 **/
NSString *const myHoldFudaiOrderMethod = @"myHoldFudaiOrder";
/** 融云-刷新用户信息 **/
NSString *const rongcloudUserRefreshMethod = @"rongcloudUserRefresh";
/** 融云-获取token **/
NSString *const getRongcloudTokenMethod = @"getRongcloudToken";

/** 融云-获取好友列表 **/
NSString *const friendsMethod = @"friends";
/** 融云-获取好友请求列表 **/
NSString *const wFriendMethod = @"wFriend";
/** 融云-请求加好友 **/
NSString *const friendUserIdMethod = @"friendUserId";
/** 融云-同意加好友 **/
NSString *const byFriendUserIdMethod = @"byFriendUserId";
/** 融云-删除好友 **/
NSString *const del_FriendMethod = @"del_Friend";
/** 融云-搜索用户 **/
NSString *const UserbySearchMethod = @"UserbySearch";








