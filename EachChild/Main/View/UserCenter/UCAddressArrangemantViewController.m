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

#import "UCAddAddressViewController.h"

static NSString *listCellID = @"UCAddressListCellID";

@interface UCAddressArrangemantViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UCAddressArrangemantViewModel *viewModel;

@end

@implementation UCAddressArrangemantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收货地址管理";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"uc_address_arrangemant_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonOnClicked:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    regNib(self.tableView, @"UCAddressListCell", listCellID);
    self.tableView.rowHeight = 90;
    
    
    
}
- (void)rightButtonOnClicked:(UIBarButtonItem *)rightItem {
    UCAddAddressViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"add_vc"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UCAddressListCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellID];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (UCAddressArrangemantViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCAddressArrangemantViewModel alloc] initWithViewController:self];
    }
    return _viewModel;
}



@end
