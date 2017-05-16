//
//  AppDelegate.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+ConfigureApp.h"
#import "MVVMTabBarVC.h"
#import "TabBarViewModel.h"
@interface AppDelegate ()

@property (nonatomic, strong) ViewModelServices *services;
@property (nonatomic, strong) YViewModel *viewModel;
@property (nonatomic, strong, readwrite) NavigationControllerStack *navigationControllerStack;

@end

@implementation AppDelegate

+ (instancetype)sharedAppDelegate{
    
    return  (AppDelegate*)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self configAppearance];
    [self configureIQKeyboard];
    [self configureNetWork];
    self.services = [[ViewModelServices alloc] init];
    self.navigationControllerStack = [[NavigationControllerStack alloc] initWithServices:self.services];
    TabBarViewModel *viewModel=[[TabBarViewModel alloc] initWithServices:self.services params:nil];
    TabBarVC *rootVC=[[TabBarVC alloc] initWithViewModel: viewModel];
    self.window.rootViewController=rootVC;
      return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window{
    
    return UIInterfaceOrientationMaskAll;//支持所有方向
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
- (YViewModel *)createInitialViewModel {
    // The user has logged-in.
    if (@"133") {
     //在这里需要判断用户是否登录
        
    } else {
        
      
    }
    return nil;
}

@end
