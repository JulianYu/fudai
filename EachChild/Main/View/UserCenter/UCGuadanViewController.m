//
//  UCGuadanViewController.m
//  EachChild
//
//  Created by 虞军军 on 17/1/3.
//  Copyright © 2017年 erongchuang. All rights reserved.
//

#import "UCGuadanViewController.h"
#import "FMPayTypeViewModel.h"

static CGFloat const heightForPriceCell = 50;
static CGFloat const heightForExtraPriceCell = 72;
static CGFloat const heightForPayTypeCell = 60;
static CGFloat const heightForBottomCell = 72;

@interface UCGuadanViewController ()

@property (nonatomic, strong) FMPayTypeViewModel *viewModel;

@end

@implementation UCGuadanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)requestForPayType
{
    [self.viewModel requestForPayTyeCompletion:^(NSInteger status) {
        if (1 == status) {
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
        }
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    if (0 == section) {
        if (0 == row) {
            return heightForPriceCell;
        }else {
            return heightForExtraPriceCell;
        }
    }else if (1 == section) {
        return heightForPayTypeCell * self.viewModel.payTypeArray.count;
    }else {
        return heightForBottomCell;
    }
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
