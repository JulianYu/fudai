//
//  UCInformationPortraitCell.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCInformationPortraitCell.h"
#import "public.h"

@interface UCInformationPortraitCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation UCInformationPortraitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect {
//    CGRect imgRect = self.imgView.bounds;
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imgRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:imgRect.size];
//    
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//    //设置大小
//    maskLayer.frame = imgRect;
//    //设置图形样子
//    maskLayer.path = maskPath.CGPath;
//    self.imgView.layer.mask = maskLayer;
    [self.imgView roundView];
}

@end
