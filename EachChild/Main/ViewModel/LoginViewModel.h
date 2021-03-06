//
//  LoginViewModel.h
//  StockRight
//
//  Created by 虞军军 on 16/10/22.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface LoginViewModel : BaseRequestViewModel

@property (nonatomic, strong) RACSignal *requestSignal; //网络请求信号量
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;

- (void)onRegister;
- (void)loginWithCompletion:(void(^)(NSInteger status))completion;

- (void)requestForRongCloudTokenWithCompletion:(void(^)(NSInteger status))completion;
- (void)syncFriendList:(void(^)(NSMutableArray *friends,BOOL isSuccess))friendList;

@end
