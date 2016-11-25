//
//  UIColor+extention.h
//  StockRight
//
//  Created by mac on 16/10/17.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define colorWithRGBA(r,g,b,a) [UIColor colorWithRed:r%255/255.0f green:g%255/255.0f blue:b%255/255.0f alpha:a]
#define colorWithRGB(r,g,b) [UIColor colorWithRed:r%255/255.0f green:g%255/255.0f blue:b%255/255.0f alpha:1.0f]

@interface UIColor (extention)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha;

@end
