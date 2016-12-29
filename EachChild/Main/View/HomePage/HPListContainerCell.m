//
//  HPListContainerCell.m
//  EachChild
//
//  Created by 虞军军 on 16/12/29.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "HPListContainerCell.h"

@interface HPListContainerCell ()

@end

@implementation HPListContainerCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake(44, 44);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.collectionView = [[AFIndexedCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
//    self.collectionView.backgroundColor = [UIColor whiteColor];
//    self.collectionView.showsHorizontalScrollIndicator = NO;
//    [self.contentView addSubview:self.collectionView];
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
