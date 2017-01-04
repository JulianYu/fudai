//
//  IMLeftMenuViewController.m
//  EachChild
//
//  Created by 虞军军 on 17/1/2.
//  Copyright © 2017年 erongchuang. All rights reserved.
//

#import "IMLeftMenuViewController.h"
#import "IMFriendListViewController.h"
#import "IMAddFriendViewController.h"


#import "IMNavigationController.h"


@interface IMLeftMenuViewController ()


@end

@implementation IMLeftMenuViewController

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self.slideOutAnimationEnabled = YES;
//    
//    return [super initWithCoder:aDecoder];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"im_left_menu_bg.jpg"]];
//    [self.tableView setBackgroundView:bg];
    
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (0 == row) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myFriendList"];
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addFriend"];
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSInteger row = indexPath.row;
    if (0 == row) {
        IMFriendListViewController *friendListVCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"IMFriendListViewController"];
        [[IMNavigationController sharedInstance] pushViewController:friendListVCtrl animated:NO];
        
    }else if (1 == row) {
        IMAddFriendViewController *addFriendVCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"IMAddFriendViewController"];
        
        [[IMNavigationController sharedInstance] pushViewController:addFriendVCtrl animated:NO];
    }
    
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
