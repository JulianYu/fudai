//
//  UCSettingViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCSettingViewController.h"
#import "UCSettingViewModel.h"
#import "UCSettingCell.h"
#import "UCVersionCell.h"

static NSString *settingCellID = @"UCSettingCellID";
static NSString *versionCellID = @"UCVersionCellID";

@interface UCSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UCSettingViewModel *viewModel;

@end

@implementation UCSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 16)];
    regNib(self.tableView, @"UCSettingCell", settingCellID)
    regNib(self.tableView, @"UCVersionCell", versionCellID)
    self.tableView.sectionHeaderHeight = 16;
    self.tableView.sectionFooterHeight = 0;
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ( 0 == section) {
        return 1;
    }
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (1 == section && 2 == row) {
        UCVersionCell *cell = [tableView dequeueReusableCellWithIdentifier:versionCellID];
        return cell;
    }
    UCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCellID];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel tableView:tableView didSelectRowAtIndexPath:indexPath];
}
- (void)configureCell:(UCSettingCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel configureCell:cell atIndexPath:indexPath];
}


- (UCSettingViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCSettingViewModel alloc] initWithViewController:self];
    }
    return _viewModel;
}

@end
