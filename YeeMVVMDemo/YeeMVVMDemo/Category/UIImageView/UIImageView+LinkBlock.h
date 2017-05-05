//
//  UIImageView+LinkBlock.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/17.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#define   YImageView  [UIImageView new]

@interface UIImageView (LinkBlock)

- (UIImageView * (^)(UIImage *image))yimage;

- (UIImageView * (^)(CGFloat cornerRadius))ycornerRadius;

@end
