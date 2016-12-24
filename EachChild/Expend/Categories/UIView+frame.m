//
//  UIView+frame.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

- (CGPoint)origin {
    return self.frame.origin;
}
- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)x {
    return self.origin.x;
}
- (CGFloat)y {
    return self.origin.y;
}
- (CGFloat)width {
    return self.size.width;
}
- (CGFloat)height {
    return self.size.height;
}
- (CGPoint)center {
    CGFloat x = self.x + self.width/2;
    CGFloat y = self.y + self.height/2;
    return CGPointMake(x, y);
}
- (CGFloat)maxX {
    return self.x+self.width;
}
- (CGFloat)maxY {
    return self.y+self.height;
}
- (CGFloat)centerX {
    return (self.x + self.width /2.0);
}
- (CGFloat)centerY {
    return (self.y + self.height / 2.0);
}

- (void)roundView {
    [self layoutIfNeeded];
    CGRect imgRect = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imgRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:imgRect.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imgRect;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)drawBorderWithColor:(UIColor *)color width:(CGFloat)width {
   
    [self layoutIfNeeded];
    CGRect rect = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillColor = [UIColor clearColor].CGColor;
    maskLayer.strokeColor = color.CGColor;
    maskLayer.lineWidth = width;
    maskLayer.frame = rect;
    maskLayer.path = path.CGPath;
    [self.layer addSublayer:maskLayer];
   
    
}

@end
