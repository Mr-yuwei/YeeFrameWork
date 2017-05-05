//
//  ZDTostView.m
//  Zhidao
//
//  Created by zhuchao on 13-10-21.
//  Copyright (c) 2013年 Baidu. All rights reserved.
//

#import "ZDTostView.h"

@interface ZDTostView()
- (ZDTostView *)showInView:(UIView *)aView;
@end


@implementation ZDTostView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.customImageOffSet = CGPointMake(0.0f, 9.0f);
        self.label2.hidden = YES;
        [self.label1 setFont:[UIFont systemFontOfSize:13.0f]];
    }
    return self;
}

- (void)setMessage:(NSString *)aMessage
{
    [self.label1 setText:aMessage];
    [self.label2 setHidden:YES];
}

- (void)setCustomImage:(UIImage *)image
{
    [self.customView removeFromSuperview];
    self.customView = nil;
    
    [self.customImageView setHidden:NO];
    [self.customImageView setImage:image];
}

+ (ZDTostView *)sharedTostView {
    static ZDTostView *_sharedTostView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedTostView = [[ZDTostView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return _sharedTostView;
}

+ (ZDTostView *)errorMessageView:(NSString *)aMessage
{
    ZDTostView *tost = [ZDTostView sharedTostView];
    [tost setCustomImage:[UIImage imageNamed:@"tost_warning.png"]];
    [tost.label1 setText:aMessage];
    return tost;
}

+ (ZDTostView *)showErrorMessage:(NSString *)aMessage inView:(UIView *)aView
{
    return [[self errorMessageView:aMessage] showSharedTostInViewAutoDisappear:aView];
}

+ (ZDTostView *)succeedMessageView:(NSString *)aMessage
{
    ZDTostView *tost = [ZDTostView sharedTostView];
    [tost setCustomImage:[UIImage imageNamed:@"tost_succeed.png"]];
    [tost.label1 setText:aMessage];
    return tost;
}

+ (ZDTostView *)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView finish:(void (^)(void))finish
{
    return [[self succeedMessageView:aMessage] showSharedTostInViewAutoDisappear:aView finish:finish];
}

+ (ZDTostView *)showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView
{
    return [self showSucceedMessage:aMessage inView:aView finish:nil];
}

+ (ZDTostView *)netErrorView:(NSString *)aMessage
{
    ZDTostView *tost = [ZDTostView sharedTostView];
    [tost setCustomImage:[UIImage imageNamed:@"tost_netError.png"]];
    [tost.label1 setText:aMessage];
    return tost;
}

- (ZDTostView *)showInView:(UIView *)aView
{
    [super showInView:aView];
    return [ZDTostView sharedTostView];
}

+ (ZDTostView *)showNetErrorWithMessage:(NSString *)aMessage inView:(UIView *)aView
{
    return [[self netErrorView:aMessage] showSharedTostInViewAutoDisappear:aView];
}

- (ZDTostView *)showSharedTostInViewAutoDisappear:(UIView *)aView finish:(void (^)(void))finish
{
    return [ZDTostView showSharedTostInViewAutoDisappear:aView finish:finish];
}

+ (ZDTostView *)showSharedTostInViewAutoDisappear:(UIView *)aView finish:(void (^)(void))finish
{
    if ([ZDTostView sharedTostView].superview!=nil) {
        [[ZDTostView sharedTostView] hideView];
    }
    [[ZDTostView sharedTostView] showInView:aView];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [[ZDTostView sharedTostView] setCustomView:nil];
        [[ZDTostView sharedTostView] hideView];
//        if (!isNull(finish)) {
//            finish();
//        }
    });
    return [ZDTostView sharedTostView];
}

- (ZDTostView *)showSharedTostInViewAutoDisappear:(UIView *)aView
{
    return [self showSharedTostInViewAutoDisappear:aView finish:nil];
}

+ (ZDTostView *)showSharedTostInViewAutoDisappear:(UIView *)aView
{
    return [self showSharedTostInViewAutoDisappear:aView finish:nil];
}

+ (ZDTostView *)loadingView:(NSString *)aMessage
{
    ZDTostView *tost = [ZDTostView sharedTostView];
    UIActivityIndicatorView *customView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    tost.customViewOffSet = CGPointMake(0.0f, 40.0f);
    
    [customView startAnimating];
    [tost setCustomView:customView];
    [tost.label1 setText:aMessage];
    return tost;
}

+ (ZDTostView *)showLoadingMessage:(NSString *)aMessage inView:(UIView *)aView
{
    return [[self loadingView:aMessage] showInView:aView];
}

+ (void)removeLoadingTost
{
    ZDTostView *tost = [ZDTostView sharedTostView];
    if (tost.customView && [tost.customView isKindOfClass:[UIActivityIndicatorView class]] && [tost superview]) {
        [tost hideView];
    }
}

@end
