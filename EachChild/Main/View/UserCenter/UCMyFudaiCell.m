//
//  UCMyFudaiCell.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCMyFudaiCell.h"
#import "public.h"
#import "UCMyFudaiCellView.h"


@interface UCMyFudaiCell ()

@property (strong, nonatomic) IBOutlet UIView *itemsView;



@end

@implementation UCMyFudaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}
- (void)layoutSubviews {
    [self clearSubviews:self.itemsView];
    @weakify(self);
    [RACObserve(self, dataArray) subscribeNext:^(NSArray *data) {
        @strongify(self);
        if (data.count) {
            int offset = 0;
            for (NSNumber *item in data) {
                UCMyFudaiCellView *view = [[UCMyFudaiCellView alloc] init];
                
                [self.itemsView addSubview:view];
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.itemsView.mas_left);
                    make.right.equalTo(self.itemsView.mas_right);
                    make.height.mas_equalTo(60);
                    make.top.equalTo(self.itemsView.mas_top).with.offset(offset);
                }];
                offset += 60;
            }
        }
        
        
    }];
}

- (void)clearSubviews:(UIView *)view {
    for (UIView *item in view.subviews) {
        [item removeFromSuperview];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
