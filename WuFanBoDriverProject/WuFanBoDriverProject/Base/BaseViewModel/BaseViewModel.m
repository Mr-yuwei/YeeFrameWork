//
//  BaseViewModel.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseViewModel.h"
@implementation BaseViewModel
-(instancetype)init
{
    if (self = [super init] )
    {
        [[self rac_signalForSelector:@selector(initialize)]subscribeNext:^(RACTuple * _Nullable x) {
            
            [self initialize];
            
        }];
    }
    return self;
}
-(RACSignal *)requestRemoteData{
    
    return  [RACSignal empty];
}
#pragma mark 初始化设置
- (void)initialize{
    
    
}
#pragma mark 
-(RACCommand *)requestCommand{
    @weakify(self)
    if (_requestCommand==nil) {
    _requestCommand=[[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
     @strongify(self)
           return  [self requestRemoteData];
        }];
    }
    return _requestCommand;
}
@end
