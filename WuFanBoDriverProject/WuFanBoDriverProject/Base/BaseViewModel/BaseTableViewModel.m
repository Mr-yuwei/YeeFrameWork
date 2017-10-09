//
//  BaseTableViewModel.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseTableViewModel.h"
@interface BaseTableViewModel ()

@end
@implementation BaseTableViewModel
-(void)initialize{
    
    [super initialize];
    self.page=0;
    self.Pagesize = 10;
    self.shouldPullToRefresh=NO;
    self.shouldInfiniteScrolling=NO;
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber   *input) {
     @strongify(self);
        return [[self requestRemoteDataSignalWithPage:input.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
}
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{

    return [RACSignal empty];
}
@end
