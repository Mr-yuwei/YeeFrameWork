//
//  NavigationControllerStack.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "NavigationControllerStack.h"

@interface NavigationControllerStack ()

@property (nonatomic, strong) id<NavigationProtocol> services;
@property (nonatomic, strong) NSMutableArray *navigationControllers;

@end

@implementation NavigationControllerStack


- (instancetype)initWithServices:(id<NavigationProtocol>)services {
    self = [super init];
    if (self) {
        self.services = services;
        self.navigationControllers = [[NSMutableArray alloc] init];
        [self registerNavigationHooks];
    }
    return self;
}
- (void)pushNavigationController:(UINavigationController *)navigationController {
    if ([self.navigationControllers containsObject:navigationController]) return;
    [self.navigationControllers addObject:navigationController];
}
- (UINavigationController *)popNavigationController {
    UINavigationController *navigationController = self.navigationControllers.lastObject;
    [self.navigationControllers removeLastObject];
    return navigationController;
}
- (UINavigationController *)topNavigationController {
    
    return self.navigationControllers.lastObject;
}
#pragma mark 绑定
- (void)registerNavigationHooks {
    
    
}
@end
