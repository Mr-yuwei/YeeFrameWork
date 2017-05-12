//
//  MVVMTabBarVC.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "MVVMTabBarVC.h"

@interface MVVMTabBarVC ()

@end

@implementation MVVMTabBarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addOwnTabBarSellerVC];
}
#pragma mark 添加VCs
-(void)addOwnTabBarSellerVC{
    
    //设置数据源
    NSArray *vcNames = @[@"BaseViewController",@"BaseViewController", @"BaseViewController",@"BaseViewController"];
    
    NSArray *imageArray=@[@"icon_shangjia_home1",@"icon_dingdan1",@"icon_xiaoxi1",@"icon_wode"];
    
    NSArray *selectedimageArray=@[@"icon_shangjia_home2",@"icon_dingdan2",@"icon_xiaoxi2",@"icon_wode"];
    
    NSArray *titleArray=@[@"库存",@"订单",@"消息",@"我的"];
    NSMutableArray *vcArr = [NSMutableArray array];
    NSMutableArray *nvArr = [NSMutableArray array];
    for (NSInteger i = 0; i < vcNames.count; i++)
    {
        Class vcClass = NSClassFromString(vcNames[i]);
        UIViewController *vc = [[vcClass alloc] init];
        vc.title = titleArray[i];
        vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]] ];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",selectedimageArray[i]]];
        NavigationVC *nc = [[NavigationVC alloc] initWithRootViewController:vc];
        [vcArr addObject:vc];
        [nvArr addObject:nc];
    }
    self.tabBarController .viewControllers = nvArr;
}
@end
