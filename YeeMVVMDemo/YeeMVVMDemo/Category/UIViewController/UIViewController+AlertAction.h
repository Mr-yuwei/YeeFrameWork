//
//  UIViewController+AlertAction.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/13.
//  Copyright © 2017年 内圈科技. All rights reserved.
// // iOS 8.0之后才能使用

#import <UIKit/UIKit.h>

@interface UIViewController (AlertAction)

//默认标题 取消 确定
-(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message destructivehandler:(void (^)(void))deshandler  cancelhandler:(void (^)(void))cancelhandler;


-(void)showAlertControllerWithTitle:(NSString *)title  message:(NSString *)message cancelTitle:(NSString *)cancleTitle  cancelhandler:(void (^)(void))cancelhandler;

//自己定义
-(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message desTitle:(NSString *)desTitle cancelTitle:(NSString *)cancelTitle  destructivehandler:(void (^)(void))deshandler   cancelhandler:(void (^)(void))cancelhandler;

@end
