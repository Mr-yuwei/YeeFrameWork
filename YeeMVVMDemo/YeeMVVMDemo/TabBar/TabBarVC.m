//
//  TabBarVC.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "TabBarVC.h"
#import "BaseViewController.h"
@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self  addOWnView];
   
}
-(void)addOWnView{
    
    self.tabBar.translucent = YES;
    //设置数据源
    NSArray *vcNames = @[@"BaseViewController",@"BaseViewController", @"BaseViewController",@"BaseViewController"];
       NSArray *imageArray=@[@"icon_maijia_home1",@"icon_choucang1",@"icon_xiaoxi1",@"icon_wode"];
    
    NSArray *selectedimageArray=@[@"icon_maijia_home2",@"icon_choucang2",@"icon_xiaoxi2",@"icon_shezhi_yidianji"];
    
    NSArray *titleArray=@[@"首页",@"收藏",@"消息",@"我的"];
    NSMutableArray *vcArr = [NSMutableArray array];
    NSMutableArray *nvArr = [NSMutableArray array];
    for (NSInteger i = 0; i < vcNames.count; i++)
    {
        Class vcClass = NSClassFromString(vcNames[i]);
        
        BaseViewController *vc = [[vcClass alloc] init];
        vc.title = titleArray[i];
        vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]] ];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",selectedimageArray[i]]];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcArr addObject:vc];
        [nvArr addObject:nc];
    }
    self.viewControllers = nvArr;
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
