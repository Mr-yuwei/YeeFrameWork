//
//  ContHeader.h
//  HappyRent
//
//  Created by Yee on 2017/3/28.
//  Copyright © 2017年 WuFanBao. All rights reserved.
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


#define KNavigationBarHeight   44.0f //44 ;
#define KTabBarHeight          IPhoneX_Normal(83.0f,49.0f) // 49 -> 83
#define KStatusBarHeight       IPhoneX_Normal(44.0f,20.0f)  //20 44  -->88

#define KcontentViewHeight      kMainScreenHeight-KNavigationBarHeight-KStatusBarHeight

#define KcontentTabViewHeight   KcontentViewHeight-KTabBarHeight

#define KCornerRadiusWidth     5.0f

#define KCornerBorderWidth     0.3f

//#define IPhoneNormal_X(a,b)  CGSizeEqualToSize(CGSizeMake(375, 812),[[UIScreen mainScreen] bounds].size)? b:a

#define IPhoneX_Normal(a,b)  ((CGSizeEqualToSize( CGSizeMake(375, 812),[[UIScreen mainScreen] bounds].size) )? a:b)





#define IPhone4_5_6_6P_X(a,b,c,d,e) (CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size) ?(a) :(CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size) ? (b): (CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size) ?(c) : (CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size) ?(d) : (CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size) ?(e) :0)))))

#endif /* ContHeader_h */
