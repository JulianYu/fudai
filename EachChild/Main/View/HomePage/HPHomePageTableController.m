//
//  HPHomePageTableController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "HPHomePageTableController.h"
#import "HPHomePageViewModel.h"
#import "SDCycleScrollView.h"
#import "ConfigModel.h"

@interface HPHomePageTableController ()<SDCycleScrollViewDelegate/*,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout*/>
@property (strong, nonatomic) IBOutlet SDCycleScrollView *slideView;
//@property (strong, nonatomic) IBOutlet UICollectionView *listView;

@property (nonatomic, strong) HPHomePageViewModel *viewModel;

@end

@implementation HPHomePageTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _slideView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _slideView.currentPageDotColor = [UIColor whiteColor];
    _slideView.autoScrollTimeInterval = 3.f;
    UIBarButtonItem *testItem = [[UIBarButtonItem alloc] initWithTitle:@"TEST" style:UIBarButtonItemStyleDone target:self action:@selector(apiTestStoryboard)];
    self.navigationItem.rightBarButtonItem = testItem;
    
}
- (void)apiTestStoryboard {
    UIViewController *vc = [UIStoryboard storyboardWithName:@"APITestStoryboard" bundle:nil].instantiateInitialViewController;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestForSlidesShow];
}
- (void)requestForSlidesShow {
    [self.viewModel requestForSlidesShowWithCompletion:^(NSArray<SlidesShow *> *slideShowArray, NSInteger status) {
        
        __block NSMutableArray *imgsArray = [[NSMutableArray alloc] init];
        [slideShowArray enumerateObjectsUsingBlock:^(SlidesShow * slidesShow, NSUInteger idx, BOOL *  stop) {
            NSString *imgUri = [NSString stringWithFormat:@"%@%@",[ConfigModel config].imageUri, slidesShow.img];
            [imgsArray addObject:imgUri];
        }];
        _slideView.imageURLStringsGroup = [imgsArray copy];
    }];
}
#pragma mark- UITableViewDelegate, UITableViewDataSource



//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 2;
//}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 10;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"listCellID" forIndexPath:indexPath];
//    return cell;
//}


- (HPHomePageViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HPHomePageViewModel alloc] init];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
