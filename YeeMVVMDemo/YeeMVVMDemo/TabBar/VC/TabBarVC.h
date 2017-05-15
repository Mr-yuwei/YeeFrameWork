//
//  TabBarVC.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBarViewModel;
@interface TabBarVC : UITabBarController

@property(nonatomic,retain)TabBarViewModel *viewModel;


- (instancetype)initWithViewModel:(TabBarViewModel *)viewModel;

@end
