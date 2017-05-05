//
//  ContHeader.h
//  HappyRent
//
//  Created by CoderYee on 2017/3/28.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#ifndef ContHeader_h
#define ContHeader_h
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


#define KNavigationBarHeight   44.0f
#define KTabBarHeight          49.0f
#define KStatusBarHeight       20.0f

#define KcontentViewHeight      kMainScreenHeight-KNavigationBarHeight-KStatusBarHeight

#define KcontentTabViewHeight     KcontentViewHeight-KTabBarHeight

#define KCornerRadiusWidth     5.0f

#define KCornerBorderWidth     0.3f

#define IPhone4_5_6_6P(a,b,c,d) (CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size) ?(a) :(CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size) ? (b) : (CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size) ?(c) : (CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size) ?(d) : 0))))

#endif /* ContHeader_h */
