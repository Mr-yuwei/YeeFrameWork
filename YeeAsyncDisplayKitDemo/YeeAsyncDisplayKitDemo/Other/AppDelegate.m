//
//  AppDelegate.m
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/26.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginVC.h"
@interface AppDelegate ()


@end

@implementation AppDelegate

+ (instancetype)sharedAppDelegate{
    
    return  (AppDelegate*)[UIApplication sharedApplication].delegate;
}
- (void)configAppearance{
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UINavigationBar appearance] setTintColor:[UIColor grayColor]];
    [[UINavigationBar appearance] setBarTintColor:kNavBarThemeColor];
    [[UINavigationBar appearance] setBackgroundColor:kNavBarThemeColor];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:[UIColor whiteColor],
                                                           NSShadowAttributeName:shadow,
                                                           NSFontAttributeName:[UIFont systemFontOfSize:18]
                                                           }];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self configAppearance];
    [self.window makeKeyAndVisible];
//    self.window.rootViewController=[TaBbarVC new];
    [self EnterloginVC];
    return YES;
}
#pragma mark 配置登录跳转VC
-(void)EnterloginVC{
  
    self.window.rootViewController=[[NavigationViewController alloc] initWithRootViewController:[LoginVC new]];
}
#pragma mark 配置TabBar跳转VC
-(void)EnterTabBarVC{
 
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
