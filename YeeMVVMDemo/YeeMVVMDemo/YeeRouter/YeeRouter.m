//
//  YeeRouter.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/11.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "YeeRouter.h"
@interface YeeRouter ()

@property (nonatomic, copy) NSDictionary *viewModelViewMappings; // viewModel到view的映射

@end
@implementation YeeRouter

+(instancetype)sharedInstance {
    static YeeRouter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BaseViewController *)viewControllerForViewModel:(YViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    //判断是否是BaseViewController的子类关系
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[BaseViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}
#pragma mark 映射的关系
- (NSDictionary *)viewModelViewMappings {
    return @{
             @"Home_ViewModel": @"HomeVC", @"Home_Detial_ViewModel": @"Home_DetailVC",

             
             };
}
@end
