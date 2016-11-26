//
//  UCSettingViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseViewModel.h"
#import "UCSettingCell.h"

@interface UCSettingViewModel : BaseViewModel

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UCSettingCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
