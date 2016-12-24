//
//  HttpManager.h
//  StockRight
//
//  Created by 虞军军 on 16/10/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "RequestMethodsModel.h"

@interface HttpManager : AFHTTPSessionManager


#pragma mark- POST
/**
 自定义POST请求
 @param URLString  请求URL string
 @param parameters 请求参数
 @param success    请求成功回调
 @param failure    请求失败回调

 @return NSURLSessionDataTask 任务可以在需要的时候取消
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, NSDictionary *response, NSUInteger status, NSString *msg))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 自定义上传图片请求

 @param URLString 请求地址
 @param imageData     待上传的图片
 @param success    请求成功回调
 @param failure    请求失败回调
 
 @return NSURLSessionDataTask 任务可以在需要的时候取消
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString constructingBodyWithImageData:(id)imageData  success:(void (^)(NSURLSessionDataTask * task, NSDictionary *response, NSInteger status, NSString *msg))success failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

#pragma mark- GET

/**
 自定义GET请求

 @param URLString  请求URL string
 @param parameters 请求参数
 @param success    请求成功回调
 @param failure    请求失败回调

 @return NSURLSessionDataTask 任务可以在需要的时候取消
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters  success:(void (^)(NSURLSessionDataTask * task, NSDictionary *response, NSUInteger status, NSString *msg))success failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;


@end
