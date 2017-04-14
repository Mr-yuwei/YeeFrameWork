//
//  YWButton.h
//  YWZhihuDaily
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YWButtonEdgeInsetsStyle) {
    YWButtonEdgeInsetsStyleImageLeft,
    YWButtonEdgeInsetsStyleImageRight,
    YWButtonEdgeInsetsStyleImageTop,
    YWButtonEdgeInsetsStyleImageBottom
};



IB_DESIGNABLE
@interface YWButton : UIButton
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger edgeInsetsStyle;
#else
@property (nonatomic) YWButtonEdgeInsetsStyle edgeInsetsStyle;
#endif
@property (nonatomic) IBInspectable CGFloat imageTitleSpace;

@end