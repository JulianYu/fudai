//
//  FMFudaiMarketViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FMFudaiMarketViewController.h"
#import "SDCycleScrollView.h"
#import "FMFudaiCell.h"
#import "FlowLayout.h"

static NSString *cellID = @"FMFudaiCellID";

@interface FMFudaiMarketViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FMFudaiMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"市场";
    NSArray *imageNames = @[@"im_gallery01",@"im_gallery02",@"im_gallery03"];
    // 本地加载 --- 创建不带标题的图片轮播器
    SDCycleScrollView *galleryView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, 320, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    galleryView.delegate = self;
    galleryView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    galleryView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.view addSubview:galleryView];
    @weakify(self);
    [galleryView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.height.mas_equalTo(180);
    }];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FMFudaiCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FMFudaiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark- layout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(self.view.frame.size.width*0.5, self.view.frame.size.width *0.4);
//    
//}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(16, 8, 16, 8);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 80;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}



@end
