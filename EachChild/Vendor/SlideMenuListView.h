//
//  SlideMenuListView.h
//  EachChild
//
//  Created by 虞军军 on 16/12/30.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBtnView.h"

@interface SlideMenuListView : UIScrollView

@property (nonatomic, strong,setter=setMenuArray:) NSMutableArray *menuArray;

@end