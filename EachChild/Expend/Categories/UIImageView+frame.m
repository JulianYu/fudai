//
//  UIImageView+frame.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UIImageView+frame.h"

@implementation UIImageView (frame)

- (void)roundView {
    CGRect imgRect = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imgRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:imgRect.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imgRect;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
