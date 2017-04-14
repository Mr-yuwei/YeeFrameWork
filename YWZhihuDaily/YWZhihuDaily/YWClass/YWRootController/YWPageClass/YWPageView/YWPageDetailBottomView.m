//
//  YWPageDetailBottomView.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWPageDetailBottomView.h"
#import "YWcommonHeader.h"

@interface YWPageDetailBottomView()
{
   
    
}
@end
@implementation YWPageDetailBottomView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        [self makesubViews];
    }
    return self;
}
-(void)makesubViews
{
    __weak typeof(self)weakself=self;
    CGFloat with=(kScreenWidth-50)/5.0;
    CGFloat margin=8;
    NSArray *array=@[@"News_Navigation_Arrow_Highlight",@"Dark_News_Navigation_Unnext", @"News_Navigation_Vote",@"News_Navigation_Share",@"News_Navigation_Comment_Highlight"];
    for (NSInteger indeM=0; indeM<5; indeM++)
    {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag=1000+indeM;
        [button setFrame:CGRectMake((margin+with)*indeM, 5, with, 40)];
        [button addTarget:weakself action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:array[indeM]] forState:UIControlStateNormal];
        if (indeM==4)
        {
        [button setTitle:@"20" forState:UIControlStateNormal];
        [button setTitleColor:kWhiteColor forState:UIControlStateNormal];
        }
        [self addSubview:button];
    }
}
#pragma mark --按钮点击事件
-(void)buttonClick:(UIButton*)button
{
    if ([_delegete respondsToSelector:@selector(DetailBottomViewclickatIndex:)])
    {
        [_delegete DetailBottomViewclickatIndex:button.tag-1000];
    }
}
@end
