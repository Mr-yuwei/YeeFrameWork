//
//  BaseViewController.m
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/27.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self performSelector:@selector(addNavbarView)]) {
        [self addNavbarView];
    }
    if ([self performSelector:@selector(addOwnViews)]) {
        [self addOwnViews];
    }
    if ([self performSelector:@selector(configOwnViews)]) {
        [self configOwnViews];
    }
    if ([self performSelector:@selector(bindViewModel)]) {
        [self bindViewModel];
    }
}
//子类添加控件
-(void)addOwnViews{
    
    
}
//子类控件属性值配置
-(void)configOwnViews{
    
    
}
//添加导航栏设置
-(void)addNavbarView{
  
    
    
}
//RAC绑定事件
-(void)bindViewModel{
    
    
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}
@end
