//
//  FMPayTypeCell.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FMPayTypeCell.h"
#import <UIImageView+WebCache.h>

@interface FMPayTypeCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation FMPayTypeCell

- (void)setPayType:(FMPayType *)payType {
    _payType = payType;
    [self contentWithType:payType];
}

- (void)contentWithType:(FMPayType *)payType {
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:payType.logo]];
    self.titleLabel.text = payType.name;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
