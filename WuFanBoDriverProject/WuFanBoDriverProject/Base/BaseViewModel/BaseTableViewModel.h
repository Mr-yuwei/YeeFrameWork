//
//  BaseTableViewModel.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseTableViewModel : BaseViewModel

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger Pagesize;
@property (nonatomic, retain) NSMutableArray   *dataSource;
@property (nonatomic, assign) BOOL shouldPullToRefresh;    //用于判断头部是否能刷新
@property (nonatomic, assign) BOOL shouldInfiniteScrolling;//下拉加载更多数据
@property (nonatomic, assign) BOOL shouldShowEmptyView;
@property (nonatomic, strong) RACCommand *requestRemoteDataCommand;
//用于下拉刷新
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;
@end
