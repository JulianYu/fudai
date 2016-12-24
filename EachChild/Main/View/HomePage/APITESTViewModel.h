//
//  APITESTViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/23.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface APITESTViewModel : BaseRequestViewModel

+ (void)uCenterRequestWithMethod:(NSString *)method params:(NSDictionary *)params;

+ (void)publicApiRequestWithMethod:(NSString *)method params:(NSDictionary *)param;


@end
