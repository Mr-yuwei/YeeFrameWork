//
//  TabBarController.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

/*
 为了以后统一ViewModel，把TabBar嵌套到一个BaseVC里面
 

 */

#import "TabBarController.h"

@interface TabBarController ()

@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
}

- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}

@end
