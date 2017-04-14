//
//  UIView+YWExtension.h
//  YWBaseFrameWork
//
//  Created by mac on 16/7/16.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YWExtension)

@property (nonatomic)                           float x;
@property (nonatomic)                           float y;
@property (nonatomic)                           float width;
@property (nonatomic)                           float height;
@property (nonatomic,getter = y,setter = setY:) float top;
@property (nonatomic,getter = x,setter = setX:) float left;
@property (nonatomic)                           float bottom;
@property (nonatomic)                           float  right;
@property (nonatomic)                           CGSize size;
@property (nonatomic)                           CGPoint origin;
//中心点x坐标
@property (nonatomic, assign) CGFloat centerX;
//中心点y坐标
@property (nonatomic, assign) CGFloat centerY;

@end

@interface UIView(YWScreenShot)

+ (UIImage *)YWscreenShot;

@end