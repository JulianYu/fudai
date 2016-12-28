//
//  UCAreaCell.m
//  EachChild
//
//  Created by 虞军军 on 16/12/27.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCAreaCell.h"

@interface UCAreaCell ()
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;

@end

@implementation UCAreaCell

- (void)setArea:(Area *)area {
    _area = area;
    _areaLabel.text = area.area_name;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
