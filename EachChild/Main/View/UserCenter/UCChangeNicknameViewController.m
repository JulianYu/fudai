//
//  UCChangeNicknameViewController.m
//  EachChild
//
//  Created by 虞军军 on 17/1/3.
//  Copyright © 2017年 erongchuang. All rights reserved.
//

#import "UCChangeNicknameViewController.h"

@interface UCChangeNicknameViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nicknameField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveBtn;

@end

@implementation UCChangeNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    @weakify(self);
    NSString *nickname = self.nicknameField.text;
   RAC(self.saveBtn, enabled) = [self.nicknameField.rac_textSignal filter:^BOOL(NSString *text) {
       if ([nickname isEqualToString:text]) {
           return NO;
       }else {
           return YES;
       }
   }];
    
    [[self.nicknameField rac_signalForControlEvents:UIControlEventEditingDidEndOnExit] subscribeNext:^(id x) {
        @strongify(self);
        [self saveAction];
    }];
}
- (void)viewDidAppear:(BOOL)animated {
    [self.nicknameField becomeFirstResponder];
    [super viewDidAppear:animated];
}
- (IBAction)saveAction:(UIBarButtonItem *)sender {
}

- (void)saveAction {
    if (self.nicknameField.text.length <= 0) {
        [NSObject showHudTipStr:@"没有输入名字，请重新填写"];
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
