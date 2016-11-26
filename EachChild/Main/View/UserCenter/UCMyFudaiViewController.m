//
//  UCMyFudaiViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCMyFudaiViewController.h"
#import "UCMyFudaiCell.h"

static NSString *cellID = @"UCMyFudaiCellID";

@interface UCMyFudaiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation UCMyFudaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的福袋";
    
    regNib(self.tableView, @"UCMyFudaiCell", cellID);
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UCMyFudaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (0 == row) {
        cell.dataArray = @[@1,@2,@3];
    }else if (1 == row) {
        cell.dataArray = @[@1,@2];
    }else {
        cell.dataArray = @[@1];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data =[self.dataArray objectAtIndex:indexPath.row];
    return 72+120+data.count * 60;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@[@1,@2,@3],@[@1,@2],@[@1],@[@1],@[@1], nil];
    }
    return _dataArray;
}

@end
