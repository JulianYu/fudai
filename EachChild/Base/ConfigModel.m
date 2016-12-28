//
//  ConfigModel.m
//  EachChild
//
//  Created by 虞军军 on 16/12/26.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "ConfigModel.h"

#import "InitialRequestViewModel.h"

@interface ConfigModel ()

@property (nonatomic, strong) InitialRequestViewModel *viewModel;

@end

@implementation ConfigModel
@synthesize imageUri = _imageUri;


+ (instancetype)config {
    static ConfigModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[ConfigModel alloc] init];
    });
    return model;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self requestForUrl];
    }
    return self;
}

- (void)requestForUrl {
    [self.viewModel requestForBaseImageUrl:^(NSString *url, NSInteger status) {
        if (1 == status) {
            _imageUri = url;
        }
    }];
}
- (NSString *)getImageUrl {
    
    if (_imageUri.length > 0) {
        return _imageUri;
    }
    
    [self requestForUrl];
    return nil;
    
}


- (InitialRequestViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[InitialRequestViewModel alloc] init];
    }
    return _viewModel;
}

@end
