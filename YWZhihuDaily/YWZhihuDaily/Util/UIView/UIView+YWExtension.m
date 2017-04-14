//
//  UIView+YWExtension.m
//  YWBaseFrameWork
//
//  Created by mac on 16/7/16.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "UIView+YWExtension.h"

@implementation UIView (YWExtension)

-(float) x
{
    return self.frame.origin.x;
}

-(void) setX:(float) newX
{
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

-(float) y
{
    return self.frame.origin.y;
}

-(void) setY:(float) newY
{
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

-(float) width
{
    return self.frame.size.width;
}

-(void) setWidth:(float) newWidth
{
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

-(float) height
{
    return self.frame.size.height;
}

-(void) setHeight:(float) newHeight
{
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

-(float) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(float)newRight
{
    float newWidth = fmaxf(newRight-self.frame.origin.x, 0);
    [self setWidth:newWidth];
}

- (float) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(float)newbottom
{
    [self setHeight:fmaxf(newbottom-self.frame.origin.y, 0)];
}

- (CGSize) size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint) origin
{
    return self.frame.origin;
}

- (void) setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

@end


@implementation UIView(YWScreenShot)
+ (UIImage *)YWscreenShot
{
    //用于截屏弹框用
    UIView *view = [UIApplication sharedApplication].keyWindow;
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat barHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    if ([UIApplication sharedApplication].statusBarHidden == NO)
    {
        CGFloat scale  = [[UIScreen mainScreen] scale];
        CGRect  rect   = CGRectMake(0, barHeight * scale, view.bounds.size.width * scale, (view.bounds.size.height - barHeight) * scale);
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
          image        = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
        CFRelease(imageRef);
    }
    
    return image;
}
@end
