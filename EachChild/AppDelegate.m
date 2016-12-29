//
//  AppDelegate.m
//  EachChild
//
//  Created by 虞军军 on 16/11/23.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabbarController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import "ConfigModel.h"

#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setup];
    [self reset];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setup {
    [ConfigModel config];
    [[RCIM sharedRCIM] initWithAppKey:[ConfigModel config].kRongCloudAppKey];
}

/**
 *  网络状态变化。
 *
 *  @param status 网络状态。
 */
- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    if (status == ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        UIAlertView *alertView = [[UIAlertView alloc]
                             initWithTitle:@"提示"
                             message:@"您"
                             @"的帐号在别的设备上登录，您被迫下线！"
                             delegate:nil
                             cancelButtonTitle:@"知道了"
                             otherButtonTitles:nil, nil];
        alertView.delegate = self;
        [alertView show];
        
    }
}
#pragma mark alert delegate
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self reset];
}


- (void)loginSuccess {
    BaseTabbarController *tabbarCtrl = [[BaseTabbarController alloc] init];
    self.window.rootViewController = tabbarCtrl;
}
- (void)reset {
    LoginViewController *loginVCtrl = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:loginVCtrl];
    self.window.rootViewController = nav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
