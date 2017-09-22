//
//  UILodeTransitionView.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UILodeTransitionView.h"
@interface UILodeTransitionView ()
{
    
    UIActivityIndicatorView  *m_pactivityIndicatorView;
    
}

@end
@implementation UILodeTransitionView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]];
        [self addOwnView];
    }
    
    return self;
}
#pragma mark 添加子类视图
-(void)addOwnView{
 
    m_pactivityIndicatorView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [m_pactivityIndicatorView setFrame:CGRectMake(0, 0, 45, 45)];
    m_pactivityIndicatorView.center=self.center;
    [m_pactivityIndicatorView startAnimating];
    [self addSubview:m_pactivityIndicatorView];
    
    UILabel  *lable=[[UILabel alloc] init];
    lable.text=@"努力加载中...";
    lable.font=[UIFont systemFontOfSize:13];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.textColor=[UIColor grayColor];
    lable.numberOfLines=0;
    [lable setFrame:CGRectMake(0, m_pactivityIndicatorView.frame.origin.y+45, self.frame.size.width, 35)];
    [self  addSubview:lable];
    UITapGestureRecognizer  *tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickLodingView:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

-(void)ClickLodingView:(UITapGestureRecognizer *)ges{
    
    
}

@end
