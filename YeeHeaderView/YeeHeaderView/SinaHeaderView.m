//
//  SinaHeaderView.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "SinaHeaderView.h"
#import "UIImageView+ClickBlock.h"

@implementation SinaHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
  
    if (self=[super initWithFrame:frame])
    {
        [self addOwnView];
    }
    
  return   self ;
}
-(void)addOwnView
{
    //baoming2
    UIImageView  *BackimageView=[[UIImageView alloc] initWithFrame:self.bounds];
    [BackimageView setImage:[UIImage imageNamed:@"1"]];
    BackimageView.alpha=0.8;
    [self addSubview:BackimageView];
    _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    _imageView.center=self.center;
    _imageView.layer.masksToBounds=YES;
    _imageView.layer.cornerRadius=30.f;
    _imageView.contentMode=UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds=YES;
    [_imageView setImage:[UIImage imageNamed:@"baoming2"]];
    [self addSubview:_imageView];
    __weak typeof(self)weakself=self;
    //图片点击事件
    _imageView.clickBlock=^(UIImageView *imageView){
      
        if (weakself.delegate&&[weakself.delegate respondsToSelector:@selector(clickTouchView:inView:)]) {
            
            [weakself.delegate clickTouchView:imageView inView:weakself];
            
        }
        
    };
    
}
@end
