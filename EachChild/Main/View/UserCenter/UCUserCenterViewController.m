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
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (0 == row) {
        UCUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
        [self configCell:cell atIndexPath:indexPath];
        return cell;
    }else if (1 == row) {
        UCUserWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:walletCellID];
        [self configCell:cell atIndexPath:indexPath];
        return cell;
    }else {
        UCUserOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:otherCellID];
        [self configCell:cell atIndexPath:indexPath];
        return cell;
    }
    
}
- (void)configCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel configCell:cell atIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.viewModel tableView:tableView heightForRowAtIndexPath:indexPath];
}


- (UCUserCenterViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCUserCenterViewModel alloc] initWithViewController:self];
    }
    return _viewModel;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
