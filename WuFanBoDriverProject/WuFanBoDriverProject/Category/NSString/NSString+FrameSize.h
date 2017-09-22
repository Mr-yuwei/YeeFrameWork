//
//  NSString+FrameSize.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/21.
//  Copyright © 2017年 CodeYee. All rights reserved.
//主要用于计算文本的高度
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (FrameSize)

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode align:(NSTextAlignment)alignment;

+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width;

+ (CGFloat)getCellHeightWithTags:(NSArray *)tags layout:(UICollectionViewFlowLayout *)layout font:(UIFont *)font space:(CGFloat)space width:(CGFloat)width;

@end
