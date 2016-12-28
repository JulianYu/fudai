//
//  public.h
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#ifndef public_h
#define public_h

#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "UserModel.h"
#import "NSObject+conversion.h"
#import "UIView+frame.h"
#import "NSString+regularExpression.h"
#import "MJExtension.h"
#import "NSObject+Common.h"

#define colorWithRGB(r,g,b) [UIColor colorWithRed:r%255/255.0f green:g%255/255.0f blue:b%255/255.0f alpha:1.0f]

#define regNib(tableView, name, cellID) [tableView registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:cellID];
#define RegisterCell(cell, cellId) regNib(_tableView, cell, cellId)





#endif /* public_h */
