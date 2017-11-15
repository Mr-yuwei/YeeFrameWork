//
//  UIButton+CodeCount.m
//  WuFanBoDriverProject
//
//  Created by 余伟 on 2017/11/2.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UIButton+CodeCount.h"
#include <objc/runtime.h>
const  static NSString  *UIButton_isBindKey = @"UIButton_isBindKey";
const  static NSString  *UIButton_timeCount = @"UIButton_timeCount";
const  static NSString  *UIButton_timer     = @"UIButton_timer";
const  static NSString  *UIButton_Date     = @"UIButton_Date";
@implementation UIButton (CodeCount)
-(void)countdowntimeout:(NSInteger)second originalTitle:(NSString *)title timingTitle:(NSString *)timingTitle
{
    //判断当前是否注册过观察者
    NSNumber *isBind = objc_getAssociatedObject(self, &UIButton_isBindKey);
    //将超时时间记录下来
    
   // NSObject
    
    objc_setAssociatedObject(self, &UIButton_timeCount, @(second), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!isBind.boolValue)
    {
          [self addObTimerserver];
          [self CreateTimer];
    }
}
#pragma mark 添加定时器timer
-(void)CreateTimer
{
     NSTimer *timer=[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeCountChange) userInfo:nil repeats:YES];
     [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    objc_setAssociatedObject(self, &UIButton_timer, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)timeCountChange
{
    NSNumber *timerCount= objc_getAssociatedObject(self, &UIButton_timeCount);
    timerCount= @(timerCount.integerValue-1);
    objc_setAssociatedObject(self, &UIButton_timeCount, timerCount, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (timerCount.integerValue>0)
    {
        NSString *timeString=[NSString stringWithFormat:@"%@秒",timerCount];
        [self setTitle:timeString forState:UIControlStateNormal];
    }else
    {
       [self setTitle:@"重新发送" forState:UIControlStateNormal];
     //  [self  removeObserver:self forKeyPath:UIApplicationWillEnterForegroundNotification];
      // [self  removeObserver:self forKeyPath:UIApplicationDidEnterBackgroundNotification];
    }
}
-(void)addObTimerserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveAppEnterforeGround:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveAppEnterBackGround:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
}
#pragma mark 进入后台
-(void)receiveAppEnterBackGround:(NSNotification *)notice
{
    NSDate *m_pGoBackDate=[NSDate date];//记录当前时间
    objc_setAssociatedObject(self, &UIButton_Date, m_pGoBackDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark 进入前台 程序激活
-(void)receiveAppEnterforeGround:(NSNotification *)notice
{
    NSDate *m_pGoBackDate =objc_getAssociatedObject(self,  &UIButton_Date);
    NSTimeInterval  timeGone = [[NSDate date] timeIntervalSinceDate:m_pGoBackDate];
    NSNumber *timerCount= objc_getAssociatedObject(self, &UIButton_timeCount);
    timerCount = @(timerCount.integerValue-timeGone);
    objc_setAssociatedObject(self, &UIButton_timeCount, timerCount, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

@end
