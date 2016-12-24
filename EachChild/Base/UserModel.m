//
//  UserModel.m
//  StockRight
//
//  Created by mac on 16/10/17.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UserModel.h"

@interface UserModel()



@end

@implementation UserModel

+ (instancetype)shareInstance {
    static UserModel *userModel =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userModel = [[UserModel alloc] init];
    });
    return userModel;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//        _session = [SESSION readFromUserDefaults:@"UserModel.session"];
//        _user = [USER readFromUserDefaults:@"UserModel.user"];
//        @weakify(self);
//        [RACObserve(self, user) subscribeNext:^(id x) {
//            @strongify(self);
//            if (x) {
//                [self update];
//            }
//        }];
    }
    return self;
}


- (void)update
{
    
}




//- (void)loginWithSession:(SESSION *)session user:(USER *)user
//{
//    if (self.session != session) {
//        _session = session;
//        [session saveToUserDefaults:@"UserModel.session"];
//    }    
//    self.user = user;
//    [user saveToUserDefaults:@"UserModel.user"];
//}

- (void)logout {
    
    
    
    
    
    
}


@end
