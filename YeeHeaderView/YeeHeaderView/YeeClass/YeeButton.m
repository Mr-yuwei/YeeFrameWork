//
//  YeeButton.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "YeeButton.h"
@interface YeeButton ()
{
    NSMutableDictionary  *_titleDic;
    NSMutableDictionary  *_imageDic;

}
@end
@implementation YeeButton

+(YeeButton*)buttonWithType:(YeeButtonType)buttonType
{
    YeeButton *button=[[YeeButton alloc] initWithFrame:CGRectZero ButtonType:buttonType];
    return button;
    
}
-(instancetype)initWithFrame:(CGRect)frame ButtonType:(YeeButtonType)type
{
    if (self=[super initWithFrame:frame])
    {
        _buttonType=type;
        [self addSubview:self.imageView];
        [self addSubview:self.titleLable];
        _titleDic=[[NSMutableDictionary alloc] init];
        _imageDic=[[NSMutableDictionary alloc] init];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        _buttonType=YeeButtonImageLeft;
        [self addSubview:self.imageView];
        [self addSubview:self.titleLable];
        
    }
    return self;
}
-(instancetype)init
{
    if (self=[super init])
    {
        _buttonType=YeeButtonImageLeft;
        [self addSubview:self.imageView];
        [self addSubview:self.titleLable];
    }
    return self;
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    _titleDic[@(state)]=title;
}
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
 
    
    
}
- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state
{
   
    
}
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    _imageDic[@(state)]=image;
}
-(void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    NSLog(@"enabled");
}
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    NSLog(@"selected");
}
-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self configureButtonState];
    NSLog(@"highlighted");
    
}
-(void)configureButtonState
{
    UIControlState controlState = [self currentControlState];
    _titleLable.text=_titleDic[@(controlState)]?_titleDic[@(controlState)]:_titleDic[@(UIControlStateNormal)];
    [_imageView setImage:_imageDic[@(controlState)]?_imageDic[@(controlState)]:_imageDic[@(UIControlStateNormal)]];
}
#pragma mark 获取当前UIControl的状态
- (UIControlState)currentControlState
{
    UIControlState controlState = UIControlStateNormal;
    if (self.selected)
    {
        controlState += UIControlStateSelected;
    }
    if (self.highlighted)
    {
        controlState += UIControlStateHighlighted;
    }
    if (!self.enabled)
    {
        controlState += UIControlStateDisabled;
    }
    
    return controlState;
}
#pragma mark layout
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    switch (_buttonType) {
        case YeeButtonImageLeft:
            return  CGRectMake(CGRectGetWidth(contentRect)*0.4, 0, CGRectGetWidth(contentRect)*0.6, CGRectGetHeight(contentRect));
            break;
        case YeeButtonImageRight:
            return CGRectMake(0,0, CGRectGetWidth(contentRect)*0.6, CGRectGetHeight(contentRect));
            break;
        case YeeButtonImageTop:
            return CGRectMake(0,CGRectGetHeight(contentRect)*0.6, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect)*0.4);
            break;
        case YeeButtonImageBottom:
            return CGRectMake(0,0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect)*0.4);
            break;
        default:
            break;
    }
    return  CGRectMake(CGRectGetWidth(contentRect)*0.4, 0, CGRectGetWidth(contentRect)*0.6, CGRectGetHeight(contentRect));
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    switch (_buttonType) {
        case YeeButtonImageLeft:
            return CGRectMake(0, 0, CGRectGetWidth(contentRect)*0.4, CGRectGetHeight(contentRect));
            break;
        case YeeButtonImageRight:
            return CGRectMake(CGRectGetWidth(contentRect)*0.6, 0, CGRectGetWidth(contentRect)*0.4, CGRectGetHeight(contentRect));
            break;
        case YeeButtonImageTop:
            return CGRectMake(0,0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect)*0.6);
            break;
        case YeeButtonImageBottom:
            return CGRectMake(0,CGRectGetHeight(contentRect)*0.4,CGRectGetWidth(contentRect), CGRectGetHeight(contentRect)*0.6);
            break;
        default:
            break;
    }
    
    return CGRectMake(0, 0, CGRectGetWidth(contentRect)*0.4, CGRectGetHeight(contentRect));
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame= [self imageRectForContentRect:self.frame];
    _titleLable.frame=[self titleRectForContentRect:self.frame];
    [self configureButtonState];
}
#pragma mark lazy method
-(UILabel *)titleLable
{
    if (_titleLable==nil)
    {
        _titleLable=[[UILabel alloc] init];
        _titleLable.font=[UIFont systemFontOfSize:17];
    }
    return _titleLable;
}
-(UIImageView*)imageView
{
    if (_imageView==nil)
    {
        _imageView =[[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
