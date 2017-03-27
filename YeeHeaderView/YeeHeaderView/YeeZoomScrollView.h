//
//  YeeZoomScrollView.h
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YeeZoomScrollViewClickBlock)(UIImageView *imageView);
@interface YeeZoomScrollView : UIScrollView

@property(nonatomic,copy)YeeZoomScrollViewClickBlock clickBlock;

-(instancetype)initWithFrame:(CGRect)frame withImageUrlString:(NSString *)Urlstring;

-(instancetype)initWithFrame:(CGRect)frame withImageUrlString:(NSString *)Urlstring placeImage:(UIImage *)image;


@end
