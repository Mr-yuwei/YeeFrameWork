//
//  UIViewControllerProtocol.h
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/27.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIViewControllerProtocol <NSObject>

@optional
//子类添加控件
-(void)addOwnViews;
//子类控件属性值配置
-(void)configOwnViews;
//添加导航栏设置
-(void)addNavbarView;
//RAC绑定事件
-(void)bindViewModel;

@end
