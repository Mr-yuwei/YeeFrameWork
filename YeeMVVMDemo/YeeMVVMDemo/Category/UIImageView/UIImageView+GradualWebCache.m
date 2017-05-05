//
//  UIImageView+GradualWebCache.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/20.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIImageView+GradualWebCache.h"
#import <objc/runtime.h>
#import "UIView+WebCacheOperation.h"
@implementation UIImageView (GradualWebCache)

- (void)sdg_setImageWithURL:(NSURL *)url
{
    [self sdg_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self sdg_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self sdg_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}
- (void)sdg_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sdg_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}
- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sdg_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sdg_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
    
}
//这里需要设置渐变动画
- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sd_cancelCurrentImageLoad];
    if (!(options & SDWebImageDelayPlaceholder)) {
        dispatch_main_async_safe(^{
            
            self.image = placeholder;
        });
    }
    if (url) {
        __weak __typeof(self)wself = self;
        id <SDWebImageOperation> operation = [SDWebImageManager.sharedManager downloadImageWithURL:url options:options progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            //[wself removeActivityIndicator];
            if (!wself) return;
            dispatch_main_sync_safe(^{
                if (!wself) return;
                if (image && (options & SDWebImageAvoidAutoSetImage) && completedBlock)
                {
                    completedBlock(image, error, cacheType, url);
                    return;
                }
                else if (image) {
                    CATransition *animation = [CATransition animation];
                    animation.duration = .35f;//动画持续时间
                    animation.type = kCATransitionFade;
                    animation.removedOnCompletion = YES;
                    [wself.layer addAnimation:animation forKey:@"transition"];
                    wself.image = image;
                    [wself setNeedsLayout];
                } else {
                    if ((options & SDWebImageDelayPlaceholder)) {
                        wself.image = placeholder;
                        [wself setNeedsLayout];
                    }
                }
                if (completedBlock && finished) {
                    completedBlock(image, error, cacheType, url);
                }
            });
        }];
        
        [self.layer removeAnimationForKey:@"transition"];
        [self sd_setImageLoadOperation:operation forKey:@"UIImageViewImageLoad"];
        
    } else {
        dispatch_main_async_safe(^{
            if (completedBlock) {
                NSError *error = [NSError errorWithDomain:SDWebImageErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Trying to load a nil url"}];
                [self.layer removeAnimationForKey:@"transition"];
                completedBlock(nil, error, SDImageCacheTypeNone, url);
            }
        });
    }
}


@end
