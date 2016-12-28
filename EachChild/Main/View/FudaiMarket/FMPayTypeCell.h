//
//  FMPayTypeCell.h
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMModel.h"

@interface FMPayTypeCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *selectingBtn;

@property (nonatomic, setter=setPayType:) FMPayType *payType;

@end
