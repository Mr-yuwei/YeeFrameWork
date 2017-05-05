//
//  BaseViewControllerProtocolHeader.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#ifndef BaseViewControllerProtocolHeader_h
#define BaseViewControllerProtocolHeader_h

@protocol BaseViewControllerProtocol <NSObject>

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
#endif /* BaseViewControllerProtocolHeader_h */
