//
//  ZDChatroomAlertView.m
//  Zhidao
//
//  Created by zhuchao on 13-10-9.
//  Copyright (c) 2013年 Baidu. All rights reserved.
//

#import "ZDChatroomAlertView.h"


@interface ZDChatroomAlertView ()

+ (ZDChatroomAlertView *)sharedAlertView;

@end

@implementation ZDChatroomAlertView

+ (ZDChatroomAlertView *)sharedAlertView
{
    
    static ZDChatroomAlertView *_sharedAlertView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAlertView = [[ZDChatroomAlertView alloc] initWithFrame:CGRectZero];
    });
    
    return _sharedAlertView;
    
}

- (void)showInView:(UIView *)aView
{
    [self setFrame:aView.bounds];
    [aView addSubview:self];
    [self setNeedsLayout];
}

- (void)hideView
{
    @synchronized(self)
    {
        [self removeAlertView];
    }
}

- (void)removeAlertView
{
    [self removeFromSuperview];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        //self.contentMode=UIViewContentModeRedraw;
        
        self.contentMode = UIViewContentModeCenter;
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
								| UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _rectangleWidth = 145.0f;
        _rectangleHeight = 145.0f;
        _cornerRadio = 10.0f;
        _blackAlpha = 0.6f;
        self.offSet = CGPointMake(0.0f, 0.0f);
        _customImageView  = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_customImageView];
        
        _label1 = [[UILabel alloc] initWithFrame:CGRectZero];
        [_label1 setBackgroundColor:[UIColor clearColor]];
        [_label1 setTextAlignment:NSTextAlignmentCenter];
        [_label1 setLineBreakMode:NSLineBreakByWordWrapping];
        [_label1 setNumberOfLines:0];
        [_label1 setFont:[UIFont systemFontOfSize:15.0f]];
        [self addSubview:_label1];
        [_label1 setTextColor:[UIColor whiteColor]];
        [_label1 setText:@"xxxxxx"];
        
        _label2 = [[UILabel alloc] initWithFrame:CGRectZero];
        [_label2 setBackgroundColor:[UIColor clearColor]];
        [_label2 setTextAlignment:NSTextAlignmentCenter];
        [_label2 setFont:[UIFont systemFontOfSize:13.0f]];
        [self addSubview:_label2];
        [_label2 setTextColor:[UIColor whiteColor]];
        [_label2 setText:@"xxxxxx"];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        [self addSubview:_textField];
        
        
        _customImageOffSet = CGPointMake(0.0f, 0.0f);
        _label1OffSet = CGPointMake(0.0f, 0.0f);
        _label1LeftAndRightMarign = 15.0f;
    }
    return self;
}

- (void)setCustomView:(UIView *)customView
{
    [_customView removeFromSuperview];
    _customView = customView;
    [_customImageView setHidden:YES];
    [self addSubview:_customView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_customImageView sizeToFit];
    
    CGRect rectangleFrame = [self rectangleFrame];
    
    CGRect frame = CGRectMake(floor((self.bounds.size.width-_customImageView.bounds.size.width)/2.0), floor(rectangleFrame.origin.y + 21.0f), _customImageView.bounds.size.width, _customImageView.bounds.size.height);
    frame.origin.x += _customImageOffSet.x;
    frame.origin.y += _customImageOffSet.y;
    [_customImageView setFrame:frame];
    
    
    if (_customView) {
        CGRect customFrame = CGRectMake(floor((self.bounds.size.width-_customView.bounds.size.width)/2.0 + _customViewOffSet.x), floor(rectangleFrame.origin.y + _customViewOffSet.y), _customView.bounds.size.width, _customView.bounds.size.height);
        [_customView setFrame:customFrame];
    }
    
    CGRect lable1Frame = CGRectMake(rectangleFrame.origin.x + _label1LeftAndRightMarign, rectangleFrame.origin.y + (rectangleFrame.size.height - 50.0f), rectangleFrame.size.width - _label1LeftAndRightMarign*2, _label1.bounds.size.height);
    [_label1 setFrame:lable1Frame];
    [_label1 sizeToFit];
    //移到中间
    lable1Frame = _label1.frame;
    lable1Frame.origin.x = floor(rectangleFrame.origin.x +(rectangleFrame.size.width - _label1.frame.size.width)/2.0 + _label1OffSet.x);
    lable1Frame.origin.y = floor(lable1Frame.origin.y + _label1OffSet.y);
    [_label1 setFrame:lable1Frame];
    
    [_label2 setFrame:CGRectMake(floor(rectangleFrame.origin.x +10.0f), floor(rectangleFrame.origin.y + (rectangleFrame.size.height - 30.0f)), rectangleFrame.size.width - 20.0f, 23.0f)];

}


- (void)drawRect:(CGRect)rect
{
    //取中间的一块
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:[self rectangleFrame] cornerRadius:_cornerRadio];
    
    [[UIColor colorWithWhite:0 alpha:self.blackAlpha] setFill];
    
    [path fill];
}


- (CGRect)rectangleFrame
{
    CGRect frame = CGRectMake((self.bounds.size.width - _rectangleWidth)/2.0f, (self.bounds.size.height-_rectangleHeight)/2.0, _rectangleWidth, _rectangleHeight);
    frame.origin.x += _offSet.x;
    frame.origin.y += _offSet.y;
    return frame;
}


@end
