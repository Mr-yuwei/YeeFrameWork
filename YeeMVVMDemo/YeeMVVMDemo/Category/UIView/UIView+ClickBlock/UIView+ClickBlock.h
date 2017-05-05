//
//  UIView+ClickBlock.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>
//为任意视图添加点击视图
typedef void(^ViewClickBlock)(UIView *touchView);
@interface UIView (ClickBlock)

@property(nonatomic,copy)ViewClickBlock clickBlock;


@end
