//
//  UCBankListViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCBankListViewController.h"
#import "UCBankListViewModel.h"
#import "UCBankCell.h"

@interface UCBankListViewController ()

@property (nonatomic, strong) UCBankListViewModel *viewModel;

@property (nonatomic, copy) BankBlock bankBlock;

@end

@implementation UCBankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestForBankList];
}
- (void)requestForBankList {
    @weakify(self);
    [self.viewModel requestForBankList:^(NSInteger status) {
        @strongify(self);
        if (1 == status) {
            [self.tableView reloadData];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectedBank:(BankBlock)bank {
    self.bankBlock = bank;
}
#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UCBankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bankCellID"];
    [self configureCell:cell withBank:self.viewModel.dataArray[indexPath.row]];
    return cell;
}
- (void)configureCell:(UCBankCell *)cell withBank:(BANK *)bank {
    cell.bankLabel.text = bank.bankname;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BANK *bank = self.viewModel.dataArray[indexPath.row];
    self.bankBlock(bank);
    [self.navigationController popViewControllerAnimated:YES];
}

- (UCBankListViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCBankListViewModel alloc] init];
    }
    return _viewModel;
}


@end
