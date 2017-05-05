//
//  NSString+AttributedString.m
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/21.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)

+(NSAttributedString*)addeleteLineWithSring:(NSString*)String attColor:(UIColor *)lineColor{
    return [NSString addeleteLineWithSring:String attColor:lineColor atRange:NSMakeRange(0, String.length)];
}
+(NSAttributedString*)addeleteLineWithSring:(NSString*)String attColor:(UIColor *)lineColor atRange:(NSRange)range{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSStrikethroughColorAttributeName:lineColor};
    NSMutableAttributedString *attribtStr =[[NSMutableAttributedString alloc] initWithString:String];
    [attribtStr setAttributes:attribtDic range:range];
    return attribtStr;
}
//设置富文本下划线
+(NSAttributedString*)makeunderLineWithSring:(NSString*)String attColor:(UIColor *)lineColor{
    return [NSString makeUnderLineWithSring:String attColor:lineColor atRange:NSMakeRange(0, String.length)];
}
+(NSAttributedString*)makeUnderLineWithSring:(NSString*)String attColor:(UIColor *)lineColor atRange:(NSRange)range{
    
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSUnderlineColorAttributeName:lineColor};
    NSMutableAttributedString *attribtStr =[[NSMutableAttributedString alloc] initWithString:String];
    [attribtStr setAttributes:attribtDic range:range];
    return attribtStr;
}
//设置一段文字的背景颜色&&字体颜色&&字体大小
+(NSAttributedString*)makeForegroundWithSring:(NSString*)String attColor:(UIColor *)attColor atRange:(NSRange)range{
    
    return [NSString  makeForegroundWithSring:String attColor:attColor Forefont:[UIFont systemFontOfSize:16] defaultFont:[UIFont systemFontOfSize:14] atRange:NSRangeFromString(String)];
}
+(NSAttributedString*)makeForegroundWithSring:(NSString*)String attColor:(UIColor *)attColor Forefont:(UIFont *)font  defaultFont:(UIFont *)defaultFont atRange:(NSRange)range{
    NSMutableAttributedString *attribtStr =[[NSMutableAttributedString alloc] initWithString:String];
    NSDictionary *defauattribtDic =@{NSFontAttributeName: defaultFont};
    [attribtStr  setAttributes:defauattribtDic range:NSRangeFromString(String)];
    NSDictionary *attribtDic =@{NSForegroundColorAttributeName: attColor,NSFontAttributeName: font};
    [attribtStr setAttributes:attribtDic range:range];
    return attribtStr;
}
+(NSAttributedString*)makeForegroundWithSring:(NSString*)String attColor:(UIColor *)attColor Forefont:(UIFont *)font atRange:(NSArray *)StringArray{
    
    NSMutableAttributedString *attribtStr =[[NSMutableAttributedString alloc] initWithString:String];
    for (NSString *string in StringArray) {
        
        NSDictionary *attribtDic =@{NSForegroundColorAttributeName: attColor,NSFontAttributeName: font};
        [attribtStr setAttributes:attribtDic range:NSRangeFromString(string)];
    }
    return attribtStr;
}
+(NSAttributedString*)makeForegroundWithSrings:(NSArray*)Strings attColors:(NSArray *)attColors Forefonts:(NSArray *)fonts{
    
    NSMutableAttributedString *attribtStr =[[NSMutableAttributedString alloc] init];
    
    for (NSInteger i=0; i<Strings.count; i++) {
        
        NSString *string=Strings[i];

        NSMutableAttributedString *attr=[[NSMutableAttributedString alloc] initWithString:Strings[i]];
    
        NSDictionary *attribtDic =@{NSForegroundColorAttributeName: attColors[i],NSFontAttributeName: fonts[i]};

        [attr setAttributes:attribtDic range:NSMakeRange(0, string.length)];
    
        [attribtStr appendAttributedString:attr];
        
    }
    
    return attribtStr;
}
@end
