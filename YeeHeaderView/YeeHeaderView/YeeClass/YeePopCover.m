//
//  YeePopCover.m
//  YeeShopProject
//
//  Created by CoderYee on 2017/3/19.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "YeePopCover.h"
@interface YeePopCover ()
@property(nonatomic,retain)UIColor  *backColor;//背景颜色
@property(nonatomic,retain)UIView   *maskView;//maskView
@property(nonatomic,copy)YeeCoverClick   clickBlock;//cover
@end
@implementation YeePopCover
//这里需要考虑到耦合度
static YeePopCover *_instance=nil;
+(YeePopCover *)shareManger
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[YeePopCover alloc] init];
    });
    return _instance;
}
//用户可以自定义动画
-(void)PopMaskView:(UIView *)maskView InView:(UIView *)InView  animations:(void (^)(void))animations  ClickBlock:(YeeCoverClick) clickBlock
{
    if (InView==nil)InView=[UIApplication sharedApplication].keyWindow;
    [YeePopCover shareManger].clickBlock=nil;
    [[YeePopCover shareManger] removeCover];
    [YeePopCover shareManger].frame=InView.bounds;
    maskView.center=[YeePopCover shareManger].center;
    [YeePopCover shareManger].maskView=maskView;
    if (animations)animations();
    [YeePopCover shareManger].clickBlock=clickBlock;;
    [[YeePopCover shareManger] addSubview:maskView];
    [InView addSubview:[YeePopCover shareManger]];
}
//初始化对象
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
       [self configureView];
    }
    return self;
}
//配置相关视图
-(void)configureView
{
    self.backColor=[UIColor colorWithWhite:0.0 alpha:0.5];
    [self setBackgroundColor:self.backColor];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if (!CGRectContainsPoint(self.maskView.frame, touchPoint))//判断点击的区域
    {
         [self clickCoverEvent];
    }
}
-(void)clickCoverEvent
{
    if ([YeePopCover shareManger].clickBlock)
    {
       [YeePopCover shareManger].clickBlock();
    }
    [[YeePopCover shareManger] removeFromSuperview];
    for (UIView *view in [YeePopCover shareManger].subviews)
    {   [view removeFromSuperview];
    }
}
//移除遮罩
-(void)removeCover
{
    [[YeePopCover shareManger] clickCoverEvent];
}
- (void)dealloc
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
}
@end
