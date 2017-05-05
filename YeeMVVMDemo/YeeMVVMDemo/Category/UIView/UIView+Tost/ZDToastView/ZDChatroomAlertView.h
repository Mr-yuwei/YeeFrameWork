//
//  ZDChatroomAlertView.h
//  Zhidao
//
//  Created by zhuchao on 13-10-9.
//  Copyright (c) 2013年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDChatroomAlertView : UIView
@property(nonatomic,assign) CGFloat rectangleWidth;
@property(nonatomic,assign) CGFloat rectangleHeight;
@property(nonatomic,assign) CGFloat blackAlpha;
@property(nonatomic,assign) CGFloat cornerRadio;

//调整位置
@property(nonatomic,assign) CGPoint  offSet;//透明矩形的便宜量
@property(nonatomic,assign) CGPoint  customImageOffSet;//自定义图片的便宜量
@property(nonatomic,assign) CGPoint  label1OffSet;//自定义图片的便宜量
@property(nonatomic,assign) CGFloat  label1LeftAndRightMarign;//自定义图片的便宜量


@property(nonatomic,strong) UIImageView *customImageView;
@property(nonatomic,strong) UILabel *label1;
@property(nonatomic,strong) UILabel *label2;
@property(nonatomic,strong) UIView *customView;
@property(nonatomic,assign) CGPoint customViewOffSet;
@property(nonatomic,strong) UITextField *textField;
- (void)showInView:(UIView *)aView;
- (void)hideView;

@end
