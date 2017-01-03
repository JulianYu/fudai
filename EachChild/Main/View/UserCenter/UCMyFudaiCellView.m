//
//  UCMyFudaiCellView.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCMyFudaiCellView.h"
#import "public.h"

@interface UCMyFudaiCellView ()

@property (nonatomic, strong) UIImageView *background;


@end

@implementation UCMyFudaiCellView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"uc_fudai_body"]];
        
        self.priceLabel = [[UILabel alloc] init];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 2;
        
    }
    return self;
}
- (void)setGood:(UCFudaiGood *)good {
    _good = good;
    _priceLabel.text = good.cost_price;
    _titleLabel.text = good.name;
}


- (void)layoutSubviews {
    [self addSubview:self.background];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
    @weakify(self);
    [self.background mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self).with.offset(8);
        make.left.equalTo(self).with.offset(16);
        make.width.mas_equalTo(200);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.right.mas_equalTo(self).with.offset(-16);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

@end
