//
//  UCBankcardCell.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCBankcardCell.h"

@interface UCBankcardCell ()

@property (strong, nonatomic) IBOutlet UILabel *banknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *realnameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardNumLabel;


@end

@implementation UCBankcardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setBankcard:(BANKCARD *)bankcard
{
    _bankcard = bankcard;
    [self setupWithBankcard:bankcard];
    
}
- (void)setupWithBankcard:(BANKCARD *)bankcard
{
    self.banknameLabel.text = bankcard.bankfullname;
    self.realnameLabel.text = bankcard.realname;
    self.cardNumLabel.text = bankcard.cardnum;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
