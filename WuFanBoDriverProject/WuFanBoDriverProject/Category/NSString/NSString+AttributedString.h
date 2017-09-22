//
//  NSString+AttributedString.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/21.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  普通文本转换为富文本
//  可设置富文本样式
//
/*
 NSFontAttributeName  设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
 NSForegroundColorAttributeName  设置字体颜色，取值为 UIColor对象，默认值为黑色
 NSBackgroundColorAttributeName  设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
 NSLigatureAttributeName  设置连体属性，取值为NSNumber 对象(整数),0 表示没有连体字符，1 表示使用默认的连体字符
 NSKernAttributeName  设定字符间距，取值为 NSNumber 对象（整数）,正值间距加宽，负值间距变窄
 //删除线
 NSStrikethroughStyleAttributeName 设置删除线，取值为 NSNumber 对象（整数）
 NSStrikethroughColorAttributeName 设置删除线颜色，取值为 UIColor 对象，默认值为黑色
//字体描边
 NSStrokeWidthAttributeName 和 NSStrokeColorAttributeName设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心.
 //下划线
 NSUnderlineStyleAttributeName 设置下划线，NSNumber对象 NSUnderlineStyle枚举值
 NSUnderlineColorAttributeName 设置下划线颜色，UIColor对象，默认是黑色
 //阴影属性
 NSShadowAttributeName 设置阴影属性，取值为NSShadow对象
 //背景颜色
 NSBackgroundColorAttributeName 说明:设置文字背景颜色
 //一段文本的字体颜色 
 NSForegroundColorAttributeName 该属性用于指定一段文本的字体颜色。如果不指定该属性，则默认为黑色
 NSTextAttachment**设置文本附件，取值为NSTextAttachment对象 常用于图文混排
 */
#import <Foundation/Foundation.h>
@interface NSString (AttributedString)

//设置富文本中间删除线
+(NSAttributedString*)addeleteLineWithSring:(NSString*)String attColor:(UIColor *)lineColor;
+(NSAttributedString*)addeleteLineWithSring:(NSString*)String attColor:(UIColor *)lineColor atRange:(NSRange)range;

//设置富文本下划线
+(NSAttributedString*)makeunderLineWithSring:(NSString*)String attColor:(UIColor *)lineColor;
+(NSAttributedString*)makeUnderLineWithSring:(NSString*)String attColor:(UIColor *)lineColor atRange:(NSRange)range;

//设置一段文字字体颜色&&字体大小
+(NSAttributedString*)makeForegroundWithSring:(NSString*)String attColor:(UIColor *)attColor atRange:(NSRange)range;
+(NSAttributedString*)makeForegroundWithSring:(NSString*)String attColor:(UIColor *)attColor Forefont:(UIFont *)font  defaultFont:(UIFont *)defaultFont atRange:(NSRange)range;//方法有点龌蹉

//可以为文本的任意段落设置不同颜色
+(NSAttributedString*)makeForegroundWithSring:(NSString*)String attColor:(UIColor *)attColor Forefont:(UIFont *)font atRange:(NSArray *)StringArray;


+(NSAttributedString*)makeForegroundWithSrings:(NSArray*)Strings attColors:(NSArray *)attColors Forefonts:(NSArray *)fonts;




//直播聊天富文本 是否要考虑到等级


@end
