//
//  UCAddressArrangemantViewModel.h
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@interface UCAddressArrangemantViewModel : BaseRequestViewModel

@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)requestForAddressList:(void(^)(NSInteger status))completion;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
