//
//  TaBbarVC.m
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/26.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "TaBbarVC.h"

@interface TaBbarVC ()

@end

@implementation TaBbarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self configureTab];
    
    [self addOwnVC];
   
}
#pragma mark --配置相关字体等
-(void)configureTab
{
    UITabBarItem *item                 = [UITabBarItem appearance];
    //设置默认状态文字的颜色
    NSMutableDictionary *md            = [NSMutableDictionary dictionary];
    md[NSForegroundColorAttributeName] = [UIColor  grayColor];
    [item setTitleTextAttributes:md forState:UIControlStateNormal];
    //设置高亮状态文字的颜色
    NSMutableDictionary *higMd            = [NSMutableDictionary dictionary];
    higMd[NSForegroundColorAttributeName] =kNavBarThemeColor;
    [item setTitleTextAttributes:higMd forState:UIControlStateSelected];
    self.tabBar.tintColor = kNavBarThemeColor;
    
}

-(void)addOwnVC{
    
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
        NavigationViewController *nc = [[NavigationViewController alloc] initWithRootViewController:vc];
        [vcArr addObject:vc];
        [nvArr addObject:nc];
    }
    self.viewControllers = nvArr;
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}
@end
