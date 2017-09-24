//
//  MineHeaderView.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/24.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "MineHeaderView.h"
@interface MineHeaderView ()
{
    UIImageView *m_pIconImageView;//头像
    UILabel *m_pNameLable;//用户名称
}
@end
@implementation MineHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        [self addOwnView];
    }
    return self;
}
-(void)addOwnView{
    
    UIView *backView=[[UIView alloc] init];
    [backView setBackgroundColor:kNavBarThemeColor];
    [self addSubview:backView];
    m_pIconImageView=[[UIImageView alloc] init];
    m_pIconImageView.layer.borderWidth=0.3f;
    m_pIconImageView.layer.masksToBounds=YES;
    m_pIconImageView.layer.cornerRadius=35.0f;
    m_pIconImageView.layer.borderColor=kWhiteColor.CGColor;
    [m_pIconImageView  setImage:[UIImage imageWithColor:kGrayColor]];
    [self addSubview:m_pIconImageView];
    
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(800);
    }];
    
    [m_pIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.width.mas_equalTo(70);
        make.top.equalTo(self).with.offset(50);
    }];
}
@end
