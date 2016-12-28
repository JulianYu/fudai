//
//  UCChangePasswordViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCChangePasswordViewController.h"
#import "UCSettingViewModel.h"

@interface UCChangePasswordViewController ()
@property (strong, nonatomic) IBOutlet UITextField *oldPwdField;
@property (strong, nonatomic) IBOutlet UITextField *pwdField;
@property (strong, nonatomic) IBOutlet UITextField *rePwdField;

@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) UCSettingViewModel *viewModel;

@end

@implementation UCChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)comfirmAction:(UIButton *)sender {
    if (self.oldPwdField.text.length > 0) {
        [self.params setValue:self.oldPwdField.text forKey:@"fpassword"];
    }else {
        [NSObject showHudTipStr:@"请输入原始密码"];
    }
    if (self.pwdField.text.length > 0) {
        [self.params setValue:self.pwdField.text forKey:@"password"];
    }else {
        [NSObject showHudTipStr:@"请输入新密码"];
    }
    if (self.rePwdField.text.length > 0) {
        [self.params setValue:self.rePwdField.text forKey:@"repassword"];
    }else {
        [NSObject showHudTipStr:@"请输入确认密码"];
    }
    
    [self.viewModel requestForChangePasswordWithParams:self.params completion:^(NSInteger status) {
        if (1 == status) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UCSettingViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCSettingViewModel alloc] init];
    }
    return _viewModel;
}
- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
    }
    return _params;
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
