//
//  AppDelegate.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//
////https://github.com/Mr-yuwei/YWZhihuDaily
#import "AppDelegate.h"
#import "RESideMenu.h"
#import "YWcommonHeader.h"
#import "AppDelegate+Launch.h"
@interface AppDelegate ()<RESideMenuDelegate>

@end

@implementation AppDelegate
#pragma mark --RESideMenuDelegate
- (void)sideMenu:(RESideMenu *)sideMenu didRecognizePanGesture:(UIPanGestureRecognizer *)recognizer
{
    
}
- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    
}
- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    
    
}
- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    
    
}
- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    
    
}

// 配置App中的控件的默认属性
- (void)configAppearance
{
    [[UINavigationBar appearance] setBarTintColor:kNavBarThemeColor];
    [[UINavigationBar appearance] setTintColor:kWhiteColor];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = kWhiteColor;
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:kWhiteColor,
                                                           NSShadowAttributeName:shadow,
                                                           NSFontAttributeName:kCommonLargeTextFont
                                                           }];
    [[UILabel appearance] setBackgroundColor:kClearColor];
    [[UILabel appearance] setTextColor: kBlackColor];
    [[UIButton appearance] setTitleColor:kBlackColor forState:UIControlStateNormal];

}

+ (instancetype)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self configAppearance];
    
    self.window=[[ UIWindow alloc] initWithFrame:[ UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor:[ UIColor whiteColor]];
    
    YWLeftViewController  *leftController=[[YWLeftViewController alloc] init];
    YWPageViewController  *contentController=[[YWPageViewController alloc] init];
    
    RESideMenu *root=[[RESideMenu alloc] initWithContentViewController:[[UINavigationController alloc] initWithRootViewController: contentController] leftMenuViewController:leftController rightMenuViewController:nil];
    root.menuPreferredStatusBarStyle=UIStatusBarStyleLightContent;
    root.contentViewShadowOffset=CGSizeMake(0, 0);
    root.contentViewShadowOpacity = 0.6;
    root.contentViewShadowRadius = 12;
    root.scaleMenuView=NO;//菜单在拖动的时候时候可以缩小
    root.bouncesHorizontally=NO;//contentView是否可以反弹
    root.delegate=self;
    //root.fadeMenuView=NO;
    //root.panFromEdge=NO;
    root.contentViewShadowEnabled = NO;
    
    root.contentViewScaleValue =1.0;
    root.contentViewInPortraitOffsetCenterX=CentenrLeftwith;//分割线距离中心点的距离 x轴
    self.window.rootViewController=root;
    [self lanuchapplication:application didFinishLaunchingWithOptions:launchOptions];
    
    //get方法缓存数据
    NSURLCache *urlCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:urlCache];
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;

}
@end
