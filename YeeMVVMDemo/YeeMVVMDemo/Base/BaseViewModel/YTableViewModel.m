//
//  YTableViewModel.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "YTableViewModel.h"
@interface YTableViewModel ()

@property (nonatomic, strong, readwrite) RACCommand *requestRemoteDataCommand;

@end
@implementation YTableViewModel

- (void)initialize {
    
    [super initialize];
    //初始化分页
    self.page = 1;
    self.Pagesize = 15;
    self.shouldShowEmptyView=NO;
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^(NSNumber *page) {
        @strongify(self)
        
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    
    [[self.requestRemoteDataCommand.errors
      filter:[self requestRemoteDataErrorsFilter]]
     subscribe:self.errors];
}
-(NSMutableArray*)dataSource{
    
    if (_dataSource) {
        
        _dataSource=[[NSMutableArray alloc] init];
    }
    return _dataSource;
}
- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
    return ^(NSError *error) {
        
        
        return YES;
    };
}
- (NSUInteger)offsetForPage:(NSUInteger)page {
    
    return (page - 1) * self.Pagesize;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    
    return [RACSignal empty];
}



@end
