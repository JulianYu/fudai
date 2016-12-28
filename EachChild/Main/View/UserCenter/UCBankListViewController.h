//
//  UCBankListViewController.h
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "PublicModel.h"

typedef void(^BankBlock)(BANK *bank);

@interface UCBankListViewController : BaseTableViewController


- (void)didSelectedBank:(BankBlock)bank;

@end
