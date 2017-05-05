//
//  UIButton+LinkBlock.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/11.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LinkBlock)

+ (void)countdownButton:(UIButton *)btn timeout:(int)second originalTitle:(NSString *)title timingTitle:(NSString *)timingTitle;

@end
