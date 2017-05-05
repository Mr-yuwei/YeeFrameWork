//
//  UIViewController+AlertAction.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/13.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIViewController+AlertAction.h"
#include <objc/runtime.h>
@implementation UIViewController (AlertAction)
#pragma  mark 展示提示信息
-(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message destructivehandler:(void (^)(void))deshandler   cancelhandler:(void (^)(void))cancelhandler{
    
    
    [self showAlertControllerWithTitle:title message:message desTitle:@"确定" cancelTitle:@"取消" destructivehandler:^{
        if (deshandler) {
            deshandler();
        }
        
    } cancelhandler:^{
       
        if (cancelhandler) {
            
            cancelhandler();
        }
    }];
}
-(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message desTitle:(NSString *)desTitle cancelTitle:(NSString *)cancelTitle  destructivehandler:(void (^)(void))deshandler   cancelhandler:(void (^)(void))cancelhandler{
    
    UIAlertController *alertVC=[UIAlertController  alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction  *cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelhandler) {
            
            cancelhandler();
        }
    }];
    UIAlertAction  *destructive=[UIAlertAction actionWithTitle:desTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (deshandler) {
            
            deshandler();
        }
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:destructive];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}
-(void)showAlertControllerWithTitle:(NSString *)title  message:(NSString *)message cancelTitle:(NSString *)cancleTitle  cancelhandler:(void (^)(void))cancelhandler{
    
    UIAlertController *alertVC=[UIAlertController  alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction  *cancel=[UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelhandler) {
            
            cancelhandler();
        }
    }];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}
@end
