//
//  UCEditAddressViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCEditAddressViewController.h"
#import "UCEditAddressViewModel.h"

@interface UCEditAddressViewController ()
@property (strong, nonatomic) IBOutlet UITextField *acceptNameField;
@property (strong, nonatomic) IBOutlet UITextField *mobileField;
@property (strong, nonatomic) IBOutlet UITextField *telField;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;


@property (nonatomic, strong) UCEditAddressViewModel *viewModel;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation UCEditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemOnClicked)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.acceptNameField.text = self.address.accept_name;
    self.mobileField.text = self.address.mobile;
    self.telField.text = self.address.telphone;
    self.zipCodeField.text = self.address.zip;
    self.addressField.text = self.address.address;
    self.areaLabel.text = [NSString stringWithFormat:@"%@ %@ %@",self.address.province,self.address.city,self.address.area];
    
    
}
- (void)rightItemOnClicked {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSDictionary *addressDic = @{@"accept_name":self.acceptNameField.text,@"province_id":self.address.province_id,@"city_id":self.address.city_id,@"area_id":self.address.area_id,@"address":self.addressField.text,@"mobile":self.mobileField.text};
    [params setValue:self.address.id forKey:@"address_id"];
    [params setValue:addressDic forKey:@"address"];
    
    [self.viewModel requestForEdittingAddressWithParams:params completion:^(NSInteger status) {
        if (1 == status) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

#pragma mark- Private methods
- (IBAction)defaultAddressAction:(UIButton *)sender {
    @weakify(self);
    [self.viewModel requestForDefaultAddressWithParams:self.params completion:^(NSInteger status) {
        @strongify(self);
        if (1 == status) {
            [self popOver];
        }
    }];
}
- (IBAction)deleteAddressAction:(UIButton *)sender {
    @weakify(self);
    [self.viewModel requestForDeletingAddressWithParams:self.params completion:^(NSInteger status) {
        @strongify(self);
        if (1 == status) {
            [self popOver];
        }
    }];
}
- (void)popOver {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UCEditAddressViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCEditAddressViewModel alloc] init];
        
    }
    return _viewModel;
}
- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] initWithDictionary:@{@"address_id":self.address.id}];
    }
    return _params;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
