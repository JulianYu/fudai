//
//  APITESTGETViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/23.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "APITESTGETViewController.h"
#import "APITESTViewModel.h"

@interface APITESTGETViewController ()
@property (strong, nonatomic) IBOutlet UITextField *methodField;

@end

@implementation APITESTGETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)publicRequestAction:(id)sender {
    [APITESTViewModel publicApiRequestWithMethod:_methodField.text params:nil];
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
