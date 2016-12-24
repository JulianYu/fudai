//
//  AgreementViewModel.h
//  StockRight
//
//  Created by 虞军军 on 16/12/6.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface AgreementViewModel : BaseRequestViewModel

- (void)sendRequestToGetURLString:(void(^)(NSString *urlString))completion;

@end
