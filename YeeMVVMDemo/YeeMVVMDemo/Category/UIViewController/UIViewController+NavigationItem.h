//
//  UIViewController+NavigationItem.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  添加导航栏左右按钮

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationItem)

//设置导航栏左右按钮点击事件
//这里只处理单个nav,多个按钮事件需要自行处理
- (void)configNavigationBarWithLeftButtonTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

- (void)configNavigationBarLeftTitle:(NSString *)leftTitle;
- (void)configNavigationBarLeftImage:(NSString *)leftImageString;

- (void)configNavigationBarRightTitle:(NSString *)rightTitle;
- (void)configNavigationBarRightImage:(NSString *)rightImageString;

- (void)navigationBarLeftButtonTapped: (UIButton *)sender;
- (void)navigationBarRightButtonTapped:(UIButton *)sender;
@property(nonatomic,retain)UIButton *leftButton;

@property(nonatomic,retain)UIButton *rightButton;


@end
