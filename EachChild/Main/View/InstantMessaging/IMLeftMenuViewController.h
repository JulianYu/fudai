//
//  IMLeftMenuViewController.h
//  EachChild
//
//  Created by 虞军军 on 17/1/2.
//  Copyright © 2017年 erongchuang. All rights reserved.
//

#import "BaseViewController.h"

@interface IMLeftMenuViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@property (nonatomic, strong) UIViewController *homeViewController;

@end
