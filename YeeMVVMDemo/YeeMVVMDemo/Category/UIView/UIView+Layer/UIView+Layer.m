//
//  UIView+Layer.m
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/24.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

-(void)setlayerCornerRadius:(CGFloat)radius{
    
    UIBezierPath *path= [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners: UIRectCornerAllCorners  cornerRadii:CGSizeMake(self.frame.size.height*0.5, self.frame.size.height*0.5)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    //添加border
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = maskLayer.path;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor blackColor].CGColor;
    borderLayer.lineWidth =radius;
    borderLayer.frame = self.bounds;
    [self.layer addSublayer:borderLayer];
    [self.layer setMasksToBounds:YES];
}
-(void)setlayerCornerRadius:(CGFloat)radius borderwidth:(CGFloat)width boderColor:(UIColor *)boderColor{
    
    UIBezierPath *path= [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners: UIRectCornerAllCorners  cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    
    
    
    //添加border
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = maskLayer.path;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = boderColor.CGColor;
    borderLayer.lineWidth =width;
    borderLayer.frame = self.bounds;
    [self.layer addSublayer:borderLayer];
    [self.layer setMasksToBounds:YES];
}

-(void)setGradientChangingColor:(UIView *)view fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor{
    // CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)fromColor.CGColor,(__bridge id)toColor.CGColor];
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@0.5,@1];
    
    [view.layer addSublayer:gradientLayer];
}
-(void)setlayerCornerRadius:(CGFloat)radius withUIRectCorner:(UIRectCorner)Corner{
    
    UIBezierPath *path= [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners: Corner  cornerRadii:CGSizeMake(self.frame.size.height*0.5, self.frame.size.height*0.5)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}
@end
