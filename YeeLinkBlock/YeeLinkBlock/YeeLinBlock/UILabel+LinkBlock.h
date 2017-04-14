//
//  UILabel+LinkBlock.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/11.
//  Copyright © 2017年 内圈科技. All rights reserved.
//  函数式编程初尝试
//

#import <UIKit/UIKit.h>

#define   YLable    [UILabel new]

@interface UILabel (LinkBlock)


+(UILabel *)Init;

- (UILabel * (^)(UIFont *font))yfont;

- (UILabel * (^)(CGRect frame))yframe;

- (UILabel * (^)(CGRect bounds))ybounds;

- (UILabel * (^)(UIColor *textColor))ytextColor;

- (UILabel * (^)(UIColor *backgroundColor))ybackgroundColor;

- (UILabel * (^)(NSInteger numberOfLines))ynumberOfLines;

- (UILabel * (^)(NSTextAlignment textAlignment))ytextAlignment;

- (UILabel * (^)(NSString *text))ytext;

- (UILabel * (^)(NSAttributedString *attributedText))yattributedText;

- (UILabel * (^)(CGFloat cornerRadius))ycornerRadius;

- (UILabel * (^)(UIView *View))InView;


@end
