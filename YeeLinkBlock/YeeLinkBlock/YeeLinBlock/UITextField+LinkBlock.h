//
//  UITextField+LinkBlock.h
//  YeeLinkBlock
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#define   YTextField      [UITextField new]

@interface UITextField (LinkBlock)

- (UITextField * (^)(UIFont *font))yfont;

- (UITextField * (^)(CGRect frame))yframe;

- (UITextField * (^)(CGRect bounds))ybounds;

- (UITextField * (^)(UIColor *textColor))ytextColor;

- (UITextField * (^)(UIColor *backgroundColor))ybackgroundColor;

- (UITextField * (^)(NSTextAlignment textAlignment))ytextAlignment;

- (UITextField * (^)(NSString *text))ytext;
- (UITextField * (^)(NSAttributedString *attributedText))yattributedText;

- (UITextField * (^)(NSString *yplaceholder))yplaceholder;
- (UITextField * (^)(NSAttributedString *attributedPlaceholder))yattributedPlaceholder;

- (UITextField * (^)(UITextBorderStyle borderStyle))yborderStyle;



//leftView rightView

- (UITextField * (^)(UIView  *leftView))yleftView;

- (UITextField * (^)(UIView  *rightView))yrightView;

- (UITextField * (^)(UITextFieldViewMode  leftViewMode))yleftViewMode;

- (UITextField * (^)(UITextFieldViewMode  rightViewMode))yrightViewMode;




@end
