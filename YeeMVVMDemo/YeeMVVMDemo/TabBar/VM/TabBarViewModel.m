//
//  TabBarViewModel.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "TabBarViewModel.h"
@interface TabBarViewModel ()

@property (nonatomic, strong, readwrite) Home_ViewModel    *newsViewModel;
@property (nonatomic, strong, readwrite) YTableViewModel   *reposViewModel;
@property (nonatomic, strong, readwrite) YTableViewModel *exploreViewModel;
@property (nonatomic, strong, readwrite) YTableViewModel *profileViewModel;

@end
@implementation TabBarViewModel

- (void)initialize {
    
    [super initialize];
    
    self.newsViewModel    = [[Home_ViewModel alloc] initWithServices:self.services params:nil];
    self.reposViewModel   = [[YTableViewModel alloc] initWithServices:self.services params:nil];
    self.exploreViewModel = [[YTableViewModel alloc] initWithServices:self.services params:nil];
    self.profileViewModel = [[YTableViewModel alloc] initWithServices:self.services params:nil];
}
@end
