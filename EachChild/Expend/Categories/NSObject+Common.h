//
//  NSObject+Common.h
//  LendStore
//
//  Created by iOS_Dev5 on 15/12/4.
//  Copyright © 2015年 AS Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)
+ (void)showHudTipError:(NSError *)tipError;
+ (void)showHudTipStr:(NSString *)tipStr;
+ (void)showHudTipStr:(NSString *)tipStr afterDelay:(NSTimeInterval)delay;
+ (void) startActivityIndicatorInView:(UIView *)aView withMessage:(NSString*)aMessage;
+ (void) startActivityIndicatorInView:(UIView *)aView withMessage:(NSString*)aMessage afterDelay:(NSTimeInterval)delay;
+ (void) stopActivityIndicatorInView:(UIView*)aView;
+ (NSString *)tipFromError:(NSError *)error;
+ (NSInteger)errorCodeFromError:(NSError *)error;
+ (NSString* )pathInCacheDirectory:(NSString *)fileName;
+ (BOOL) createDirInCache:(NSString *)dirName;
+ (NSData *)loadImageDataWithLocal:(NSString *)path;
//+ (BOOL)saveUserInfoData:(NSDictionary *)data toPath:(NSString *)requestPath;//保存用户信息
//+ (id) loadLocalUserWithPath:(NSString *)requestPath;//加载用户本地个人信息
@end
