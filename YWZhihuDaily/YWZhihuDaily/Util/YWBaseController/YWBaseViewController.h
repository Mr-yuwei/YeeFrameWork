//
//  YWBaseViewController.h
//  YWBaseFrameWork
//
//  Created by NeiQuan on 16/6/8.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//
/**
 *  基类Controller
 */
#import <UIKit/UIKit.h>

@interface YWBaseViewController : UIViewController
/**********************************消息提示*********************************************/
- (void)showErrorMessage:(NSString *)aMessage inView:(UIView *)aView ;//错误信息
- (void)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView ;//成功信息
-(void)showNetErrorWithMessage:(NSString *)aMessage inView:(UIView *)aView;//网络错误
- (void)showLoadingMessage:(NSString *)aMessage inView:(UIView *)aView ;//加载中。。。。
-(void)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView finish:(void (^)(void))finish ;//成功后跳转
- (void)removeLoadingTost;// 删除


@end
