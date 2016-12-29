//
//  UCMyFudaiCell.h
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UCFudaiModel.h"

@interface UCMyFudaiCell : UITableViewCell

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong, setter=setOrder:) UCFudaiOrder *order;

@end
