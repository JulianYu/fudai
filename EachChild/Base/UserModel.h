//
//  UserModel.h
//  StockRight
//
//  Created by mac on 16/10/17.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseModel.h"
#import "PublicModel.h"


@interface UserModel : BaseModel

+ (instancetype)shareInstance;


@property (nonatomic, copy) NSString *oauth_secret;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *pay_password_stat; //
//@property (nonatomic, strong) USER *user;
//@property (nonatomic, strong) UIImage *portrait;

//- (void)loginWithSession:(SESSION *)session user:(USER *)user;
- (void)logout;

@end
