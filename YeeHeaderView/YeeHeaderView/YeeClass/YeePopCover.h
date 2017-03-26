//
//  YeePopCover.h
//  YeeShopProject
//
//  Created by CoderYee on 2017/3/19.
//  Copyright © 2017年 CoderYee. All rights reserved.
//
//遮罩
//处理用户点击事件
#import <UIKit/UIKit.h>
typedef void(^YeeCoverClick)(UIView *maskView);

@interface YeePopCover : UIView

+(YeePopCover *)shareManger;
-(void)PopMaskView:(UIView *)maskView InView:(UIView *)InView  transformanimation:(void (^)(void))animations  ClickBlock:(YeeCoverClick) clickBlock;

-(void)PopMaskView:(UIView *)maskView InView:(UIView *)InView  animations:(void (^)(void))animations  ClickBlock:(YeeCoverClick) clickBlock;
//移除遮罩/视图
-(void)removeCover;

@end
