//
//  UCUserOtherCell.h
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UCUserOtherCellType) {
    UCUserOtherCellTypeMyFudai,
    UCUserOtherCellTypeConfirmedFudai,
    UCUserOtherCellTypeMyDelegation,
    UCUserOtherCellTypeMyWallet,
    UCUserOtherCellTypeMyAccumulatingPoints,
    UCUserOtherCellTypeAddressManagement,
    UCUserOtherCellTypeAccountSetting
    
};

@interface UCUserOtherCell : UITableViewCell

@property (nonatomic, assign) UCUserOtherCellType type;

@end
