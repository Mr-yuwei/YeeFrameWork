//
//  UIImage+RoundedCorner.h
//  XClassRoom
//
//  Created by 余伟 on 2017/1/7.
//  Copyright © 2017年 Mr-yuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedCorner)
//这个必须保证UIImage不为空
- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

@end
