//
//  YWLeftModel.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/20.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWLeftModel.h"

@implementation YWLeftModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    NSDictionary *dict = @{@"descriptions":@"description"};
    return dict;
}
@end

@implementation YWLeftthemeListModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    NSDictionary *dict = @{@"descriptions":@"description"};
    return dict;
}

//如果model中有属性是个数组 需要用到这个方法
+ (NSDictionary *)mj_objectClassInArray
{
    //说明array这个字段存放的是 SubModel 类型的对象
    NSDictionary *dict = @{@"stories" :[YWLeftthemeStoriesModel class],@"editors" :[YWLeftthemeeditorsModel class]};
    return dict;
}
@end

@implementation YWLeftthemeeditorsModel


@end

@implementation YWLeftthemeStoriesModel

@end
