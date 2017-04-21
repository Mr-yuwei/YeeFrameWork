//
//  AppDelegate+Launch.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "AppDelegate+Launch.h"
#import "YWcommonHeader.h"

@implementation AppDelegate (Launch)
-(void)lanuchapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    UIWindow       *window=[UIApplication sharedApplication].keyWindow;
    UIImageView    *backimageView=[[UIImageView alloc] init];
    backimageView.frame=window.bounds;
   [backimageView setImage:[UIImage imageNamed:@"LaunchImage-700"]];
    
    UIImageView *lanuchimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth,kScreenHeight-100)];
    
    UILabel *authorlable=[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight-100-21,kScreenWidth,21)];
    authorlable.textColor=kWhiteColor;
    authorlable.font=SystemFont(12);
    authorlable.textAlignment=NSTextAlignmentCenter;
    UIView *bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 100)];
    UIImageView *iconImageView=[[UIImageView alloc] init];//应用图标
    [iconImageView setFrame:CGRectMake(15, 25, 50, 50)];
    [iconImageView setImage:[UIImage imageNamed:@"AD_Icon_Border"]];
    [bottomView addSubview:iconImageView];
    
    
    UILabel *appleNamelable=[[UILabel alloc] initWithFrame:CGRectMake(75, 30, kScreenWidth-80, 21)];
    appleNamelable.text=@"知乎日报";
    appleNamelable.font=[UIFont systemFontOfSize:19];
    appleNamelable.textColor=kWhiteColor;
    
    UILabel *applesubNamelable=[[UILabel alloc] initWithFrame:CGRectMake(75, 30+25, kScreenWidth-80, 21)];
    applesubNamelable.text=@"每天三次,每次七分钟";
    applesubNamelable.font=[UIFont systemFontOfSize:14];
    applesubNamelable.textColor=kWhiteColor;
    [bottomView addSubview:applesubNamelable];
    [bottomView addSubview:appleNamelable];
 
    
    
   [UIView animateWithDuration:0.5 animations:^{
       bottomView.frame=CGRectMake(0, kScreenHeight-100, kScreenWidth, 100);
   } completion:^(BOOL finished)//还是有卡顿现象--->去死
    {
     [self getlanuchimageData:lanuchimage authorlable:authorlable backimageView:backimageView];
   }];
    [window addSubview:backimageView];
    [backimageView addSubview:lanuchimage];
    [backimageView addSubview:bottomView];
    [backimageView addSubview:authorlable];
    
}
#pragma mark --每次启动获取启动图数据
-(void)getlanuchimageData:(UIImageView *)lanuchImage authorlable:(UILabel*)lable backimageView:(UIImageView*)backImageView
{
    
    //
    
    //URL: http://news-at.zhihu.com/api/4/start-image/1080*1776
    //start-image 后为图像分辨率，接受任意的 number*number 格式， number 为任意非负整数，返回值均相同。
    [YWNetWorkRequest GetWithURLString:[NSString stringWithFormat:@"http://news-at.zhihu.com/api/7/prefetch-launch-images/%d*%d",(int)kScreenWidth,(int)kScreenHeight] parameters:nil SuccessBlock:^(NSDictionary *dic)
    {
        NSArray *array=dic[@"creatives"];
        NSDictionary  *dictionary=array[0];
        
        
       [lanuchImage sd_setImageWithURL:[NSURL URLWithString:dictionary[@"url"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:1.5 animations:^{
                    lanuchImage.alpha = 0.0;
                    lanuchImage.transform  = CGAffineTransformMakeScale(2, 2);
                } completion:^(BOOL finished)
                {
                    [backImageView removeFromSuperview];
                    
                }];
            });
       }];
    lable.text=[NSString stringWithFormat:@"知乎日报&&%@",dic[@"text"]];
    } failBlock:^(NSError *error)
    {
        
    }];
}
@end
