//
//  FMFudaiMarketViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FMFudaiMarketViewModel.h"


@implementation FMFudaiMarketViewModel

- (void)requestForSlidesShowWithCompletion:(void (^)(NSArray<SlidesShow *> *, NSInteger))completion
{
    [self.httpManager POST:PublicApi(sc_bannersMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        
        NSArray *array = nil;
        if (1 == status) {
            NSArray *data = response[@"data"];
            array = [SlidesShow mj_objectArrayWithKeyValuesArray:data];
            
        }else {
            [NSObject showHudTipStr:msg];
        }
        completion(array, status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, -1);
        [NSObject showHudTipError:error];
    }];
}
- (void)requestForFudaiListWithCompletion:(void (^)(NSArray<FMFudai *> *, NSInteger))completion
{
    
    [self.httpManager POST:PublicApi(fd_listMethod) parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg) {
        NSArray *fudaiArray = nil;
        if (1 == status) {
            fudaiArray = [FMFudai mj_objectArrayWithKeyValuesArray:response[@"data"]];
        }else {
            [NSObject showHudTipStr:msg];
        }
        completion(fudaiArray, status);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, -1);
    }];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
