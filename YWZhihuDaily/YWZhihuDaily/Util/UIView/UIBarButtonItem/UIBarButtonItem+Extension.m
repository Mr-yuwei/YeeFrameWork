//   UIBarButtonItem+Extension.m
//
//
//  Created by MD101 on 15/9/4.
//  Copyright (c) 2015年 . All rights reserved.
//
#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image higImage:(NSString *)higImage target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    // 设置对应状态图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:higImage] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 0)];
    btn.frame = CGRectMake(0, 20, 40, 44);
    
    // 添加监听事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item1;

}
@end
