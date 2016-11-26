//
//  UCSettingViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCSettingViewModel.h"


@implementation UCSettingViewModel

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)configureCell:(UCSettingCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (0 == section) {
        cell.titleLabel.text = @"修改密码";
    }else {
        if (0 == row) {
            cell.titleLabel.text = @"建议反馈";
        }else if (1 == row) {
            cell.titleLabel.text = @"关于我们";
        }
    }
}

@end
