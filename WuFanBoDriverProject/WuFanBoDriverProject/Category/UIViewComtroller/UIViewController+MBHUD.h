//
//  UIViewController+MBHUD.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBHUD)
//展示菊花类型Loding
-(void)showLoading;
-(void)showLoadMessage:(NSString *)aMessage ;
//错误信息
-(void)showErrorMessage:(NSString *)aMessage;
//网络错误信息
-(void)showNetErrorMessage:(NSString *)aMessage;
//展示成功信息
-(void)showSuccessMessage:(NSString *)aMessage;
-(void)showSuccessMessage:(NSString *)aMessage complete:(void(^)(void))completeBlock;

-(void)showHUDImageName:(NSString *)imagestring Message:(NSString *)aMessage;
-(void)removeProgressView;

@end
