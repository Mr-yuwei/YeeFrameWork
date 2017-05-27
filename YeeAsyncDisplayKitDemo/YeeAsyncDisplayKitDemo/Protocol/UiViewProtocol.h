//
//  UiViewProtocol.h
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/26.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UiViewProtocol <NSObject>

@optional
//子类添加控件
-(void)addOwnView;
//子类控件布局使用
-(void)layOutViews;
//RAC绑定
-(void)bindViewModel;

@end
