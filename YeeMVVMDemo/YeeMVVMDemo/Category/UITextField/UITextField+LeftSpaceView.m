//
//  UITextField+LeftSpaceView.m
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/2/10.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import "UITextField+LeftSpaceView.h"
#import <objc/runtime.h>
@implementation UITextField (LeftSpaceView)
@dynamic leftSpaceView;
@dynamic leftSpace;

-(void)setLeftSpace:(CGFloat)leftSpace
{
    CGRect frame = [self frame];
    frame.size.width = leftSpace;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
    [self setNeedsLayout];
}
-(void)setLeftSpaceView:(UIView *)leftSpaceView
{
    //NSAssert ，断言，其实是一个宏，主要用于开发阶段调试程序，在真机中将会自动忽略。
    //通过为NSAssert()传递条件表达式来断定是否属于Bug，
    //满足条件返回真，程序继续运行。
    //如果返回假，则抛出异常，并且可以自定义异常描述。
    //断言其实是“防御式编程”的常用的手段。
    NSAssert(leftSpaceView.frame.size.width!=0, @"The leftSpaceView‘s width should not be 0");
    self.leftViewMode = UITextFieldViewModeAlways;//一直显示
    self.leftView = leftSpaceView;
    [self setNeedsLayout];
 }
-(void)setLeftViw:(UIView *)spaceLView space:(CGFloat)space{
    
    
    //NSAssert ，断言，其实是一个宏，主要用于开发阶段调试程序，在真机中将会自动忽略。
    //通过为NSAssert()传递条件表达式来断定是否属于Bug，
    //满足条件返回真，程序继续运行。
    //如果返回假，则抛出异常，并且可以自定义异常描述。
    //断言其实是“防御式编程”的常用的手段。
    NSAssert(spaceLView.frame.size.width!=0, @"The leftSpaceView‘s width should not be 0");
    self.leftViewMode = UITextFieldViewModeAlways;//一直显示
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(space, 0, spaceLView.width+space, spaceLView.height)];
    spaceLView.center=view.center;
    [view addSubview:spaceLView];
    [view setBackgroundColor:[UIColor clearColor]];
    self.leftView = view;
    [self setNeedsLayout];
}
@end
