//
//  UIView+NBCustomToast.h
//  homework
//
//  Created by panxiang on 14/8/1.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Toast.h"

typedef void(^ShowComplete)(void);

@interface UIView (NBCustomToast)
@property (nonatomic ,assign)CGPoint toastCenterPoint;
@property (nonatomic ,copy)ShowComplete showComplete;

- (void)showNBErrorMessage:(NSString *)aMessage;
- (void)showNBSucceedMessage:(NSString *)aMessage;
- (void)showNBNetErrorWithMessage:(NSString *)aMessage;
- (void)showNBLoadingMessage:(NSString *)aMessage;
- (void)removeNBLoadingTost;
- (void)showNBSucceedMessage:(NSString *)aMessage complete:(ShowComplete)complete;
@end
