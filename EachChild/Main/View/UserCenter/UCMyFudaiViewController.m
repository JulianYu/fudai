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

@end

@implementation UCMyFudaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的福袋";
    regNib(self.tableView, @"UCMyFudaiCell", cellID);
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UCMyFudaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (0 == row) {
        cell.dataArray = @[@1,@2,@3];
    }else if (1 == row) {
        cell.dataArray = @[@1,@2];
    }else {
        cell.dataArray = @[@1];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}


@end
