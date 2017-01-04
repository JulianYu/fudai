//
//  IMConversationListViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "IMConversationListViewController.h"
#import "IMConversationViewController.h"
#import "IMNavigationController.h"

@interface IMConversationListViewController ()<SlideNavigationControllerDelegate>



@end

@implementation IMConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息";
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_SYSTEM)]];
    [self setConversationAvatarStyle:RC_USER_AVATAR_CYCLE];//设置列表头像为圆形
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION) {//聚合会话（系统消息）
        
    }else if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_NORMAL) {//普通会话
        IMConversationViewController *conversationVC = [[IMConversationViewController alloc] init];
        conversationVC.conversationType = model.conversationType;
        conversationVC.targetId = model.targetId;
        conversationVC.title = model.conversationTitle;
        [self.navigationController pushViewController:conversationVC animated:YES];
    }
    
}

#pragma mark-private methods

- (void)slideNavigationControllerDidChangedLocation:(CGFloat)newLocation withProgress:(CGFloat)progress {
    NSLog(@"new location %f", newLocation);

}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

- (IBAction)leftItemAction:(UIBarButtonItem *)sender {
    
    IMNavigationController *nav = (IMNavigationController *)self.navigationController;
    [nav toggleLeftMenu];
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
