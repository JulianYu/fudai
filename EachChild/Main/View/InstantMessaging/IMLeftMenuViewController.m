//
//  IMLeftMenuViewController.m
//  EachChild
//
//  Created by 虞军军 on 17/1/2.
//  Copyright © 2017年 erongchuang. All rights reserved.
//

#import "IMLeftMenuViewController.h"
#import "IMFriendListViewController.h"
#import "IMLeftMenuCell.h"

#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

static NSString *cellID = @"IMLeftMenuCell";

@interface IMLeftMenuViewController ()


@end

@implementation IMLeftMenuViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"IMLeftMenuCell" bundle:nil] forCellReuseIdentifier:cellID];
    
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IMLeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    switch (indexPath.row)
    {
            
        case 0:
            cell.titleLabel.text = @"我的好友";
            break;
            
        case 1:
            cell.titleLabel.text = @"添加好友";
            break;
            
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IMFriendListViewController *friendListVCtrl = [[IMFriendListViewController alloc] initWithNibName:@"IMFriendListViewController" bundle:nil];
    [self.homeViewController.navigationController pushViewController:friendListVCtrl animated:NO];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
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
