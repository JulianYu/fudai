//
//  FMPayTypeViewController.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FMPayTypeViewController.h"
#import "FMPayTypeViewModel.h"
#import "FMPayTypeCell.h"
#import "FMPayTypeSummitCell.h"
#import "ZCTradeView.h"

static NSString *cellID = @"FMPayTypeCellID";
static NSString *summitCellID = @"FMPayTypeSummitCellID";

@interface FMPayTypeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSIndexPath *lastIndexPath;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) FMPayTypeViewModel *viewModel;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) ZCTradeView *tradeView;

@end

@implementation FMPayTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付方式";
    // Do any additional setup after loading the view from its nib.
    regNib(self.tableView, @"FMPayTypeCell", cellID)
    regNib(self.tableView, @"FMPayTypeSummitCell", summitCellID)
    [self requestForPayType];
}

- (void)requestForPayType
{
    [self.viewModel requestForPayTyeCompletion:^(NSInteger status) {
        if (1 == status) {
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
        }
    }];
    
}

#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.viewModel.payTypeArray.count;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (0 == section) {
        FMPayTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }else {
        FMPayTypeSummitCell *cell = [tableView dequeueReusableCellWithIdentifier:summitCellID];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        if (![_lastIndexPath isEqual:indexPath]) {
            FMPayTypeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.selectingBtn.selected = YES;
            FMPayTypeCell *lastCell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
            lastCell.selectingBtn.selected = NO;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 60;
    }else {
        return 60;
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    @weakify(self);
    if ([cell isKindOfClass:[FMPayTypeCell class]]) {
        FMPayTypeCell *paytypeCell = (FMPayTypeCell *)cell;
        paytypeCell.payType = self.viewModel.payTypeArray[row];
    }else {
        FMPayTypeSummitCell *summitCell = (FMPayTypeSummitCell *)cell;
        NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"总计：￥%@", self.fudai.price]];
        
        [mString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, mString.length-3)];
        summitCell.totalLabel.attributedText = mString;
        [[summitCell.summitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self);
            [self doTrade];
        }];
    }
}
- (void)doTrade {
    [self.tradeView show];
    @weakify(self);
    self.tradeView.finish = ^(NSString *password) {
        @strongify(self);
        [self.params setValue:password forKey:@"pay_password"];
        [self balanceDoPay];
    };
}
- (void)balanceDoPay {
    [self.viewModel payWithParams:self.params completion:^(NSInteger status) {
        if (1 == status) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (FMPayTypeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[FMPayTypeViewModel alloc] init];
    }
    return _viewModel;
}
- (NSIndexPath *)lastIndexPath {
    if (!_lastIndexPath) {
        _lastIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    return _lastIndexPath;
}
- (ZCTradeView *)tradeView {
    if (!_tradeView) {
        _tradeView = [ZCTradeView tradeView];
    }
    return _tradeView;
}
- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
        [_params setValue:@1 forKey:@"payment_id"];//1:钱包 30:微信 31:支付宝
        [_params setValue:self.fudai.id forKey:@"fudai_id"];
        [_params setValue:self.fudai.price forKey:@"amount"];
    }
    return _params;
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
