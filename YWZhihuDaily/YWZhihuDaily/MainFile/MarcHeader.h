//
//  MarcHeader.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#ifndef MarcHeader_h
#define MarcHeader_h
//=======================通用坐标=======================
#define StatusBarHeight             20
#define NavBarHeight                44
#define StatusAndNavBarHeight       64
#define TabBarHeight                49
#define StatusAndNavAndTabBarHeight 113
//=======================通用坐标=======================

//=======================颜色=======================
//RGB(0-255)
#define RGBA(r,g,b,a)                     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//RGB(十六进制)
#define ColorFromRGB(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
//=======================颜色=======================

//宽
#define kScreenWidth                 ([[UIScreen mainScreen] bounds].size.width)


//高
#define kScreenHeight                ([[UIScreen mainScreen] bounds].size.height)

//距离中心点的位置
#define CentenrLeftwith                      65
// 侧滑栏View的宽度
#define launchwith                  ([[UIScreen mainScreen] bounds].size.width)*0.5+CentenrLeftwith

//=======================Frame=======================
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y

#define kMinX(v)            CGRectGetMinX((v).frame)
#define kMinY(v)            CGRectGetMinY((v).frame)

#define kMidX(v)            CGRectGetMidX((v).frame)
#define kMidY(v)            CGRectGetMidY((v).frame)

#define kMaxX(v)            CGRectGetMaxX((v).frame)
#define kMaxY(v)            CGRectGetMaxY((v).frame)

#define kGetWidth(v)        CGRectGetWidth((v).frame)
#define kGetHeight(v)       CGRectGetHeight((v).frame)
//=======================Frame=======================

//角度和弧度转换
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)

//主window
#define MainWindow [UIApplication sharedApplication].windows[0]

//本地存
#define WriteForLocation(OBJECT,KEY) \
[[NSUserDefaults standardUserDefaults] setObject:OBJECT forKey:KEY];\
[[NSUserDefaults standardUserDefaults] synchronize];

//本地取
#define ReadForLocation(KEY)         [[NSUserDefaults standardUserDefaults] objectForKey:KEY]

//预防Block循环引用
#define WS(WeakSelf)  __weak __typeof(self)WeakSelf = self;

//字体大小（常规/粗体）（17）
#define BoldSystemFont(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SystemFont(FONTSIZE)     [UIFont systemFontOfSize:FONTSIZE]
#define Font(NAME,FONTSIZE)      [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//=======================判断设备类型=======================
//判断是否是iPhone6Plus的设备
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否是iPhone6的设备  iPhone6 Plus采用5.5寸屏，1920*1080分辨率
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否是iphone5的设备
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否是iphone4的设备
#define iPhone4  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#endif /* MarcHeader_h */
