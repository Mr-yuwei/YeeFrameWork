//
//  NSString+Avail.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/21.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  主要用于正则匹配
//

#import <Foundation/Foundation.h>

@interface NSString (Avail)

/// 验证字符串为空 ,为空:YES, 不为空:NO
+ (BOOL)stringIsNULL:(NSString *)string;

/// 验证手机号码, 正确:YES , 错误: 提示
+(BOOL)isMobileNumber:(NSString *)string;

//判断是否是邮箱
+(BOOL)isEmail:(NSString *)email;

//判断是否身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

/* 判断文本是否包含emoji */
+ (BOOL)isContainsEmoji:(NSString *)string;


@end
