//
//  NavigationControllerStack.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  MVVM  ViewModel-Based Navigation
//  来源 https://github.com/leichunfeng/MVVMReactiveCocoa

#import <Foundation/Foundation.h>

@protocol NavigationProtocol;

@interface NavigationControllerStack : NSObject

- (instancetype)initWithServices:(id<NavigationProtocol>)services;

- (void)pushNavigationController:(UINavigationController *)navigationController;

- (UINavigationController *)popNavigationController;

- (UINavigationController *)topNavigationController;


@end
