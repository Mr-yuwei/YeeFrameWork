//
//  YeeRouter.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/11.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YeeRouter : NSObject

+ (instancetype)sharedInstance;

- (BaseViewController *)viewControllerForViewModel:(YViewModel *)viewModel;

@end
