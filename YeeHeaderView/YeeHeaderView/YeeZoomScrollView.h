//
//  YeeZoomScrollView.h
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YeeZoomScrollView : UIScrollView

-(instancetype)initWithFrame:(CGRect)frame withImageUrlString:(NSString *)Urlstring;

-(instancetype)initWithFrame:(CGRect)frame withImageUrlString:(NSString *)Urlstring placeImage:(UIImage *)image;

@end
