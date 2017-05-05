//
//  UIAlertView+AlertAction.m
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/2/12.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import "UIAlertView+AlertAction.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation UIAlertView (AlertAction)
- (void)setCallBack:(AlertCallBack)callBack
{
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

- (AlertCallBack)callBack
{
    return objc_getAssociatedObject(self, @selector(callBack));
}

#pragma mark - delegate method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.callBack) {
        self.callBack(alertView, buttonIndex);
    }
}
@end
