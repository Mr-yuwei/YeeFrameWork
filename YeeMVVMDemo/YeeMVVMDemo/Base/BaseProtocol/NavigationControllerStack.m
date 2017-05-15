//
//  NavigationControllerStack.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "NavigationControllerStack.h"
#import "YeeRouter.h"
@interface NavigationControllerStack ()

@property (nonatomic, strong) id<YeeNavigationProtocol> services;
@property (nonatomic, strong) NSMutableArray *navigationControllers;

@end

@implementation NavigationControllerStack


- (instancetype)initWithServices:(id<YeeNavigationProtocol>)services {
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
    
    @weakify(self)
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(pushViewModel:animated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
        
         UIViewController *viewController = (UIViewController *)[YeeRouter.sharedInstance viewControllerForViewModel:tuple.first];
         viewController.hidesBottomBarWhenPushed = YES;
         [self.navigationControllers.lastObject pushViewController:viewController animated:[tuple.second boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(popViewModelAnimated:)]
     subscribeNext:^(RACTuple *tuple) {
        	@strongify(self)
         [self.navigationControllers.lastObject popViewControllerAnimated:[tuple.first boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(popToRootViewModelAnimated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self.navigationControllers.lastObject popToRootViewControllerAnimated:[tuple.first boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(presentViewModel:animated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
        	@strongify(self)
         UIViewController *viewController = (UIViewController *)[YeeRouter.sharedInstance viewControllerForViewModel:tuple.first];
         
         UINavigationController *presentingViewController = self.navigationControllers.lastObject;
         if (![viewController isKindOfClass:UINavigationController.class]) {
             
             viewController = [[UINavigationController alloc] initWithRootViewController:viewController];
         }
         [self pushNavigationController:(UINavigationController *)viewController];
         
         [presentingViewController presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(dismissViewModelAnimated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self popNavigationController];
         [self.navigationControllers.lastObject dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
     }];
    
//    [[(NSObject *)self.services
//      rac_signalForSelector:@selector(resetRootViewModel:)]
//     subscribeNext:^(RACTuple *tuple) {
//         @strongify(self)
//         [self.navigationControllers removeAllObjects];
//         
//         UIViewController *viewController = (UIViewController *)[YeeRouter.sharedInstance viewControllerForViewModel:tuple.first];
//         
//         if (![viewController isKindOfClass:[UINavigationController class]] &&
//             ![viewController isKindOfClass:[MRCTabBarController class]]) {
//             viewController = [[MRCNavigationController alloc] initWithRootViewController:viewController];
//             [self pushNavigationController:(UINavigationController *)viewController];
//         }
//         
//        // MRCSharedAppDelegate.window.rootViewController = viewController;
//     }];

    
}
@end
