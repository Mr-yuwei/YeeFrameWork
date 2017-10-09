//
//  UIViewController+Configure.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//  如果有侧滑栏，需要知道leftVC、contentVC、 RightVC

#import <UIKit/UIKit.h>

@interface UIViewController (Configure)

+(UIViewController *)getCurrentViewController;

@end
