//
//  UCAreaViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAreaViewController.h"
#import "UCAddAddressViewModel.h"
#import "UCAreaCell.h"

@implementation SelectedAddress
@end

static NSString *cellID = @"cellID";

@interface UCAreaViewController ()
@property (nonatomic, strong) SelectedAddress *address;
@property (nonatomic, copy) AddressBlock addressBlock;

@property (nonatomic, strong) UCAddAddressViewModel *viewModel;

@end

@implementation UCAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    regNib(self.tableView, @"UCAreaCell", cellID)
    [self requestForAreaWithArea:nil];
}

- (void)requestForAreaWithArea:(Area *)area {
    [self.viewModel requestForAreaWithParentID:area.area_id completion:^(NSInteger status) {
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
    UCAreaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.area = self.viewModel.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Area *area = self.viewModel.dataArray[indexPath.row];
    NSLog(@"parent id is: %@", area.parent_id);
    if ([area.parent_id isEqualToString:@"0"]) {
        self.address.province = area;
        [self requestForAreaWithArea:area];
    }else if ([area.parent_id isEqualToString:self.address.province.area_id]) {
        self.address.city = area;
        [self requestForAreaWithArea:area];
    }else if([area.parent_id isEqualToString:self.address.city.area_id]) {
        self.address.county = area;
        self.addressBlock(_address);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (SelectedAddress *)address {
    if (!_address) {
        _address = [[SelectedAddress alloc] init];
    }
    return _address;
}

- (void)didSelectedAddress:(AddressBlock)block {
    self.addressBlock = block;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UCAddAddressViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCAddAddressViewModel alloc] init];
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
