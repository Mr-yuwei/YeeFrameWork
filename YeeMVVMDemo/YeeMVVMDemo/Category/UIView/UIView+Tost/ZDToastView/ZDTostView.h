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
+ (ZDTostView *)showErrorMessage:(NSString *)aMessage inView:(UIView *)aView ;//错误信息
+ (ZDTostView *)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView ;//成功信息
+ (ZDTostView *)showNetErrorWithMessage:(NSString *)aMessage inView:(UIView *)aView;//网络错误
+ (ZDTostView *)showLoadingMessage:(NSString *)aMessage inView:(UIView *)aView ;//加载中。。。。
+ (ZDTostView *)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView finish:(void (^)(void))finish ;//成功后跳转
+ (void)removeLoadingTost;// 删除
@end