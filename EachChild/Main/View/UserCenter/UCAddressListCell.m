//
//  UCAddressListCell.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddressListCell.h"
#import "UCAreaViewController.h"

@interface UCAddressListCell ()

@property (strong, nonatomic) IBOutlet UILabel *acceptNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *mobileLabel;
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;


@end

@implementation UCAddressListCell

- (void)setAddress:(ADDRESS *)address {
    _address = address;
    [self setupWithAddress:address];
}
- (void)setupWithAddress:(ADDRESS *)address {
    _acceptNameLabel.text = address.accept_name;
    _mobileLabel.text = address.mobile;
    _areaLabel.text = [NSString stringWithFormat:@"%@ %@ %@", address.province,address.city,address.area];
    _addressLabel.text = address.address;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
