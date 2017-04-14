//
//   UIBarButtonItem+Extension.h
//
//
//  Created by MD101 on 15/9/4.
//  Copyright (c) 2015年 . All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image higImage:(NSString *)higImage  target:(id)target action:(SEL)action;
@end
