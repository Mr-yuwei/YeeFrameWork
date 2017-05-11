//
//  NavigationProtocol.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/11.
//  Copyright © 2017年 CodeYee. All rights reserved.
//
#import <Foundation/Foundation.h>
typedef void (^VoidBlock)();

@protocol NavigationProtocol <NSObject>

- (void)pushViewModel:(YViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewModelAnimated:(BOOL)animated;

- (void)popToRootViewModelAnimated:(BOOL)animated;

- (void)presentViewModel:(YViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

- (void)resetRootViewModel:(YViewModel *)viewModel;

@end
