//
//  UCAreaViewController.h
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseTableViewController.h"

@interface SelectedAddress : BaseModel

@property (nonatomic, strong) Area *province;
@property (nonatomic, strong) Area *city;
@property (nonatomic, strong) Area *county;

@end
typedef void(^AddressBlock)(SelectedAddress *address);

@interface UCAreaViewController : BaseTableViewController


- (void)didSelectedAddress:(AddressBlock)block;

@end
