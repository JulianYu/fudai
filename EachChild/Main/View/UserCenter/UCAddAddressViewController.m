//
//  UCAddAddressViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAddAddressViewController.h"
#import "UCAddAddressViewModel.h"
#import "UCAreaViewController.h"

@interface UCAddAddressViewController ()
@property (strong, nonatomic) IBOutlet UITextField *acceptNameField;
@property (strong, nonatomic) IBOutlet UITextField *mobileField;
@property (strong, nonatomic) IBOutlet UITextField *telField;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;

@property (nonatomic, strong) UCAddAddressViewModel *viewModel;
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;

@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation UCAddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UCAddAddressViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCAddAddressViewModel alloc] init];
    }
    return _viewModel;
}
- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
    }
    return _params;
}
- (IBAction)addAction:(UIButton *)sender {
    
    if (self.acceptNameField.text.length > 0) {
        [self.params setValue:self.acceptNameField.text forKey:@"accept_name"];
    }
    if (self.mobileField.text.length > 0) {
        [self.params setValue:self.mobileField.text forKey:@"mobile"];
    }
    if (self.addressField.text.length > 0) {
        [self.params setValue:self.addressField.text forKey:@"address"];
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"address":self.params}];
    [self.viewModel requestForAddingAddressWithParams:params completion:^(NSInteger status) {
        if (1 == status) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[UCAreaViewController class]]) {
        UCAreaViewController *vc = (UCAreaViewController *)segue.destinationViewController;
        
        [vc didSelectedAddress:^(SelectedAddress *address) {
            self.areaLabel.text = [NSString stringWithFormat:@"%@ %@ %@", address.province.area_name,address.city.area_name,address.county.area_name];
            [self.params setValue:address.province.area_id forKey:@"province_id"];
            [self.params setValue:address.city.area_id forKey:@"city_id"];
            [self.params setValue:address.county.area_id forKey:@"area_id"];
            
        }];
    }
}


@end
