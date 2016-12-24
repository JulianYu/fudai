//
//  BaseRequstViewModel.m
//  EachChild
//
//  Created by 虞军军 on 16/11/24.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "BaseRequestViewModel.h"

@implementation BaseRequestViewModel


// 懒加载
- (HttpManager *)httpManager {
    
    if (!_httpManager) {
        _httpManager = [[HttpManager alloc] init];
    }
    return _httpManager;
}


// 在对象销毁时，别忘了取消已经在队列中的请求

- (void)dealloc {
//    [self.httpManager invalidateSessionCancelingTasks:YES];
}


@end
