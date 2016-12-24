//
//  APITESTViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/23.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "APITESTViewController.h"
#import "APITESTViewModel.h"

@interface APITESTViewController ()
@property (strong, nonatomic) IBOutlet UITextField *methodField;
@property (strong, nonatomic) IBOutlet UITextField *param1Field;
@property (strong, nonatomic) IBOutlet UITextField *param2Field;
@property (strong, nonatomic) IBOutlet UITextField *param3Field;
@property (strong, nonatomic) IBOutlet UITextField *param4Field;
@property (strong, nonatomic) IBOutlet UITextField *param5Field;

@property (strong, nonatomic) IBOutlet UITextField *v1Field;
@property (strong, nonatomic) IBOutlet UITextField *v2Field;
@property (strong, nonatomic) IBOutlet UITextField *v3Field;
@property (strong, nonatomic) IBOutlet UITextField *v4Field;
@property (strong, nonatomic) IBOutlet UITextField *v5Field;


@end

@implementation APITESTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)ucenterReqAction:(UIButton *)sender {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:9];
    if (_param1Field.text.length > 0 && _v1Field.text.length > 0) {
        [params setValue:_v1Field.text forKey:_param1Field.text];
    }
    if (_param2Field.text.length > 0 && _v2Field.text.length > 0) {
        [params setValue:_v2Field.text forKey:_param2Field.text];
    }
    if (_param3Field.text.length > 0 && _v3Field.text.length > 0) {
        [params setValue:_v3Field.text forKey:_param3Field.text];
    }
    if (_param4Field.text.length > 0 && _v4Field.text.length > 0) {
        [params setValue:_v4Field.text forKey:_param4Field.text];
    }
    if (_param5Field.text.length > 0 && _v5Field.text.length > 0) {
        [params setValue:_v5Field.text forKey:_param5Field.text];
    }
    [APITESTViewModel uCenterRequestWithMethod:_methodField.text params:params];
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
