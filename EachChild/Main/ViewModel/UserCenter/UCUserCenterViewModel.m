//
//  UCUserCenterViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCMyFudaiViewController.h"

#import "UCInformationViewController.h"

#import "UCConfirmedFudaiViewController.h"
#import "UCDelegationViewController.h"
#import "UCAcumulatingPointsViewController.h"
#import "UCAddressArrangemantViewController.h"
#import "UCSettingViewController.h"

#import "UCUserInfoCell.h"
#import "UCUserWalletCell.h"
#import "UCUserOtherCell.h"

const CGFloat UCUserInfoCellHeight = 150;
const CGFloat UCUserWalletCellHeight = 90;
const CGFloat UCUserOtherCellHeight = 48;

#import "UCUserCenterViewModel.h"
#import "UCUserCenterViewController.h"

@interface UCUserCenterViewModel ()

@property (nonatomic, strong) UCUserCenterViewController *viewController;

@end

@implementation UCUserCenterViewModel
- (instancetype)initWithViewController:(BaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[UCUserCenterViewController class]]) {
            self.viewController = (UCUserCenterViewController *)viewController;
        }
    }
    return self;
}

- (void)configCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    @weakify(self);
    if ([cell isKindOfClass:[UCUserInfoCell class]]) {
        UCUserInfoCell *infoCell = (UCUserInfoCell *)cell;
        [[[infoCell.infoButton rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:infoCell.rac_prepareForReuseSignal] subscribeNext:^(id x) {
            @strongify(self);
            UCInformationViewController  *vc = [[UCInformationViewController alloc] initWithNibName:@"UCInformationViewController" bundle:nil];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }];
    }else if ([cell isKindOfClass:[UCUserWalletCell class]]) {
//        UCUserWalletCell *walletCell = (UCUserWalletCell *)cell;
        
    }else {
        UCUserOtherCell *otherCell = (UCUserOtherCell *)cell;
        if (2== row) {
            otherCell.type = UCUserOtherCellTypeMyFudai;
        }else if (3 == row) {
            otherCell.type = UCUserOtherCellTypeConfirmedFudai;
        }else if (4 == row) {
            otherCell.type = UCUserOtherCellTypeMyDelegation;
        }else if (5 == row) {
            otherCell.type = UCUserOtherCellTypeMyWallet;
        }else if (6 == row) {
            otherCell.type = UCUserOtherCellTypeMyAccumulatingPoints;
        }else if (7 == row) {
            otherCell.type = UCUserOtherCellTypeAddressManagement;
        }else if (8 == row) {
            otherCell.type = UCUserOtherCellTypeAccountSetting;
        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSInteger row = indexPath.row;
    if (2== row) {
        UCMyFudaiViewController *vc = [[UCMyFudaiViewController alloc] initWithNibName:@"UCMyFudaiViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
        
    }else if (3 == row) {
        UCConfirmedFudaiViewController *vc = [[UCConfirmedFudaiViewController alloc] initWithNibName:@"UCConfirmedFudaiViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }else if (4 == row) {
        UCDelegationViewController *vc = [[UCDelegationViewController alloc] initWithNibName:@"UCDelegationViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }else if (5 == row) {
        UCMyFudaiViewController *vc = [[UCMyFudaiViewController alloc] initWithNibName:@"UCMyFudaiViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }else if (6 == row) {
        UCAcumulatingPointsViewController *vc = [[UCAcumulatingPointsViewController alloc] initWithNibName:@"UCAcumulatingPointsViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }else if (7 == row) {
        UCAddressArrangemantViewController *vc = [[UCAddressArrangemantViewController alloc] initWithNibName:@"UCAddressArrangemantViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }else if (8 == row) {
        UCSettingViewController *vc = [[UCSettingViewController alloc] initWithNibName:@"UCSettingViewController" bundle:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (0 == row) {
        return UCUserInfoCellHeight;
    }else if (1 == row) {
        return UCUserWalletCellHeight;
    }else
        return UCUserOtherCellHeight;
}

@end
