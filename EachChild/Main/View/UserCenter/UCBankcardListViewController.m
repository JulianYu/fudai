//
//  BankcardListViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCBankcardListViewController.h"
#import "UCBankcardListViewModel.h"
#import "UCBankcardCell.h"

static NSString *bankcardCellID = @"UCBankcardCellID";

@interface UCBankcardListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *_currentIndexPath;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UCBankcardListViewModel *viewModel;



@end

@implementation UCBankcardListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的银行卡";
    
    regNib(self.tableView, @"UCBankcardCell", bankcardCellID)
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestForBankcardList];
}

- (void)requestForBankcardList {
    [self.viewModel requestForBankcardListWithCompeltion:^(NSInteger status) {
        if (1 == status) {
            if (self.viewModel.dataArray.count <= 0) {
                [UIView animateWithDuration:.4f animations:^{
                    self.tableView.alpha = 0;
                }];
            }else {
                self.tableView.alpha = 1;
                [self.tableView reloadData];
            }
        }
    }];
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UCBankcardCell *cell = [tableView dequeueReusableCellWithIdentifier:bankcardCellID];
    cell.bankcard = self.viewModel.dataArray[indexPath.row];
    UILongPressGestureRecognizer *lognGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    [cell addGestureRecognizer:lognGR];
    return cell;
}
#pragma mark -- UITableViewCell LongPressGesture Method
// 长按单元格事件
- (void)longPressGesture:(UIGestureRecognizer *)recongnizer
{
    UCBankcardCell *cell = (UCBankcardCell *)recongnizer.view;
    _currentIndexPath = [self.tableView indexPathForCell:cell];
    if (recongnizer.state == UIGestureRecognizerStateEnded)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"删除银行卡" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

#pragma mark -UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 确定
    if (buttonIndex == 1)
    {
        @weakify(self);
        NSInteger row = _currentIndexPath.row;
        BANKCARD *bankcard = self.viewModel.dataArray[row];
        [self.viewModel requestForDeletingBankcard:@{@"cardid":bankcard.id} withithCompletion:^(NSInteger status) {
            @strongify(self);
            if (1 == status) {
                [self.viewModel.dataArray removeObjectAtIndex:row];
                [self.tableView reloadData];
            }
        }];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UCBankcardListViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCBankcardListViewModel alloc] init];
    }
    return _viewModel;
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
