//
//  UIView+YeeViewAnimation.m
//  YeeShopProject
//
//  Created by CoderYee on 2017/3/19.
//  Copyright © 2017年 CoderYee. All rights reserved.
//


#import "UIView+YeeViewAnimation.h"
//主窗口的宽、高
#define kMainScreenWidth  MainScreenWidth()
#define kMainScreenHeight MainScreenHeight()

#define Localized(Str) NSLocalizedString(Str, Str)

static __inline__ CGFloat MainScreenWidth()
{
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height;
}

static __inline__ CGFloat MainScreenHeight()
{
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;
}
@implementation UIView (YeeViewAnimation)
-(void)addBaseAnimationType:(YeeBaseAnimationType)Type Duration:(NSTimeInterval)duration
{
    switch (Type) {
        case YeeFromTopType:
        self.transform = CGAffineTransformMakeTranslation(0, -kMainScreenHeight);
            break;
        case YeeFromBottomType:
        self.transform = CGAffineTransformMakeTranslation(0, kMainScreenHeight);
            break;
        case YeeFromLeftType:
            self.transform = CGAffineTransformMakeTranslation(-kMainScreenWidth, 0);
            break;
        case YeeFromRightType:
            self.transform = CGAffineTransformMakeTranslation(kMainScreenWidth,0);
            break;
            
        default:
            break;
    }
    
    [UIView animateWithDuration:duration animations:^{
        self.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished)
    {
        
        
    }];
}
-(void)addBaseAnimationType:(YeeBaseAnimationType)Type Duration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished))completion
{
    switch (Type) {
        case YeeFromTopType:
            self.transform = CGAffineTransformMakeTranslation(0, -kMainScreenHeight);
            break;
        case YeeFromBottomType:
            self.transform = CGAffineTransformMakeTranslation(0, kMainScreenHeight);
            break;
        case YeeFromLeftType:
            self.transform = CGAffineTransformMakeTranslation(-kMainScreenWidth, 0);
            break;
        case YeeFromRightType:
            self.transform = CGAffineTransformMakeTranslation(kMainScreenWidth,0);
            break;
            
        default:
            break;
    }
    [UIView animateWithDuration:duration animations:^{
        self.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished)
     {
         if (completion) {
             completion(finished);
         }
     }];
}
-(void)addBaseSpringAnimationType:(YeeBaseAnimationType)Type Duration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished))completion{
    switch (Type) {
        case YeeFromTopType:
            self.transform = CGAffineTransformMakeTranslation(0, -kMainScreenHeight);
            break;
        case YeeFromBottomType:
            self.transform = CGAffineTransformMakeTranslation(0, kMainScreenHeight);
            break;
        case YeeFromLeftType:
            self.transform = CGAffineTransformMakeTranslation(-kMainScreenWidth, 0);
            break;
        case YeeFromRightType:
            self.transform = CGAffineTransformMakeTranslation(kMainScreenWidth,0);
            break;
            
        default:
            break;
    }
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished)
    {
        if (completion)
        {
            completion(finished);
        }
    }];
    
}
@end
