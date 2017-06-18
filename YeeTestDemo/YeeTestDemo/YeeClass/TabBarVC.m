//
//  TabBarVC.m
//  YeeTestDemo
//
//  Created by CoderYee on 2017/4/20.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "TabBarVC.h"
#import "NavigationVC.h"
#import "WebVC_001.h" //网页
#import "VC_01.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addVCS];
    
}
-(void)addVCS{
    
    
    //设置数据源
    NSArray *vcNames = @[@"VC_01",@"VC_01", @"WebVC_001",@"VC_01"];
    NSArray *imageArray=@[@"icon_maijia_home1",@"icon_choucang1",@"icon_xiaoxi1",@"icon_wode"];
    
    NSArray *selectedimageArray=@[@"icon_maijia_home2",@"icon_choucang2",@"icon_xiaoxi2",@"icon_shezhi_yidianji"];
    
    NSArray *titleArray=@[@"首页",@"收藏",@"网页",@"我的"];
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
    self.viewControllers = nvArr;
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



@end
