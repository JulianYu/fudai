//
//  FMFudaiMarketViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FMFudaiMarketViewController.h"
#import "FMFudaiMarketViewModel.h"
#import "SDCycleScrollView.h"
#import "FMFudaiCell.h"
#import "FlowLayout.h"

static CGFloat const kGalleryHeight = 180;

static NSString *cellID = @"FMFudaiCellID";

@interface FMFudaiMarketViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    CGFloat _latestOffsetY;
    SDCycleScrollView *galleryView;
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *fudaiArray;
@property (nonatomic, strong) FMFudaiMarketViewModel *viewModel;

@end

@implementation FMFudaiMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"市场";
    
    
    galleryView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 320, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    galleryView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    galleryView.currentPageDotColor = [UIColor whiteColor];
    galleryView.autoScrollTimeInterval = 3.f;
    [self.view addSubview:galleryView];
    @weakify(self);
    [galleryView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.height.mas_equalTo(kGalleryHeight);
    }];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FMFudaiCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    
    FlowLayout *flowLayout = [[FlowLayout alloc] init];
    self.collectionView.collectionViewLayout = flowLayout;
    
    [self requestForSlidesShow];
    [self requestForFudaiList];
}
- (void)requestForSlidesShow {
    [self.viewModel requestForSlidesShowWithCompletion:^(NSArray<SlidesShow *> *slideShowArray, NSInteger status) {
        
        __block NSMutableArray *imgsArray = [[NSMutableArray alloc] init];
        [slideShowArray enumerateObjectsUsingBlock:^(SlidesShow * slidesShow, NSUInteger idx, BOOL *  stop) {
#warning 替换图片根地址
            NSString *imgUri = [NSString stringWithFormat:@"http://192.168.1.230/fudai/%@", slidesShow.img];
            [imgsArray addObject:imgUri];
        }];
        galleryView.imageURLStringsGroup = [imgsArray copy];
    }];
}

- (void)requestForFudaiList {
    @weakify(self);
    [self.viewModel requestForFudaiListWithCompletion:^(NSArray<FMFudai *> *fudaiArray, NSInteger status) {
        @strongify(self);
        if (1 == status) {
            self.fudaiArray = [NSMutableArray arrayWithArray:fudaiArray];
            [self.collectionView reloadData];
        }
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.fudaiArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FMFudaiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.fudai = self.fudaiArray[indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY =  scrollView.contentOffset.y - 180;
    offsetY = offsetY + kGalleryHeight;
    NSLog(@"collection view offset: %f", offsetY);
    galleryView.transform = CGAffineTransformMakeTranslation(0, -offsetY);
    if ((offsetY > 0) && (offsetY < kGalleryHeight)) {
    }
}


#pragma mark- layout

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"frame: %@", [NSValue valueWithCGRect:self.view.frame]);
//    return CGSizeMake(self.view.frame.size.width*0.5-24, self.view.frame.size.width *0.5-24);
//    
//}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (0 == section) {
        return UIEdgeInsetsMake(16+kGalleryHeight, 16, 8, 16);
    }else {
        
        return UIEdgeInsetsMake(8, 16, 8, 16);
    }
//    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
//    return flowLayout.sectionInset;
}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 16;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return CGFLOAT_MIN;
//}


- (FMFudaiMarketViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[FMFudaiMarketViewModel alloc] init];
    }
    return _viewModel;
}



@end
