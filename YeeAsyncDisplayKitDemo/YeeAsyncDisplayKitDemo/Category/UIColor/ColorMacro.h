//
//  ColorMarcro.h
//  CommonLibrary
//
//  Created by Alexi on 13-10-23.
//  Copyright (c) 2013年 ywchen. All rights reserved.
//

#ifndef CommonLibrary_ColorMarcro_h
#define CommonLibrary_ColorMarcro_h

#import "UIColor+MLPFlatColors.h"


// 取色值相关的方法
#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:1.f]

#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:(a)]

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                            green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                             blue:((float)(rgbValue & 0xFF))/255.0 \
                                            alpha:1.0]

#define RGBA_OF(rgbValue)   [UIColor colorWithRed:((float)(((rgbValue) & 0xFF000000) >> 24))/255.0 \
                                             green:((float)(((rgbValue) & 0x00FF0000) >> 16))/255.0 \
                                              blue:((float)(rgbValue & 0x0000FF00) >> 8)/255.0 \
                                             alpha:((float)(rgbValue & 0x000000FF))/255.0]

#define RGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
                                            green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
                                             blue:((float)(v & 0x0000FF))/255.0 \
                                            alpha:a]


// 定义通用颜色
#define yBlackColor         [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.00]
#define yDarkGrayColor      [UIColor darkGrayColor]
#define yLightGrayColor     [UIColor lightGrayColor]
#define yWhiteColor         [UIColor whiteColor]
#define yGrayColor          [UIColor grayColor]
#define yRedColor           [UIColor redColor]
#define yGreenColor         [UIColor greenColor]
#define yBlueColor          [UIColor blueColor]
#define yCyanColor          [UIColor cyanColor]
#define yYellowColor        [UIColor yellowColor]
#define yMagentaColor       [UIColor magentaColor]
#define yOrangeColor        [UIColor orangeColor]
#define yPurpleColor        [UIColor purpleColor]
#define yClearColor         [UIColor clearColor]

#define yRandomFlatColor    [UIColor randomFlatColor]


#endif
