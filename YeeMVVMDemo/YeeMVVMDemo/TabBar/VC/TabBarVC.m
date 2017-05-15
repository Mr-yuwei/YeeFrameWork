//
//  TabBarVC.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "TabBarVC.h"
#import "BaseViewController.h"
#import "TabBarViewModel.h"

#import "HomeVC.h"

@interface TabBarVC ()<UITabBarControllerDelegate>



@end

@implementation TabBarVC

- (instancetype)initWithViewModel:(TabBarViewModel *)viewModel{
    
    if (self=[super init]) {
      
        self.viewModel=viewModel;
        
         [self  addOWnView];
    }
    
    return self;
}

-(void)addOWnView{
    
    UINavigationController *newsNavigationController = ({
        HomeVC *newsViewController = [[HomeVC alloc] initWithViewModel:self.viewModel.newsViewModel];
        newsViewController.title =@"首页";
        [[UINavigationController alloc] initWithRootViewController:newsViewController];
    });
    
    UINavigationController *reposNavigationController = ({
        BaseTableViewController *reposViewController = [[BaseTableViewController alloc] initWithViewModel:self.viewModel.reposViewModel];
         reposViewController.title =@"收藏";
        [[UINavigationController alloc] initWithRootViewController:reposViewController];
    });
    
    UINavigationController *exploreNavigationController = ({
        BaseTableViewController *exploreViewController = [[BaseTableViewController alloc] initWithViewModel:self.viewModel.exploreViewModel];
        exploreViewController.title =@"消息";
        
        [[UINavigationController alloc] initWithRootViewController:exploreViewController];
    });
    
    UINavigationController *profileNavigationController = ({
        BaseTableViewController *profileViewController = [[BaseTableViewController alloc] initWithViewModel:self.viewModel.profileViewModel];
         profileViewController.title =@"我的";
        [[UINavigationController alloc] initWithRootViewController:profileViewController];
    });
    
    self.viewControllers = @[newsNavigationController, reposNavigationController, exploreNavigationController, profileNavigationController ];
    
    //初始化选中一个  
    [[AppDelegate sharedAppDelegate].navigationControllerStack  pushNavigationController:newsNavigationController];
    
    [[self
      rac_signalForSelector:@selector(tabBarController:didSelectViewController:)
      fromProtocol:@protocol(UITabBarControllerDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         
         [[AppDelegate sharedAppDelegate].navigationControllerStack popNavigationController];
         [[AppDelegate sharedAppDelegate].navigationControllerStack pushNavigationController:tuple.second];
     }];
    self.delegate=self;

}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
