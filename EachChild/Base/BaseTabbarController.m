//
//  BaseTabbarController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseNavigationController.h"
#import "IMNavigationController.h"

#import "HPHomePageViewController.h"
#import "FMFudaiMarketViewController.h"
//#import "IMInstantMessagingViewController.h"
#import "IMConversationListViewController.h"
#import "IMLeftMenuViewController.h"


@interface BaseTabbarController ()



@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewControllers = [self addControllers];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    [[UITabBar appearance] setTranslucent:YES];
    [[UITabBar appearance] setAlpha:0.8];
    
    
}

- (NSArray *)addControllers {
    NSMutableArray *viewCtrls = [NSMutableArray arrayWithCapacity:4];
    //1.首页
//    HPHomePageViewController *homeVC = [[HPHomePageViewController alloc] initWithNibName:@"HPHomePageViewController" bundle:nil];
//    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
    BaseNavigationController *homeNav = [UIStoryboard storyboardWithName:@"HPHomePageStoryboard" bundle:nil].instantiateInitialViewController;
    homeNav.tabBarItem = [self tabBarItemWithTitle:@"首页" imageName:@"tabbar_hp" selectedImageName:@"tabbar_hp_selected"];
    [viewCtrls addObject:homeNav];
    //2.交易
    FMFudaiMarketViewController *stockVC = [[FMFudaiMarketViewController alloc] initWithNibName:@"FMFudaiMarketViewController" bundle:nil];
    BaseNavigationController *stockNav = [[BaseNavigationController alloc] initWithRootViewController:stockVC];
    stockNav.tabBarItem = [self tabBarItemWithTitle:@"市场" imageName:@"tabbar_fm" selectedImageName:@"tabbar_fm_selected"];
    [viewCtrls addObject:stockNav];
    //3.资讯
    UIStoryboard *imStoryboard = [UIStoryboard storyboardWithName:@"IMInstantMessagingStoryboard" bundle:nil];
    IMNavigationController *imNav = [imStoryboard instantiateInitialViewController];//[[IMNavigationController alloc] initWithRootViewController:imVCtrl];
//    IMConversationListViewController *imVCtrl = [[IMConversationListViewController alloc] init];
    IMLeftMenuViewController *leftMenu = [imStoryboard instantiateViewControllerWithIdentifier:@"IMLeftMenuViewController"];//[[IMLeftMenuViewController alloc] initWithNibName:@"IMLeftMenuViewController" bundle:nil];
    
    imNav.leftMenu = leftMenu;
    imNav.menuRevealAnimationDuration = .18f;
    // Creating a custom bar button for right menu
   /* UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"menu-button"] forState:UIControlStateNormal];
    [button addTarget:imNav action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    imNav.rightBarButtonItem = leftBarButtonItem;*/
    
    imNav.tabBarItem = [self tabBarItemWithTitle:@"消息" imageName:@"tabbar_im" selectedImageName:@"tabbar_im_selected"];
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Closed %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Opened %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Revealed %@", menu);
    }];
    [viewCtrls addObject:imNav];
    //4.我的
//    UCUserCenterViewController *userVC = [[UCUserCenterViewController alloc] initWithNibName:@"UCUserCenterViewController" bundle:nil];
    BaseNavigationController *userNav = /*[[BaseNavigationController alloc] initWithRootViewController:userVC]; /*/(BaseNavigationController *)[UIStoryboard storyboardWithName:@"UserCenterStoryboard" bundle:nil].instantiateInitialViewController;//
    userNav.tabBarItem = [self tabBarItemWithTitle:@"我的" imageName:@"tabbar_uc" selectedImageName:@"tabbar_uc_selected"];
    [viewCtrls addObject:userNav];
    
    return viewCtrls;
}
- (UITabBarItem *)tabBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    return [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}




@end
