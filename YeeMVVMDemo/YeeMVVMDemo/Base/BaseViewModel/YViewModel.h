//
//  YViewModel.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YViewModel : NSObject

@property (nonatomic, strong, readonly) RACCommand *requestCommand;

@property (nonatomic, strong, readonly) RACSubject *errors;

//是否允许在ViewdidLoad请求数据，一般处理普通视图
@property (nonatomic, assign) BOOL shouldRequestRemoteDataOnViewDidLoad;

- (void)initialize;

- (RACSignal *)requestRemoteData;


@end
