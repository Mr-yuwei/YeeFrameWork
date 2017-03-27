//
//  UIImageView+ClickBlock.h
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageClickBlock)(UIImageView *imageView);

@interface UIImageView (ClickBlock)

@property(nonatomic,copy)ImageClickBlock clickBlock;


@end
