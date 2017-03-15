//
//  YeeButton.h
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YeeButtonType)
{   YeeButtonImageLeft,
    YeeButtonImageRight,
    YeeButtonImageTop,
    YeeButtonImageBottom
};


@interface YeeButton : UIControl

@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)UILabel     *titleLable;
@property(nonatomic,assign,readonly)YeeButtonType buttonType;

+(YeeButton*)buttonWithType:(YeeButtonType)buttonType;

- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state ;
- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state;
- (void)setImage:(UIImage *)image forState:(UIControlState)state;

@end
