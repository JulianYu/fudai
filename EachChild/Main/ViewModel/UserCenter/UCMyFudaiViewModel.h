//
//  UCMyFudaiViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/12/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"


@interface UCMyFudaiViewModel : BaseRequestViewModel

@property (nonatomic, strong) NSArray *dataArray;

- (void)requestForMyFudaiListWithCompletion:(void(^)(NSInteger status))completion;


@end
