//
//  FMPayTypeViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"
#import "FMModel.h"

@interface FMPayTypeViewModel : BaseRequestViewModel

@property (nonatomic, strong) NSArray *payTypeArray;

- (void)requestForPayTyeCompletion:(void(^)(NSInteger status))completion;

- (void)payWithParams:(NSDictionary *)params completion:(void(^)(NSInteger status))completion;

@end
