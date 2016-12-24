//
//  HPHomePageViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "HPHomePageViewController.h"
#import "HPAreaViewController.h"

@interface HPHomePageViewController ()
{
    UIBarButtonItem *leftTitleItem;
}

@end

@implementation HPHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    leftTitleItem = [[UIBarButtonItem alloc] initWithTitle:@"深圳" style:UIBarButtonItemStylePlain target:self action:@selector(pushToViewController)];
    UIBarButtonItem *leftImageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hp_location_selection"] style:UIBarButtonItemStylePlain target:self action:@selector(pushToViewController)];
    self.navigationItem.leftBarButtonItems = @[leftTitleItem, leftImageItem];
    UIBarButtonItem *testItem = [[UIBarButtonItem alloc] initWithTitle:@"TEST" style:UIBarButtonItemStyleDone target:self action:@selector(apiTestStoryboard)];
    self.navigationItem.rightBarButtonItem = testItem;
    
}
- (void)pushToViewController {
    HPAreaViewController *areaVCtrl = [[HPAreaViewController alloc] initWithNibName:@"HPAreaViewController" bundle:nil];
    [self.navigationController pushViewController:areaVCtrl animated:YES];
}
- (void)apiTestStoryboard {
    UIViewController *vc = [UIStoryboard storyboardWithName:@"APITestStoryboard" bundle:nil].instantiateInitialViewController;
    [self.navigationController pushViewController:vc animated:YES];
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
