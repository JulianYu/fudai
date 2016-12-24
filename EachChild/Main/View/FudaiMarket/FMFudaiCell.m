//
//
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//




#import "FMFudaiCell.h"
#import <ReactiveCocoa.h>
#import <UIImageView+WebCache.h>

@interface FMFudaiCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation FMFudaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)layoutSubviews {
    @weakify(self);
    [RACObserve(self, fudai) subscribeNext:^(FMFudai *fudai) {
        @strongify(self);
//        NSString *imgStr = [NSString stringWithFormat:@"192.168.1.230/fudai/%@", fudai.img];
//        [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"fm_fudai_cell"]];
        self.priceLabel.text = [NSString stringWithFormat:@"%@元", fudai.price];
        
    }];
}


- (void)drawRect:(CGRect)rect {
    
    CGRect priceRect = self.priceLabel.bounds;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:priceRect cornerRadius:20];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = bezierPath.CGPath;
    maskLayer.frame =  priceRect;
    self.priceLabel.layer.mask = maskLayer;

}

@end
