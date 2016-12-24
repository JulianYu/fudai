//
//  UCInformationViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCInformationViewController.h"
#import "UCInformationViewModel.h"

#import "UCInformationPortraitCell.h"
#import "UCInformationSignCell.h"
#import "UCInformationOtherCell.h"

static NSString *portraitCellID = @"UCInformationPortraitCellID";
static NSString *signCellID = @"UCInformationSignCellID";
static NSString *otherCellID = @"UCInformationOtherCellID";

@interface UCInformationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UCInformationViewModel *viewModel;

@end

@implementation UCInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人信息";
    regNib(self.tableView, @"UCInformationPortraitCell", portraitCellID);
    regNib(self.tableView, @"UCInformationSignCell", signCellID);
    regNib(self.tableView, @"UCInformationOtherCell", otherCellID);
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (0 == row) {
        UCInformationPortraitCell *cell = [tableView dequeueReusableCellWithIdentifier:portraitCellID];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }else if (4 == row) {
        UCInformationSignCell *cell = [tableView dequeueReusableCellWithIdentifier:signCellID];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }
    
    UCInformationOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:otherCellID];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (0 == row) {
        return 64;
    }
    return 48;
}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel configureCell:cell atIndexPath:indexPath];
}

- (UCInformationViewModel *)viewModel {
    if (!_viewModel) {
        __weak typeof(self) weakself = self;
        _viewModel = [[UCInformationViewModel alloc] initWithViewController:weakself];
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
