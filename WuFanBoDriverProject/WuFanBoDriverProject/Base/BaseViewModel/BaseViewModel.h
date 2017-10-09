//
//  BaseViewModel.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"
@interface BaseViewModel : NSObject
//数据请求
@property(nonatomic,retain) RACCommand  *requestCommand;

-(RACSignal *)requestRemoteData;

- (void)initialize;

@end
