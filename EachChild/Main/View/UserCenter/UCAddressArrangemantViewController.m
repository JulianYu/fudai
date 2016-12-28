//
//  UCAddressArrangemantViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddressArrangemantViewController.h"
#import "UCAddressArrangemantViewModel.h"
#import "UCAddressListCell.h"
#import "UCEditAddressViewController.h"
#import "UCAddAddressViewController.h"

static NSString *listCellID = @"UCAddressListCellID";

@interface UCAddressArrangemantViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UCAddressArrangemantViewModel *viewModel;

@end

@implementation UCAddressArrangemantViewController

- (void)rightButtonOnClicked:(UIBarButtonItem *)rightItem {
    UCAddAddressViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"add_vc"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收货地址管理";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"uc_address_arrangemant_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonOnClicked:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    regNib(self.tableView, @"UCAddressListCell", listCellID);
    self.tableView.rowHeight = 90;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewModel requestForAddressList:^(NSInteger status) {
        if (1 == status) {
            [self.tableView reloadData];
        }
    }];
}


#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UCAddressListCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellID];
    cell.address = self.viewModel.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UCEditAddressViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"edit_vc"];
    vc.address = self.viewModel.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UCAddressArrangemantViewModel *)viewModel {
    if (!_viewModel) {
        
        _viewModel = [[UCAddressArrangemantViewModel alloc] init];
    }
    return _viewModel;
}



@end
