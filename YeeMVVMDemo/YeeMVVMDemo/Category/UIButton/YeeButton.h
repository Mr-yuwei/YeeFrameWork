//
//  YeeButton.h
//  LeaderScience
//
//  Created by CoderYee on 2017/2/6.
//  Copyright © 2017年 YeeCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YeeButtonEdgeInsetsStyle)
{
    YeeButtonEdgeInsetsStyleImageLeft,
    YeeButtonEdgeInsetsStyleImageRight,
    YeeButtonEdgeInsetsStyleImageTop,
    YeeButtonEdgeInsetsStyleImageBottom
};

IB_DESIGNABLE
@interface YeeButton : UIButton
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger edgeInsetsStyle;
#else
@property (nonatomic) YeeButtonEdgeInsetsStyle edgeInsetsStyle;
#endif
@property (nonatomic) IBInspectable CGFloat imageTitleSpace;



@end
