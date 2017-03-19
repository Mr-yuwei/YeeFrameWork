//
//  UIView+YeeViewAnimation.h
//  YeeShopProject
//
//  Created by CoderYee on 2017/3/19.
//  Copyright © 2017年 CoderYee. All rights reserved.
//利用UIView提供的Animation实现简单动画
//UIViewBlock
//
#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger,YeeBaseAnimationType){
    YeeFromTopType,
    YeeFromBottomType,
    YeeFromLeftType,
    YeeFromRightType,
};

@interface UIView (YeeViewAnimation)

//主要用于显示提示框视图
//maskView最后一般会出现在视图中央
-(void)addBaseAnimationType:(YeeBaseAnimationType)Type Duration:(NSTimeInterval)duration ;



-(void)addBaseSpringAnimationType:(YeeBaseAnimationType)Type Duration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished))completion;

-(void)addBaseAnimationType:(YeeBaseAnimationType)Type Duration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished))completion;


@end
