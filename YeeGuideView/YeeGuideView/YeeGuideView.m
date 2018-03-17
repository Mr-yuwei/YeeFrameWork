//
//  YeeGuideView.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "YeeGuideView.h"
@interface YeeGuideView ()

@property(nonatomic,retain)CAShapeLayer *maskLayer;

@end
@implementation YeeGuideView



-(void)setFillColor:(UIColor *)fillColor{
    
    
}
#pragma mark lazyMethod
-(CAShapeLayer*)maskLayer{
    
    if (_maskLayer==nil)
    {
        _maskLayer=[CAShapeLayer layer];
        _maskLayer.fillRule = kCAFillRuleEvenOdd;
        _maskLayer.fillColor =[UIColor lightGrayColor].CGColor;
        _maskLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    }
    return _maskLayer;
}

@end
