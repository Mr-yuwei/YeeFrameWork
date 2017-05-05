//
//  UIView+NBCustomToast.m
//  homework
//
//  Created by panxiang on 14/8/1.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import "UIView+NBCustomToast.h"
#import <objc/runtime.h>
#import "ZDTostView.h"


static  const NSString * CSToastViewKey   = @"CSToastViewKey";
static  const NSString * CSLoadingToastViewKey   = @"CSLoadingToastViewKey";
static  const NSString * CSCenterPoint = @"CSCenterPoint";
static  const NSString * CSComplete = @"CSComplete";

static  NSString * kWarning          = @"tmall_notice_failed";
static  NSString * kSuccess          = @"tmall_notice_success";
static  NSString * kNetError         = @"tmall_notice_info";

@implementation UIView (NBCustomToast)
- (void)hidePreToastWithKey:(const void *)key
{
    UIView *preToast = objc_getAssociatedObject(self, key);
    if (preToast) {
        preToast.hidden = YES;
        [preToast removeFromSuperview];
        preToast = nil;
    }
}

- (ZDTostView *)tostViewWithImageName:(NSString *)imageName message:(NSString *)message
{
    ZDTostView *toast = [[ZDTostView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [toast.customImageView setImage:[UIImage imageNamed:imageName]];
    [toast.label1 setText:message];
    objc_setAssociatedObject (self, &CSToastViewKey, toast, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return toast;
}

- (ZDTostView *)loadingTostViewMessage:(NSString *)message
{
    ZDTostView *toast = [[ZDTostView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIActivityIndicatorView *customView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    toast.customViewOffSet = CGPointMake(0.0f, 40.0f);
    
    
    [customView startAnimating];
    [toast setCustomView:customView];
    [toast.label1 setText:message];
    objc_setAssociatedObject (self, &CSLoadingToastViewKey, toast, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return toast;
}

- (void)showToast:(UIView *)toast duration:(NSTimeInterval)duration
{
    if (CGPointEqualToPoint(self.toastCenterPoint, CGPointZero))
    {
        [self showToast:toast
               duration:duration
               position:CSToastPositionCenter];
    }
    else
    {
        [self showToast:toast
               duration:duration
               position:[NSValue valueWithCGPoint:self.toastCenterPoint]];
    }
}

- (void)showToastWithImageName:(NSString *)imageName message:(NSString *)message
{
    [self hidePreToastWithKey:&CSLoadingToastViewKey];
    ZDTostView *toast = [self tostViewWithImageName:imageName message:message];
    [self showToast:toast
           duration:1.2];
}

- (void)showNBErrorMessage:(NSString *)aMessage
{
    [self showToastWithImageName:kWarning message:aMessage];
}

- (void)showNBSucceedMessage:(NSString *)aMessage
{
    [self showNBSucceedMessage:aMessage complete:nil];
}

- (void)showNBNetErrorWithMessage:(NSString *)aMessage
{
    [self showToastWithImageName:kNetError message:aMessage];
}

- (void)showNBLoadingMessage:(NSString *)aMessage
{
    [self removeNBLoadingTost];
    ZDTostView *toast = [self loadingTostViewMessage:aMessage];
    [self showToast:toast
           duration:MAXFLOAT];
}

- (void)showNBSucceedMessage:(NSString *)aMessage complete:(ShowComplete)complete
{
    self.showComplete = complete;
    
    [self showToastWithImageName:kSuccess message:aMessage];
}

- (void)removeNBLoadingTost
{
    [self hidePreToastWithKey:&CSLoadingToastViewKey];
}

- (void)setToastCenterPoint:(CGPoint)value
{
    [self willChangeValueForKey:@"toastCenterPoint"];
    objc_setAssociatedObject(self, &CSCenterPoint, [NSValue valueWithCGPoint:value], OBJC_ASSOCIATION_RETAIN);
    [self didChangeValueForKey:@"toastCenterPoint"];
}

- (CGPoint)toastCenterPoint
{
    NSValue *value = objc_getAssociatedObject(self, &CSCenterPoint);
    return [value CGPointValue];
}

- (void)setShowComplete:(ShowComplete)showComplete
{
    [self willChangeValueForKey:@"showComplete"];
    objc_setAssociatedObject(self, &CSComplete, showComplete, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"showComplete"];
}

- (ShowComplete)showComplete
{
    return objc_getAssociatedObject(self, &CSComplete);
}

@end
