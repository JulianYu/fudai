//
//  UCFeedbackViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCFeedbackViewController.h"
#import "UIPlaceHolderTextView.h"
#import "UCSettingViewModel.h"


@interface UCFeedbackViewController ()
@property (strong, nonatomic) IBOutlet UIPlaceHolderTextView *contentTextView;
@property (nonatomic, strong) UCSettingViewModel *viewModel;

@end

@implementation UCFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)summitAction:(UIButton *)sender {
    if (self.contentTextView.text.length <=0) {
        return;
    }
    NSDictionary *params = @{@"content":self.contentTextView.text};
    [self.viewModel requestForFeedbackWithParams:params completion:^(NSInteger status) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
