//
//  UCSettingTableViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/28.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCSettingTableViewController.h"
#import "UCSettingViewModel.h"
#import "AppDelegate.h"

@interface UCSettingTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *versionLabel;
@property (nonatomic, strong) UCSettingViewModel *viewModel;

@end

@implementation UCSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 18)];
    self.versionLabel.text = [NSString stringWithFormat:@"V %@", [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 1;
    }
    return 3;
}
- (IBAction)logoutAction:(UIButton *)sender {
    @weakify(self);
    [self.viewModel requestForLogoutWithCompletion:^(NSInteger status) {
        @strongify(self);
        if (1 == status) {
            [self appResetAction];
        }
    }];
}
-(void)appResetAction {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([delegate respondsToSelector:@selector(reset)]) {
        [delegate reset];
    }
}

- (UCSettingViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UCSettingViewModel alloc] init];
    }
    return _viewModel;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
