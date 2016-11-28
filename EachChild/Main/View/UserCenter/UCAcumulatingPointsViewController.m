//
//  UCAcumulatingPointsViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAcumulatingPointsViewController.h"
#include "public.h"

@interface UCAcumulatingPointsViewController ()
@property (strong, nonatomic) IBOutlet UIView *pointBgView;
@property (strong, nonatomic) IBOutlet UIButton *withdrawBtn;

@end

@implementation UCAcumulatingPointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.pointBgView roundView];
    [self.withdrawBtn drawBorderWithColor:colorWithRGB(233, 47, 68) width:1];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}


- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
        
    }];
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
