//
//  UIView+LinkBlock.m
//  YeeLinkBlock
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIView+LinkBlock.h"

@implementation UIView (LinkBlock)

-(UIView *)showInView:(UIView *)InView{
    
    [InView addSubview:self];
    return self;
    
}
- (UIView * (^)(UIView *View))InView{
  
    return ^id(UIView  *InView){
        
        [InView addSubview:self];
        
        return self;
    };
}


@end
