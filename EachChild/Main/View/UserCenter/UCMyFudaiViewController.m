//
//  UCMyFudaiViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCMyFudaiViewController.h"
#import "UCMyFudaiCell.h"
#import "UCMyFudaiViewModel.h"

static NSString *cellID = @"UCMyFudaiCellID";

@interface UCMyFudaiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UCMyFudaiViewModel *viewModel;


@end

@implementation UCMyFudaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的福袋";
    
    regNib(self.tableView, @"UCMyFudaiCell", cellID);
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    @weakify(self);
    [self.viewModel requestForMyFudaiListWithCompletion:^(NSInteger status) {
        if (1 == status) {
            @strongify(self);
            [self.tableView reloadData];
        }
    }];
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UCMyFudaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.order = self.viewModel.dataArray[row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UCFudaiOrder *order =[self.viewModel.dataArray objectAtIndex:indexPath.row];
    return 72+120+order.fu_dai.goodsList.count * 60;
}

- (UCMyFudaiViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCMyFudaiViewModel alloc] init];
    }
    return _viewModel;
}


@end
