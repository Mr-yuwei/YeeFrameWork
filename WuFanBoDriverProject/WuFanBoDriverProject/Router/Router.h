//
//  Router.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Router : NSObject

/// Retrieves the shared router instance.
///
/// Returns the shared router instance.
+ (instancetype)sharedInstance;

/// Retrieves the view corresponding to the given view model.
///
/// viewModel - The view model
///
/// Returns the view corresponding to the given view model.
- (BaseViewController *)viewControllerForViewModel:(BaseViewModel*)viewModel;

@end
