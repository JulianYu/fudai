//
//  SlideMenuListCell.m
//  EachChild
//
//  Created by 虞军军 on 16/12/30.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "SlideMenuListCell.h"
#import "SlideMenuListView.h"

@interface SlideMenuListCell ()

@property (strong, nonatomic) IBOutlet SlideMenuListView *menuListView;

@end

@implementation SlideMenuListCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"menuData" ofType:@"plist"];
    self.menuListView.menuArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
