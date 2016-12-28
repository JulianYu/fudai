//
//  BaseNavigationBar.m
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseNavigationBar.h"
#import "public.h"

@implementation BaseNavigationBar


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.barTintColor = colorWithRGB(180, 0, 0); //bar 的背景色
    [self setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //    [self setNeedsStatusBarAppearanceUpdate];
    self.tintColor = [UIColor whiteColor]; //baritem 的颜色
}


@end
