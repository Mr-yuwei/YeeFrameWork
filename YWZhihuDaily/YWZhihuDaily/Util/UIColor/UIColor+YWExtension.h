//
//  UIColor+YWExtension.h
//  YWBaseFrameWork
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YWExtension)
//颜色描述字符串，带“＃”开头 或者 "0X"
+ (UIColor *)colorWithString:(NSString *)string;

+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;


@end
