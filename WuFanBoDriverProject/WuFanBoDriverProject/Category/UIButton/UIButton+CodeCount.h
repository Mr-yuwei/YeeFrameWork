//
//  UIButton+CodeCount.h
//  WuFanBoDriverProject
//
//  Created by 余伟 on 2017/11/2.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CodeCount)

- (void)countdowntimeout:(NSInteger)second originalTitle:(NSString *)title timingTitle:(NSString *)timingTitle;

@end
