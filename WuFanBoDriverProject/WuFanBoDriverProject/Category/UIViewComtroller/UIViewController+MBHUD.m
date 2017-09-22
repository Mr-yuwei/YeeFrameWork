//
//  UIViewController+MBHUD.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UIViewController+MBHUD.h"
#include <objc/runtime.h>
static const void *NeiquanHttpRequestHUDKey = &NeiquanHttpRequestHUDKey;

@implementation UIViewController (MBHUD)

-(void)showLoadMessage:(NSString *)aMessage
{
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = aMessage;
    hud.bezelView.color=[UIColor colorWithWhite:0.0 alpha:0.5];
    hud.mode=MBProgressHUDModeIndeterminate;
    hud.animationType=MBProgressHUDAnimationZoomOut; //动画
    hud.removeFromSuperViewOnHide = YES;
    [self setHUD:hud];
}
-(void)showLoading;
{
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.bezelView.color=[UIColor colorWithWhite:0.0 alpha:0.5];
    hud.mode=MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide = YES;
    [self setHUD:hud];
}
-(void)showErrorMessage:(NSString *)aMessage
{
    [self showHUDImageName :@"tmall_notice_failed" Message:aMessage];
}
-(void)showNetErrorMessage:(NSString *)aMessage
{
    [self showHUDImageName:@"tmall_notice_info" Message:aMessage];
    
}
-(void)showSuccessMessage:(NSString *)aMessage
{
    [self showHUDImageName:@"tmall_notice_success" Message:aMessage];
}
-(void)showSuccessMessage:(NSString *)aMessage complete:(void(^)(void))completeBlock{
   
   [self showHUDImageName:@"tmall_notice_success" Message:aMessage];
    if (completeBlock) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             completeBlock();
        });
    }
    
    
}
-(void)showHUDImageName:(NSString *)imagestring Message:(NSString *)aMessage{
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color=[UIColor colorWithWhite:0.0 alpha:0.5];
    hud.detailsLabel.text = aMessage;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imagestring]];
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabel.textColor=[UIColor whiteColor];
    // 隐藏时候从父控件中移除
    [hud hideAnimated:YES afterDelay:1.0];   // 1.0秒之后再消失
}
#pragma mark ----------移除MBProgress
-(void)removeProgressView
{
    [[self HUD] hideAnimated:NO afterDelay:0.0];
}
- (MBProgressHUD *)HUD
{
    return objc_getAssociatedObject(self, NeiquanHttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    
    
    objc_setAssociatedObject(self, NeiquanHttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
