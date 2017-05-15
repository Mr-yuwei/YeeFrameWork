//
//  TabBarViewModel.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "YViewModel.h"
#import "Home_ViewModel.h"
@interface TabBarViewModel : YViewModel

@property (nonatomic, strong, readonly) Home_ViewModel *newsViewModel;

@property (nonatomic, strong, readonly) YTableViewModel *reposViewModel;

@property (nonatomic, strong, readonly) YTableViewModel *exploreViewModel;

@property (nonatomic, strong, readonly) YTableViewModel *profileViewModel;



@end
