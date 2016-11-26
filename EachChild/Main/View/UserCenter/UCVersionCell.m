//
//  UCVersionCell.m
//  EachChild
//
//  Created by 虞军军 on 16/11/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "UCVersionCell.h"

@interface UCVersionCell ()
@property (strong, nonatomic) IBOutlet UILabel *versionLabel;

@end
@implementation UCVersionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSString *versionString = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.versionLabel.text = [NSString stringWithFormat:@"V %@",versionString];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
