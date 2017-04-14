//
//  UIView+LinkBlock.h
//  YeeLinkBlock
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LinkBlock)

-(UIView *)showInView:(UIView *)InView;

- (UIView * (^)(UIView *View))InView;





@end
