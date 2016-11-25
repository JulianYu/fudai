//
//  UCUserOtherCell.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCUserOtherCell.h"
#import "CellHeader.h"
#import "NSObject+conversion.h"

@interface UCUserOtherCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation UCUserOtherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    @weakify(self);
    [RACObserve(self, type) subscribeNext:^(id x) {
        @strongify(self);
        [self setupWithType: [x toInteger]];
    }];
}

- (void)setupWithType:(UCUserOtherCellType)type {
    NSString *imgString;
    NSString *titleString;
    switch (type) {
        case UCUserOtherCellTypeMyFudai:
            imgString = @"uc_my_fudai";
            titleString = @"我的福袋";
            break;
        case UCUserOtherCellTypeConfirmedFudai:
            imgString = @"uc_confirm_fudai";
            titleString = @"已确认的福袋";
            break;
        case UCUserOtherCellTypeMyDelegation:
            imgString = @"uc_my_delegation";
            titleString = @"我的挂单";
            break;
        case UCUserOtherCellTypeMyWallet:
            imgString = @"uc_my_fudai";
            titleString = @"我的钱包";
            break;
        case UCUserOtherCellTypeMyAccumulatingPoints:
            imgString = @"uc_accumulate_points";
            titleString = @"我的积分";
            break;
        case UCUserOtherCellTypeAddressManagement:
            imgString = @"uc_address";
            titleString = @"地址管理";
            break;
        case UCUserOtherCellTypeAccountSetting:
            imgString = @"uc_setting";
            titleString = @"账户设置";
            break;
            
            
        default:
            break;
    }
    self.imgView.image = [UIImage imageNamed:imgString];
    self.titleLabel.text = titleString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
