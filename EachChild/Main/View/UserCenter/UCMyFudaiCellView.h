//
//  UCMyFudaiCellView.h
//  EachChild
//
//  Created by 虞军军 on 16/11/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UCFudaiModel.h"

@interface UCMyFudaiCellView : UIView

@property (nonatomic, strong) UCFudaiGood *good;

@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UILabel *priceLabel;

@end
