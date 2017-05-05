//
//  UITextField+LeftSpaceView.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/2/10.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

//为UITextField添加左边距
@interface UITextField (LeftSpaceView)
@property(nonatomic,retain)UIView    *leftSpaceView;
@property(nonatomic,assign)CGFloat   leftSpace;

-(void) setLeftViw:(UIView *)spaceLView space:(CGFloat)space;

@end
