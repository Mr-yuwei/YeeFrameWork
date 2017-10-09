//
//  Router.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "Router.h"
@implementation Router
static Router *_shareInstance = nil;
+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       _shareInstance=[[Router alloc] init];
    });
    return _shareInstance;
}
- (BaseViewController *)viewControllerForViewModel:(BaseViewModel*)viewModel
{

    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    return nil;
}
//简单的实现映射功能
- (NSDictionary *)viewModelViewMappings
{
    return @{
             @"MRCLoginViewModel":   @"MRCLoginViewController",
             @"MRCCountryViewModel": @"MRCCountryViewController",
             @"MRCCountryAndLanguageViewModel": @"MRCCountryAndLanguageViewController",
             @"MRCTrendingReposViewModel": @"MRCTrendingReposViewController",
             @"MRCOAuthViewModel": @"MRCOAuthViewController",
             };
}
@end
