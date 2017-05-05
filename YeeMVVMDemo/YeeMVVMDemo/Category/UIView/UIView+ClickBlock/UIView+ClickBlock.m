//
//  UIView+ClickBlock.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIView+ClickBlock.h"
#include <objc/runtime.h>
static const void *UIView_clickBlock = "UIView_clickBlock";

@implementation UIView (ClickBlock)

@dynamic clickBlock;
-(void)setClickBlock:(ViewClickBlock)clickBlock
{
    self.userInteractionEnabled=YES;
    UITapGestureRecognizer  *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClickWithGes:)];
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, UIView_clickBlock, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
-(void)imageClickWithGes:(UIGestureRecognizer *)tap
{
    __weak typeof(self)weakself=self;
    ViewClickBlock  clickBlock=objc_getAssociatedObject(self, UIView_clickBlock);
    if (clickBlock) {
        
        clickBlock(weakself);
    }
}

@end
