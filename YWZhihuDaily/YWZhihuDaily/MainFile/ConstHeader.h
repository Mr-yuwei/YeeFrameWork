//
//  ConstHeader.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#ifndef ConstHeader_h
#define ConstHeader_h
#import "ColorMacrHeader.h"



#define kTextRedColor       RGBOF(0xD54A45)

#define kTCShowMultiSubViewSize CGSizeMake(80, 120)

//=========================================================
// CommonLibrary UI样式配置

// 背景色
#define kAppBakgroundColor          RGBOF(0xEFEFF4)

// 导航主色调
#define kNavBarThemeColor             RGBOF(0x0071C7)

#ifndef kCommonLargeTextFont
// CommonLibrary中常用的字体
#define kCommonLargeTextFont       [UIFont systemFontOfSize:16]
#endif

#ifndef kCommonMiddleTextFont
#define kCommonMiddleTextFont      [UIFont systemFontOfSize:14]
#endif

#ifndef kCommonSmallTextFont
#define kCommonSmallTextFont       [UIFont systemFontOfSize:12]
#endif




#endif /* ConstHeader_h */
