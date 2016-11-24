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

#define regNib(tableView, name, cellID) [tableView registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:cellID];

#endif /* public_h */
