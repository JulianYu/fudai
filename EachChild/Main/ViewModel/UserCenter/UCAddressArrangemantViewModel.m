//
//  UCAddressArrangemantViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddressArrangemantViewModel.h"
#import "UCAddressArrangemantViewController.h"
#import "UCEditAddressViewController.h"

@interface UCAddressArrangemantViewModel ()

@property (nonatomic, strong) UCAddressArrangemantViewController *viewController;

@end

@implementation UCAddressArrangemantViewModel
- (instancetype)initWithViewController:(BaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[UCAddressArrangemantViewController class]]) {
            self.viewController = (UCAddressArrangemantViewController *)viewController;
        }
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UCEditAddressViewController *vc = [self.viewController.storyboard instantiateViewControllerWithIdentifier:@"edit_vc"];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

@end
