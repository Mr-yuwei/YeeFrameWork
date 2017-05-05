//
//  UIButton+ActionInterval.h
//  YWBaseFrameWork
//
//  Created by 余伟 on 2017/2/5.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置按钮点击上一次与下一次的间隔
//简单处理暴力点击
@interface UIButton (ActionInterval)
@property (nonatomic, assign) NSTimeInterval acceptEventTime;

@end
