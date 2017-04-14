//
//  AppDelegate.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+ (instancetype)sharedAppDelegate;
@end

