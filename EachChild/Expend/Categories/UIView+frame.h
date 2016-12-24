//
//  UIView+frame.h
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)

- (CGPoint)origin;
- (CGSize)size;
- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;
- (CGPoint)center;
- (CGFloat)maxX;
- (CGFloat)maxY;
- (CGFloat)centerX;
- (CGFloat)centerY;

- (void)roundView;
- (void)drawBorderWithColor:(UIColor *)color width:(CGFloat)width;

@end
