//
//  IMConversationListViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "IMConversationListViewController.h"
#import "IMNavigationController.h"

@interface IMConversationListViewController ()<SlideNavigationControllerDelegate>

@property (nonatomic, strong) SlideNavigationController *navigationCtrl;

@end

@implementation IMConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_SYSTEM)]];
    if ([self.navigationController isKindOfClass:[SlideNavigationController class]]) {
        self.navigationCtrl = (IMNavigationController *)self.navigationController;
    }
}

- (void)slideNavigationControllerDidChangedLocation:(CGFloat)newLocation withProgress:(CGFloat)progress {
    NSLog(@"new location %f", newLocation);
//    __block IMNavigationController *nav = (IMNavigationController *)self.navigationController;
//    self.tabBarController.view.transform = CGAffineTransformMakeTranslation(newLocation, 0);
//    CGRect frame = self.tabBarController.tabBar.frame;
//    frame.origin.x = newLocation;//[UIScreen mainScreen].bounds.size.width - nav.portraitSlideOffset;
//    self.tabBarController.tabBar.frame = frame;
//    [UIView animateWithDuration:nav.menuRevealAnimationDuration animations:^{
//    }];
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
