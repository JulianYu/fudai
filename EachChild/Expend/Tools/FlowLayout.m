//
//  FlowLayout.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "FlowLayout.h"
#import "UIView+frame.h"

#define SCREEN_WIDTH [UIApplication sharedApplication].keyWindow.width

static CGFloat const leftPadding = 8;
static CGFloat const rightPadding = 8;
static CGFloat const topPadding = 16;
static CGFloat const bottomPadding = 0;

static CGFloat const minimumLineSpacing = 16;
static CGFloat const minimumInteritemSpacing = 16;

@implementation FlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup {
    self.minimumLineSpacing = minimumLineSpacing;
    
    self.minimumInteritemSpacing = minimumInteritemSpacing;
    self.sectionInset = UIEdgeInsetsMake(topPadding, leftPadding, bottomPadding, rightPadding);
    UIView *view = [UIApplication sharedApplication].keyWindow;
    CGFloat sideLength = (view.width -leftPadding-rightPadding-minimumInteritemSpacing)/2;
    self.itemSize = CGSizeMake(sideLength, sideLength);
    
}
- (CGSize)collectionViewContentSize {
    CGFloat height = ceil([[self collectionView] numberOfItemsInSection:0]/5)*SCREEN_WIDTH/2;
    return CGSizeMake(SCREEN_WIDTH, height);
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect

{
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray* attributes = [NSMutableArray array];
    
    for (NSInteger i=0 ; i < [array count]; i++) {
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        
    }
    
    return attributes;
    
}

//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
//    UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//    attr.transform = CGAffineTransformMakeScale(.5, .5);
//    return attr;
//}

@end
