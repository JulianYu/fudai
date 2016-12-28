//
//  FMFudaiMarketViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"
#import "FMModel.h"

@interface FMFudaiMarketViewModel : BaseRequestViewModel


- (void)requestForSlidesShowWithCompletion:(void(^)(NSArray<SlidesShow *> *slideShowArray, NSInteger status))completion;
- (void)requestForFudaiListWithCompletion:(void(^)(NSArray<FMFudai *> *fudaiArray, NSInteger status))completion;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
