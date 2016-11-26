//
//  UCInformationViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCInformationViewModel.h"
#import "UCInformationPortraitCell.h"
#import "UCInformationSignCell.h"
#import "UCInformationOtherCell.h"

@implementation UCInformationViewModel

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    if ([cell isKindOfClass:[UCInformationPortraitCell class]]) {
        
    }else if ([cell isKindOfClass:[UCInformationSignCell class]]) {
        
    }else if ([cell isKindOfClass:[UCInformationOtherCell class]]) {
        UCInformationOtherCell *otherCell = (UCInformationOtherCell *)cell;
        if (1 == row) {
            otherCell.titleLabel.text = @"昵称";
        }else if (2 == row ) {
            otherCell.titleLabel.text = @"性别";
        }else if (3 == row) {
            otherCell.titleLabel.text = @"生日";
        }
    }
}


@end
