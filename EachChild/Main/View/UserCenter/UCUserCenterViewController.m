//
//  UCUserCenterViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCUserCenterViewController.h"
#import "UCUserCenterViewModel.h"
#import "UCUserInfoCell.h"
#import "UCUserWalletCell.h"
#import "UCUserOtherCell.h"


static NSString *infoCellID = @"UCUserInfoCellID";
static NSString *walletCellID = @"UCUserWalletCell";
static NSString *otherCellID = @"UCUserOtherCell";

@interface UCUserCenterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UCUserCenterViewModel *viewModel;

@end

@implementation UCUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    // Do any additional setup after loading the view from its nib.
    regNib(self.tableView, @"UCUserInfoCell", infoCellID)
    regNib(self.tableView, @"UCUserWalletCell", walletCellID)
    regNib(self.tableView, @"UCUserOtherCell", otherCellID)
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (0 == row) {
        UCUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
        return cell;
    }else if (1 == row) {
        UCUserWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:walletCellID];
        return cell;
    }else {
        UCUserOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:otherCellID];
        return cell;
    }
    
}

- (UCUserCenterViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCUserCenterViewModel alloc] init];
    }
    return _viewModel;
}

@end
