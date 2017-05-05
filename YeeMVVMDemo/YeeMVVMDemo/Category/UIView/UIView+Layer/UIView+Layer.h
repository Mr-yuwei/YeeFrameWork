//
//  UIView+Layer.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/24.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  主要为视图添加圆角,borderWith

#import <UIKit/UIKit.h>
@interface UIView (Layer)
//设置圆角
-(void)setlayerCornerRadius:(CGFloat)radius;

-(void)setlayerCornerRadius:(CGFloat)radius borderwidth:(CGFloat)width boderColor:(UIColor *)boderColor;

-(void)setlayerCornerRadius:(CGFloat)radius withUIRectCorner:(UIRectCorner)Corner;

-(void)setGradientChangingColor:(UIView *)view fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor;
@end

