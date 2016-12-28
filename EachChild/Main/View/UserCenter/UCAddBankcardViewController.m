//
//  UCAddBankcardViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddBankcardViewController.h"
#import "UCAddBankcardViewModel.h"
#import "UCBankListViewController.h"

@interface UCAddBankcardViewController ()

@property (strong, nonatomic) IBOutlet UITextField *realnameField;
@property (strong, nonatomic) IBOutlet UITextField *cardnumField;
@property (strong, nonatomic) IBOutlet UITextField *mobileField;
@property (strong, nonatomic) IBOutlet UITextField *bankfullnameField;

@property (strong, nonatomic) IBOutlet UILabel *bankLabel;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, strong) UCAddBankcardViewModel *viewModel;

@end

@implementation UCAddBankcardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self.realnameField rac_signalForControlEvents:UIControlEventEditingDidEnd|UIControlEventEditingDidEndOnExit] subscribeNext:^(UITextField *tf) {
        [self.params setValue:tf.text forKey:@"realname"];
    }];
    [[self.cardnumField rac_signalForControlEvents:UIControlEventEditingDidEnd|UIControlEventEditingDidEndOnExit] subscribeNext:^(UITextField *tf) {
        [self.params setValue:tf.text forKey:@"cardnum"];
    }];
    [[self.mobileField rac_signalForControlEvents:UIControlEventEditingDidEnd|UIControlEventEditingDidEndOnExit] subscribeNext:^(UITextField *tf) {
        [self.params setValue:tf.text forKey:@"mobile"];
    }];
    [[self.bankfullnameField rac_signalForControlEvents:UIControlEventEditingDidEnd|UIControlEventEditingDidEndOnExit] subscribeNext:^(UITextField *tf) {
        [self.params setValue:tf.text forKey:@"bankfullname"];
    }];
    
}
- (IBAction)addBankcardAction:(UIButton *)sender {
    [self.view endEditing:YES];
    @weakify(self);
    [self.viewModel requestForAddingBankcardWithParams:self.params completion:^(NSInteger status) {
        @strongify(self);
        if (1 == status) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
}

- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return _params;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController *vc = [segue destinationViewController];
    if ([vc isKindOfClass:[UCBankListViewController class]]) {
        __weak typeof(self) weakself = self;
        UCBankListViewController *bankListVCtrl = (UCBankListViewController *)vc;
        [bankListVCtrl didSelectedBank:^(BANK *bank) {
            weakself.bankLabel.text = bank.bankname;
            [weakself.params setValue:bank.id forKey:@"bankid"];
        }];
    }
}

- (UCAddBankcardViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCAddBankcardViewModel alloc] init];
        
    }
    return _viewModel;
}

@end
