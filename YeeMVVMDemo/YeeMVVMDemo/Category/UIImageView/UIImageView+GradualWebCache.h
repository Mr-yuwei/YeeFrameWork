//
//  UIImageView+GradualWebCache.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/20.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置渐变效果，应该会有crash

#define  sdg(a,b) [a sdg_setImageWithURL:[NSURL URLWithString:b] placeholderImage:placeImage] 

#define   sdgp(a,b,c)  [a sdg_setImageWithURL:[NSURL URLWithString:b] placeholderImage:c]
 

@interface UIImageView (GradualWebCache)

- (void)sdg_setImageWithURL:(NSURL *)url;

- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)sdg_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock;


- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;


- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;


- (void)sdg_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;

@end
