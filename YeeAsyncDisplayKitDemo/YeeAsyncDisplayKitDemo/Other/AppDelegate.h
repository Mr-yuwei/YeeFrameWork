//
//  AppDelegate.h
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/26.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedAppDelegate;

-(void)EnterloginVC;

-(void)EnterTabBarVC;

@end

