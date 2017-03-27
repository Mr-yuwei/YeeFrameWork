//
//  SinaHeaderView.h
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SinaHeaderViewdelegate <NSObject>

-(void)clickTouchView:(UIView *)touchView inView:(UIView *)inView;

@end
@interface SinaHeaderView : UIView

@property(nonatomic,retain)UIImageView  *imageView;

@property(nonatomic,weak)id<SinaHeaderViewdelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame;



@end
