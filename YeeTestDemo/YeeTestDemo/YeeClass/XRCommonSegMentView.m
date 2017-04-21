//
//  XRCommonSegMentView.m
//  XClassRoom
//
//  Created by NeiQuan on 16/11/11.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "XRCommonSegMentView.h"

#define kMainScreenWidth    [UIScreen mainScreen].bounds.size.width

#define kMainScreenHeight   [UIScreen mainScreen].bounds.size.height


@interface XRCommonSegMentView ()
{
    
    NSMutableArray *_buttonArray;
    UIView          *_lineView;
    
}
@end
@implementation XRCommonSegMentView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        
        _buttonArray = [NSMutableArray array];
        for (int i = 0; i<titleArray.count;i++) {
            CGFloat buttonWidth = kMainScreenWidth/titleArray.count;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(buttonWidth*i, 0, buttonWidth, frame.size.height-3);
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            button.tag = i;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [_buttonArray addObject:button];
            if (i == 0) {
                button.selected = YES;
                _lineView = [[UIView alloc] initWithFrame:CGRectMake(button.frame.size.width/3/2, button.frame.size.height, button.frame.size.width/3*2, 2)];
                _lineView.backgroundColor = [UIColor redColor];
                [self addSubview:_lineView];
            }
        }
        
        for (int i = 0; i < _buttonArray.count -1; i++) {
            UIButton *button = _buttonArray[i];
            UIView *smallLineView = [UIView new];
            smallLineView.backgroundColor = [UIColor colorWithWhite:0.876 alpha:1.000];
            smallLineView.frame = CGRectMake(CGRectGetMaxX(button.frame)-0.5, (frame.size.height-20)/2, 1, 20);
            [self addSubview:smallLineView];
        }
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithWhite:0.876 alpha:1.000];
        lineView.frame = CGRectMake(0, frame.size.height-1, kMainScreenWidth, 1);
        [self addSubview:lineView];
        
    }
    return self;
}

- (void)buttonClick:(UIButton *)button
{
    for (UIButton *btn in _buttonArray) {
        btn.selected = NO;
    }
    button.selected = YES;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.frame = CGRectMake(CGRectGetMinX(button.frame) + button.frame.size.width /3/2, button.frame.size.height, button.frame.size.width/3*2, 2);
        
    }];
  
    if (self.delegate&&[self.delegate respondsToSelector:@selector(XRCommonSegMentView:ClickatIndex:)])
    {
        [self.delegate XRCommonSegMentView:self ClickatIndex:button.tag];
    }
    
}

- (void)setLineViewFrameWithClickIndex:(NSInteger)index
{
    for (UIButton *btn in _buttonArray)
    {
        btn.selected = NO;
    }
    UIButton *button = _buttonArray[index];
    button.selected = YES;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.frame = CGRectMake(CGRectGetMinX(button.frame) + button.frame.size.width /3/2, button.frame.size.height, button.frame.size.width/3*2, 2);
        
    }];
}


@end
