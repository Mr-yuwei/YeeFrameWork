//
//  UINoDataView.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UINoDataView.h"
#define ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface UINoDataView ()
{

    UIImageView  *m_pImageView;
    
    UILabel     *m_pDescribeLable;//describe title
    
}
@end

@implementation UINoDataView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]];
        
        [self addOwnView];
    }
    return self;
}
-(void)addOwnView{
    
    UIImage *iconImage=[UIImage imageNamed:@"no_data_katong_"];
    m_pImageView=[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.5-iconImage.size.width*0.5, self.frame.size.height*0.5-iconImage.size.height*0.5-64, iconImage.size.width, iconImage.size.height)];
    m_pImageView.image = iconImage;
    [self addSubview:m_pImageView];
    m_pDescribeLable = [[UILabel alloc] initWithFrame:CGRectMake(10, m_pImageView.center.y+iconImage.size.height*0.5+10, self.frame.size.width-20, 25)];
    m_pDescribeLable.font = [UIFont systemFontOfSize:14];
    m_pDescribeLable.textAlignment = NSTextAlignmentCenter;
    m_pDescribeLable.text = @"好像还没有数据啊!";
    m_pDescribeLable.textColor = ColorFromRGB(0x999999);
    [self addSubview:m_pDescribeLable];
   
}



@end
