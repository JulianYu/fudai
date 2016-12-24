//
//  public.h
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#ifndef public_h
#define public_h

#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "UserModel.h"
#import "NSObject+conversion.h"
#import "UIView+frame.h"
#import "NSString+regularExpression.h"
#import "MJExtension.h"
#import "NSObject+Common.h"

#define colorWithRGB(r,g,b) [UIColor colorWithRed:r%255/255.0f green:g%255/255.0f blue:b%255/255.0f alpha:1.0f]

#define regNib(tableView, name, cellID) [tableView registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:cellID];
#define RegisterCell(cell, cellId) regNib(_tableView, cell, cellId)

#define local 1

#ifndef kBaseUrl
#if local
#define kBaseUrl @"http://192.168.1.230/fudai/index.php"//@"http://192.168.1.111/fudai"
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



#endif /* public_h */
