//
//  YWBaseModel.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWBaseModel.h"
#import "MJExtension.h"

@implementation YWBaseModel
//打印所有属性
MJLogAllIvars

//使该model类实现NSCoding协议，用于归档
MJCodingImplementation
//把null的字段转换为空字符串
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    //把null属性处理成空字符串
    if ([oldValue isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    //把没有的字段处理成空字符串
    if (!oldValue)
    {
        return @"";
    }
    return oldValue;
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    NSDictionary *dict = @{@"ID":@"id"};
    return dict;
    
}
@end
