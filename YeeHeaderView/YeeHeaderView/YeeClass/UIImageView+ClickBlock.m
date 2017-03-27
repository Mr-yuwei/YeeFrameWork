//
//  UIImageView+ClickBlock.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "UIImageView+ClickBlock.h"
#include <objc/runtime.h>
static const void *UIImageView_clickBlock = "UIImageView_clickBlock";

@implementation UIImageView (ClickBlock)
@dynamic clickBlock;
-(void)setClickBlock:(ImageClickBlock)clickBlock
{
    self.userInteractionEnabled=YES;
    UITapGestureRecognizer  *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClickWithGes:)];
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, UIImageView_clickBlock, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
-(void)imageClickWithGes:(UIGestureRecognizer *)tap
{
    ImageClickBlock  clickBlock=objc_getAssociatedObject(self, UIImageView_clickBlock);
    if (clickBlock) {
        
        clickBlock(self);
    }
}
@end
