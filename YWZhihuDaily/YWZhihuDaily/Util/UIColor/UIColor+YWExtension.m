//
//  UIColor+YWExtension.m
//  YWBaseFrameWork
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "UIColor+YWExtension.h"

@implementation UIColor (YWExtension)

+ (UIColor *)colorWithString:(NSString *)string{
    
    
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    NSScanner *scanner;
    scanner = [[NSScanner alloc] initWithString:rString];
    [scanner scanHexInt:&r];
    
    scanner = [[NSScanner alloc] initWithString:gString];
    [scanner scanHexInt:&g];
    
    scanner = [[NSScanner alloc] initWithString:bString];
    
    [scanner scanHexInt:&b];
    
    UIColor *resultColor = [[UIColor alloc] initWithRed:((float) r / 255.0f)
                                                  green:((float) g / 255.0f)
                                                   blue:((float) b / 255.0f)
                                                  alpha:1.0f];
    return resultColor;

}

+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha{
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
    
}

@end
