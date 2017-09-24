//
//  WFLoginManger.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/24.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "WFLoginManger.h"
static  WFLoginManger *loginMager=nil;
@implementation WFLoginManger
#pragma mark 单例创建对象
+(WFLoginManger*)shance{
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        loginMager=[[WFLoginManger alloc] init];
    });
    return loginMager;
}
@end
