//
//  WFLoginView.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "WFLoginView.h"
#import "UINoNetWorkView.h"
#import "UINoDataView.h"
#import "UILodeTransitionView.h"
@interface WFLoginView ()<UINoNetWorkViewdelegate>
{
    UITextField  *m_pPhoneTextField;
    UITextField  *m_pPwdTextField;
    UIButton     *m_pLoginButton;//登录按钮
}
@end
@implementation WFLoginView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame])
    {
       [self addOwnView];
    }
    return self;
}
-(void)addOwnView{
    
    UIImageView  *m_pBackImageView=[[UIImageView alloc] initWithFrame:self.bounds];
    [m_pBackImageView setImage:kImage(@"Base map")];
    m_pBackImageView.contentMode=UIViewContentModeScaleToFill;
    m_pBackImageView.clipsToBounds=YES;
    [self addSubview:m_pBackImageView];
    
    UILodeTransitionView *noDataView=[[UILodeTransitionView  alloc] initWithFrame:self.bounds];
//    noDataView.delegate=self;
    [self addSubview:noDataView];

}
#pragma mark 点击重新加载视图
-(void)clickReloadButton:(UIButton *)sender InView:(UINoNetWorkView *)inView{
    

    [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"你点击了重新加载按钮" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"好的", nil] show];
    
    
}


@end
