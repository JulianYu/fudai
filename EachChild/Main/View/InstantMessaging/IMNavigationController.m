//
//  IMNavigationController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/30.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "IMNavigationController.h"
#import "public.h"

@implementation IMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = colorWithRGB(180, 0, 0); //bar 的背景色
    [self.navigationBar setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //    [self setNeedsStatusBarAppearanceUpdate];
    self.navigationBar.tintColor = [UIColor whiteColor]; //baritem 的颜色
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
