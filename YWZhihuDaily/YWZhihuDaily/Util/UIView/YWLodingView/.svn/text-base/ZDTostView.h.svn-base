//
//  ZDTostView.h
//  Zhidao
//
//  Created by zhuchao on 13-10-21.
//  Copyright (c) 2013年 Baidu. All rights reserved.
//

#import "ZDChatroomAlertView.h"

@interface ZDTostView : ZDChatroomAlertView

+ (ZDTostView *)sharedTostView;
+ (ZDTostView *)showErrorMessage:(NSString *)aMessage inView:(UIView *)aView ;//DEPRECATED_ATTRIBUTE//使用NBToast
+ (ZDTostView *)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView ;//DEPRECATED_ATTRIBUTE;
+ (ZDTostView *)showNetErrorWithMessage:(NSString *)aMessage inView:(UIView *)aView;// DEPRECATED_ATTRIBUTE;
+ (ZDTostView *)showLoadingMessage:(NSString *)aMessage inView:(UIView *)aView ;//DEPRECATED_ATTRIBUTE;
+ (ZDTostView *)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView finish:(void (^)(void))finish ;//DEPRECATED_ATTRIBUTE;
+ (void)removeLoadingTost;// DEPRECATED_ATTRIBUTE;
@end