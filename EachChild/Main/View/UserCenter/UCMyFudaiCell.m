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
@property (strong, nonatomic) IBOutlet UILabel *orderNoLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *transportationFeeLabel;
@property (strong, nonatomic) IBOutlet UILabel *bribeMoneyLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalMoneyLabel;

@property (strong, nonatomic) IBOutlet UIView *itemsView;



@end

@implementation UCMyFudaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}
- (void)setOrder:(UCFudaiOrder *)order {
    _order = order;
    [self configCellWithOrder:order];
}
- (void)configCellWithOrder:(UCFudaiOrder *)order {
    self.orderNoLabel.text = order.fudai_order_no;
    self.timeLabel.text = order.pay_time;
    NSArray *goodsArray = order.fu_dai.goodsList;
    int offset = 0;
    for (UCFudaiGood *good in goodsArray) {
        UCMyFudaiCellView *view = [[UCMyFudaiCellView alloc] init];
        view.good = good;
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
//- (void)layoutSubviews {
//    [self clearSubviews:self.itemsView];
//    @weakify(self);
//    [RACObserve(self, dataArray) subscribeNext:^(NSArray *data) {
//        @strongify(self);
//        if (data.count) {
//            int offset = 0;
//            for (NSNumber *item in data) {
//                UCMyFudaiCellView *view = [[UCMyFudaiCellView alloc] init];
//                
//                [self.itemsView addSubview:view];
//                [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.left.equalTo(self.itemsView.mas_left);
//                    make.right.equalTo(self.itemsView.mas_right);
//                    make.height.mas_equalTo(60);
//                    make.top.equalTo(self.itemsView.mas_top).with.offset(offset);
//                }];
//                offset += 60;
//            }
//        }
//        
//        
//    }];
//}

- (void)clearSubviews:(UIView *)view {
    for (UIView *item in view.subviews) {
        [item removeFromSuperview];
    }
}

- (IBAction)viewingTransportaionAction:(UIButton *)sender {
}
- (IBAction)confirmAction:(id)sender {
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
