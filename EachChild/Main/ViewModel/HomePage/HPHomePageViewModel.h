//
//  HPHomePageViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"
#import "FMModel.h"

@interface HPHomePageViewModel : BaseRequestViewModel

- (void)requestForSlidesShowWithCompletion:(void (^)(NSArray<SlidesShow *> *, NSInteger))completion;

@end
