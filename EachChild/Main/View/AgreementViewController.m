//
//  AgreementViewController.m
//  StockRight
//
//  Created by 虞军军 on 16/12/6.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "AgreementViewController.h"
#import "AgreementViewModel.h"

@interface AgreementViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) AgreementViewModel *viewModel;

@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"融惠股权服务条款";
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    @weakify(self);
    [self.viewModel sendRequestToGetURLString:^(NSString *urlString) {
        @strongify(self);
        [self loadURLString:urlString];
    }];
}

- (void)loadURLString:(NSString *)urlString {
    [self.webView loadHTMLString:urlString baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (AgreementViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[AgreementViewModel alloc] init];
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
