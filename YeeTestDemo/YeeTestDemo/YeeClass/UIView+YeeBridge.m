//
//  UIView+YeeBridge.m
//  pbuXingLianClient
//
//  Created by Yee on 2017/7/6.
//  Copyright © 2017年 1bu2bu. All rights reserved.
//

#import "UIView+YeeBridge.h"
#include <objc/runtime.h>
@implementation UIView (YeeBridge)

-(void)makeBridge:(NSInteger)co{
   
    
    UIView *bridgeView=[[UIView alloc] init];
    
    
    UILabel *textLable=[[UILabel alloc] init];
    textLable.textColor=[UIColor whiteColor];
    textLable.font=[UIFont systemFontOfSize:10];
    textLable.text=[NSString stringWithFormat:@"%ld",co];;
    textLable.textAlignment=NSTextAlignmentCenter;//居中对齐
    CGSize size=[self getSizeWithString:textLable.text Font:textLable.font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    [textLable setFrame:CGRectMake(0, 0, size.width+10,  size.width+10)];
    //用lable去固定layer
    CAShapeLayer  *shapeLayer=[CAShapeLayer layer];
    shapeLayer.path=[UIBezierPath  bezierPathWithRoundedRect:textLable.bounds cornerRadius:40].CGPath;
    shapeLayer.fillColor=[UIColor redColor].CGColor;
//    [textLable setBackgroundColor:[UIColor grayColor]];
    [bridgeView setFrame:CGRectMake(self.frame.size.width, 0, size.width+10,  size.width+10)];
    [bridgeView.layer addSublayer:shapeLayer];
    [bridgeView addSubview:textLable];
    [self addSubview:bridgeView];
    
}
#pragma mark 获取字体宽度
- (CGSize)getSizeWithString:(NSString *)string Font:(UIFont *)font constrainedToSize:(CGSize)size{
    CGSize resultSize = CGSizeZero;
    if (string.length <= 0) {
        return resultSize;
    }
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    resultSize = [string boundingRectWithSize:CGSizeMake(floor(size.width), floor(size.height))//用相对小的 width 去计算 height / 小 heigth 算 width
                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                 attributes:@{NSFontAttributeName: font,
                                              NSParagraphStyleAttributeName: style}
                                    context:nil].size;
    resultSize = CGSizeMake(floor(resultSize.width + 1), floor(resultSize.height + 1));//上面用的小 width（height） 来计算了，这里要 +1
    return resultSize;
}
@end
