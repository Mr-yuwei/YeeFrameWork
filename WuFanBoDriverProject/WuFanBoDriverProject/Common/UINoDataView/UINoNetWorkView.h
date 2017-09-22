//
//  UINoNetWorkView.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//  无网络视图,重新加载视图
#import <UIKit/UIKit.h>

@class UINoNetWorkView;

@protocol UINoNetWorkViewdelegate <NSObject>

@optional

-(void)clickReloadButton:(UIButton *)sender InView:(UINoNetWorkView *)inView;

@end

@interface UINoNetWorkView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,weak)id<UINoNetWorkViewdelegate>delegate;

@end
