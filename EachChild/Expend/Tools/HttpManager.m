//
//  HttpManager.m
//  StockRight
//
//  Created by 虞军军 on 16/10/25.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "HttpManager.h"
#import "NSDictionary+conponent.h"
#import "NSObject+extention.h"
#import "UserModel.h"
#import "MJExtension.h"

#import "AppDelegate.h"

@implementation HttpManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/xml",@"text/plain", @"application/javascript", nil];
    }
    return self;
}
#pragma mark-POST请求
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *, NSDictionary *, NSUInteger, NSString *))success
                       failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    if ([URLString containsString:@"UcenterApi"]) {
        UserModel *model = [UserModel shareInstance];
        [params setValue:model.oauth_secret forKey:@"oauth_secret"];
        [params setValue:model.uid forKey:@"uid"];
    }
    
    NSLog(@"\n**************************\n请求地址：%@\n请求参数：%@",URLString, params);
    return [self POST:URLString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *responseDict = [NSDictionary dictionaryWithJSONString:jsonString];
       // id data = [responseDict valueForKey:@"data"];
        NSString *msg = [responseDict valueForKey:@"msg"];
        NSLog(@"\n请求成功：%@\nmsg: %@", jsonString, msg);
        NSInteger status = [[responseDict valueForKey:@"status"]?:@0 integerValue];
//        if (2 == status) {
//            UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"请重新登录" message:msg preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//                [delegate reset];
//            }];
//            [alertCtrl addAction:action];
//            UIViewController *currentVCtrl = [NSObject currentViewCtrl];
//            [currentVCtrl presentViewController:alertCtrl animated:YES completion:^{
//                
//            }];
//            return ;
//        }
        
        success(task, responseDict, status, msg);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);

       
    }];
}
#pragma mark- 上传图片
- (NSURLSessionDataTask *)POST:(NSString *)URLString constructingBodyWithImageData:(id)imageData success:(void (^)(NSURLSessionDataTask *, NSDictionary *, NSInteger, NSString *))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    NSDictionary *params = @{};
    
    return [self POST:URLString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 上传文件
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat            = @"yyyyMMddHHmmss";
        NSString *str                         = [formatter stringFromDate:[NSDate date]];
        NSString *fileName               = [NSString stringWithFormat:@"%@.jpg", str];
        
        [formData appendPartWithFileData:imageData name:@"photos" fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {

        NSLog(@"总大小：%lld,当前大小:%lld",uploadProgress.totalUnitCount,uploadProgress.completedUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *responseDict = [NSDictionary dictionaryWithJSONString:jsonString];
        id data = [responseDict objectForKey:@"data"];
        NSAssert([data isKindOfClass:[NSString class]], @"上传图片返回的数据不对");
        NSInteger status = [[responseDict objectForKey:@"status"]?:@0 integerValue];
        NSString *msg = [responseDict objectForKey:@"msg"];
        NSLog(@"\n请求成功：%@\nmsg: %@", jsonString, msg);
        success(task, responseDict, status, msg);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
        
    }];
   
}
#pragma mark- GET

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters  success:(void (^)(NSURLSessionDataTask * task, NSDictionary *response, NSUInteger status, NSString *msg))success failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure {
    return [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *responseDict = [NSDictionary dictionaryWithJSONString:jsonString];
        NSString *msg = [responseDict objectForKey:@"msg"];
        NSLog(@"\n请求成功：%@\nmsg: %@", jsonString, msg);
        NSInteger status = [[responseDict objectForKey:@"status"]?:@(-1) integerValue];
        success(task, responseDict, status, msg);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
        NSString *jsonStr = [[NSString alloc] initWithData:[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding];
        NSLog(@"\n请求失败：\n%@", jsonStr);
    }];
}


@end
