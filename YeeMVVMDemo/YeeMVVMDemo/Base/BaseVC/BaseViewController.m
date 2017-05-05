//
//  BaseViewController.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addNavbarView];
    [self addOwnViews];
    [self configOwnViews];
    [self bindViewModel];
}
-(void)addNavbarView{
    
    
}
-(void)addOwnViews{
    
    
}
-(void)configOwnViews{
    
    [self.view setBackgroundColor:kBackgroundColor];
    
}
//RAC绑定事件
-(void)bindViewModel{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
