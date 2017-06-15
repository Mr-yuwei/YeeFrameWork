//
//  LoginView.m
//  YeeAsyncDisplayKitDemo
//
//  Created by Yee on 2017/6/13.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "LoginView.h"
@interface LoginView ()

@property(nonnull,retain)ASEditableTextNode  *phoneTextNode;//手机

@property(nonnull,retain)ASEditableTextNode  *pwdTextNode;//密码

@property(nonnull,retain)ASControlNode      *loginBtnNode;//登录按钮

@end
@implementation LoginView

-(instancetype)initWithViewBlock:(ASDisplayNodeViewBlock)viewBlock{
    
    if (self=[super initWithViewBlock:viewBlock]) {
        
    }
    return self;
}
#pragma mark 添加子视图
-(void)addOwnView{
  
    
    
}
@end
