//
//  InitialRequestViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface InitialRequestViewModel : BaseRequestViewModel

- (void)requestForBaseImageUrl:(void(^)(NSString *url, NSInteger stauts))url;

@end
