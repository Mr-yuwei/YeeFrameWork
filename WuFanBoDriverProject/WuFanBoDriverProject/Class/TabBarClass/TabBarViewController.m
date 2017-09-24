//
//  TabBarViewController.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/21.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationController.h"
@interface TabBarViewController ()<UITabBarControllerDelegate,UITabBarDelegate>
{
    NSInteger   m_iSelectedIndex;//当前选中的视图-->用于做动画
}
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configureTab];
    
    [self addChildVC];
    
    //NSLog(@"----%@", self.tabBar.subviews);
    // Do any additional setup after loading the view.
}
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
#pragma  mark 添加子VC
-(void)addChildVC{
    
    self.tabBar.translucent = YES;
    //设置数据源
    NSArray *vcNames = @[@"HomeViewController",@"HomeViewController", @"HomeViewController",@"MineVC"];
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
        NavigationController *nc = [[NavigationController alloc] initWithRootViewController:vc];
        [vcArr addObject:vc];
        [nvArr addObject:nc];
    }
    self.viewControllers = nvArr;
    self.delegate=self;
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (m_iSelectedIndex != index) {
        [self animationWithIndex:index];
    }
    
}
// 动画
- (void)animationWithIndex:(NSInteger) index {
    
    //UITabBarButton ->UITabBarSwappableImageView,UITabBarButtonLabel ,_UIBadgeView
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *ImageView in tabBarButton.subviews)
            {
                if ([ImageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [tabbarbuttonArray addObject:ImageView];
                }
            }
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.1;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
     m_iSelectedIndex = index;
}

//#pragma mark
//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;{
//
//    unsigned int count = 0;
//    Ivar *property = class_copyIvarList([UITabBarItem class], &count);
//    for (int i = 0; i < count; i++) {
//        Ivar var = property[i];
//        const char *name = ivar_getName(var);
//        const char *type = ivar_getTypeEncoding(var);
//        NSLog(@"%s =============== %s",name,type);
//    }
//
//    if (m_iSelectedIndex !=self.selectedIndex) {
//
//        UIView *TabBarButton= [item valueForKey:@"UITabBarButton"];
//
//
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        //速度控制函数，控制动画运行的节奏
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        animation.duration = 0.2;       //执行时间
//        animation.repeatCount = 1;      //执行次数
//        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
//        animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
//        animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
//        [TabBarButton.layer addAnimation:animation forKey:@"animation"];
//
//    }
//
//    /*
//     //放大效果，并回到原位
//     CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//     //速度控制函数，控制动画运行的节奏
//     animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//     animation.duration = 0.2;       //执行时间
//     animation.repeatCount = 1;      //执行次数
//     animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
//     animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
//     animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
//     [[arry[index] layer] addAnimation:animation forKey:nil];
//
//     */
//
//
//    /*
//     //z轴旋转180度
//     CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//     //速度控制函数，控制动画运行的节奏
//     animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//     animation.duration = 0.2;       //执行时间
//     animation.repeatCount = 1;      //执行次数
//     animation.removedOnCompletion = YES;
//     animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
//     animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
//     [[arry[index] layer] addAnimation:animation forKey:nil];
//     */
//
//    /*
//     //向上移动
//     CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
//     //速度控制函数，控制动画运行的节奏
//     animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//     animation.duration = 0.2;       //执行时间
//     animation.repeatCount = 1;      //执行次数
//     animation.removedOnCompletion = YES;
//     animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
//     animation.toValue = [NSNumber numberWithFloat:-10];     //结束伸缩倍数
//     [[arry[index] layer] addAnimation:animation forKey:nil];
//
//
//     */
//
//    /*
//
//     //放大效果
//     CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//     //速度控制函数，控制动画运行的节奏
//     animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//     animation.duration = 0.2;       //执行时间
//     animation.repeatCount = 1;      //执行次数
//     animation.removedOnCompletion = NO;
//     animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
//     animation.fromValue = [NSNumber numberWithFloat:1.0];   //初始伸缩倍数
//     animation.toValue = [NSNumber numberWithFloat:1.15];     //结束伸缩倍数
//     [[arry[index] layer] addAnimation:animation forKey:nil];
//     //移除其他tabbar的动画
//     for (int i = 0; i<arry.count; i++) {
//     if (i != index) {
//     [[arry[i] layer] removeAllAnimations];
//     }
//     }
//
//     */
//
//    m_iSelectedIndex=self.selectedIndex;
//
//}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
