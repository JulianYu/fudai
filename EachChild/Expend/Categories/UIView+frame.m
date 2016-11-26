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

@end
