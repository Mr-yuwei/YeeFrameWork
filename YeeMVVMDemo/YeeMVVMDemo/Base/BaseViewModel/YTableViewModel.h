//
//  YTableViewModel.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "YViewModel.h"

@interface YTableViewModel : YViewModel

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger Pagesize;
@property (nonatomic, retain) NSMutableArray   *dataSource;
@property (nonatomic, assign) BOOL shouldPullToRefresh;//用于判断是否能刷新
@property (nonatomic, assign) BOOL shouldInfiniteScrolling;
@property (nonatomic,assign)  BOOL shouldShowEmptyView;
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter;

- (NSUInteger)offsetForPage:(NSUInteger)page;

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end
