//
//  UIImageView+LinkBlock.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/17.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIImageView+LinkBlock.h"

@implementation UIImageView (LinkBlock)

- (UIImageView * (^)(UIImage *image))yimage{
    
    return ^id(UIImage  *yimage){
        self.image=yimage;
       return self;
    };
}
- (UIImageView * (^)(CGFloat cornerRadius))ycornerRadius{
    
    return ^id(CGFloat  ycornerRadius){
        self.layer.cornerRadius=ycornerRadius;
        self.layer.masksToBounds=YES;
        return self;
    };
}
@end
