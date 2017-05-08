//
//  YViewModel.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "YViewModel.h"
@interface YViewModel ()

@property (nonatomic, strong, readwrite) RACCommand *requestCommand;
@property (nonatomic, strong, readwrite) RACSubject *errors;

@end
@implementation YViewModel

-(instancetype)init{
    
    if (self=[super init]) {
        
        self.shouldRequestRemoteDataOnViewDidLoad = YES;//进入界面是否请求数据
        
        [self initialize];
    }
    return self;
}

#pragma mark 加载网络数据
- (RACSignal *)requestRemoteData {
    
    return [RACSignal empty];
}
- (RACSubject *)errors {
    
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}
-(RACCommand*)requestCommand{
    if (_requestCommand==nil) {
        
        _requestCommand=[[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [self requestRemoteData];
        }];
    }
    return _requestCommand;
}
- (void)initialize{
    
}
@end
