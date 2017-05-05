//
//  UIViewController+ActionSheet.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/27.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ActionSheet)


//默认标题 取消 确定
-(void)showActionSheetControllerWithTitle:(NSString *)title message:(NSString *)message destructivehandler:(void (^)(void))deshandler  cancelhandler:(void (^)(void))cancelhandler;

-(void)showActSheeControllerWithTitle:(NSString *)title message:(NSString *)message desTitles:(NSArray <NSString*>*)desTitle cancelTitle:(NSString *)cancelTitle  destructivehandler:(void (^)(void))deshandler   cancelhandler:(void (^)(void))cancelhandler;

@end
