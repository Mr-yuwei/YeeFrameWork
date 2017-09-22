//
//  UINoNetWorkView.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UINoNetWorkView.h"
#define ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define reloadButtonWidth 180
@interface UINoNetWorkView ()
{

    UIImageView  *m_pImageView;
    
    UILabel     *m_pDescribeLable;//describe title
    
    UIButton    *m_pReloadButton; //reload Data button

}

@end
@implementation UINoNetWorkView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]];
        [self addOwnView];
    }
    return self;
}
-(void)addOwnView{
    
    UIImage *iconImage=[UIImage imageNamed:@"network_xinhao_"];
    m_pImageView=[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.5-iconImage.size.width*0.5, self.frame.size.height*0.5-iconImage.size.height*0.5-64, iconImage.size.width, iconImage.size.height)];
    m_pImageView.image = iconImage;
    [self addSubview:m_pImageView];
    m_pDescribeLable = [[UILabel alloc] initWithFrame:CGRectMake(10, m_pImageView.center.y+iconImage.size.height*0.5+10, self.frame.size.width-20, 25)];
    m_pDescribeLable.font = [UIFont systemFontOfSize:14];
    m_pDescribeLable.textAlignment = NSTextAlignmentCenter;
    m_pDescribeLable.text = @"好像没有网络了,请确保你的手机已经联网!";
    m_pDescribeLable.textColor = ColorFromRGB(0x999999);
    [self addSubview:m_pDescribeLable];
    m_pReloadButton= [[UIButton alloc] initWithFrame:CGRectMake( (self.frame.size.width-reloadButtonWidth)*0.5, m_pDescribeLable.frame.origin.y + 45 * 0.5+70, reloadButtonWidth, 45)];
    [m_pReloadButton setBackgroundColor: kNavBarThemeColor];
    m_pReloadButton.layer.shadowOffset =  CGSizeMake(2.5, 2.5);
    m_pReloadButton.layer.shadowOpacity = 0.8;
    m_pReloadButton.layer.shadowColor =  kNavBarThemeColor.CGColor;
    m_pReloadButton.layer.cornerRadius=2.0f;
    m_pReloadButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [m_pReloadButton setTitleColor: [UIColor whiteColor]  forState:UIControlStateNormal];
    [m_pReloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
    __weak typeof(self)weakself=self;
    [m_pReloadButton addTarget:weakself action:@selector(clickReloadButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:m_pReloadButton];
}
#pragma mark  click reloadbutton  action
-(void)clickReloadButton:(UIButton *)sender{
    
        __weak typeof(self)weakself=self;
    if (self.delegate &&[self.delegate respondsToSelector:@selector(clickReloadButton:InView:)]) {
       
        [self.delegate clickReloadButton:sender InView:weakself];
        
    }
    
}

@end
