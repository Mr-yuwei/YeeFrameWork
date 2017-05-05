//
//  UIViewController+NavigationItem.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "UIViewController+NavigationItem.h"
@implementation UIViewController (NavigationItem)
@dynamic rightButton;
@dynamic leftButton;
#pragma mark 导航栏
//建议这个项目写在addNavbarView方法下面
- (void)configNavigationBarWithLeftButtonTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle{
    if (leftTitle) {
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        [leftBtn setTitle:leftTitle forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [leftBtn addTarget:self action:@selector(navigationBarLeftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
    if (rightTitle) {
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
        rightBtn.titleLabel.font =[UIFont systemFontOfSize:14];
        [rightBtn addTarget:self action:@selector(navigationBarRightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    }
}
- (void)configNavigationBarLeftTitle:(NSString *)leftTitle
{
    if (leftTitle) {
        UIButton *leftBtn = [[UIButton alloc] init];
        [leftBtn setTitle:leftTitle forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        CGSize titleSize = [leftTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:leftBtn.titleLabel.font.fontName size:leftBtn.titleLabel.font.pointSize]}];
        titleSize.height = 20;
        titleSize.width += 20;
        [leftBtn setFrame:CGRectMake(0, 0, titleSize.width, titleSize.height)];
        self.leftButton=leftBtn;
        [leftBtn addTarget:self action:@selector(navigationBarLeftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
    
}
- (void)configNavigationBarLeftImage:(NSString *)leftImageString
{
    if (leftImageString) {
        
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        [leftBtn setImage:[UIImage imageNamed:leftImageString] forState:UIControlStateNormal];
        self.leftButton=leftBtn;
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [leftBtn addTarget:self action:@selector(navigationBarLeftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 0)];//设置图片偏移量
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
}
- (void)configNavigationBarRightTitle:(NSString *)rightTitle
{
    if (rightTitle) {
        
        UIButton *rightBtn = [[UIButton alloc] init];
        [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
        rightBtn.titleLabel.font =[UIFont systemFontOfSize:14];
        CGSize titleSize = [rightTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:rightBtn.titleLabel.font.fontName size:rightBtn.titleLabel.font.pointSize]}];
        titleSize.height = 20;
        titleSize.width += 20;
        self.rightButton=rightBtn;
        [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rightBtn setFrame:CGRectMake(0, 0, titleSize.width, titleSize.height)];
        [rightBtn addTarget:self action:@selector(navigationBarRightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    }
}
- (void)configNavigationBarRightImage:(NSString *)rightImageString
{
    if (rightImageString) {
        
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        [rightBtn setImage:[UIImage imageNamed:rightImageString] forState:UIControlStateNormal];
        self.rightButton=rightBtn;
        rightBtn.titleLabel.font =[UIFont systemFontOfSize:14];
        [rightBtn addTarget:self action:@selector(navigationBarRightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    }
}
//left事件处理
- (void)navigationBarLeftButtonTapped:(UIButton *)sender
{
    
}
//right事件处理
- (void)navigationBarRightButtonTapped:(UIButton *)sender
{
    
    
}


@end
