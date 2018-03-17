//
//  ViewController.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    UIView   *m_pcontentView;
    UILabel  *m_pLable;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self Add_OwnView];
    
    [self  make_constains];
    
    [self  addShapeLayer];
}

-(void)Add_OwnView
{
    m_pcontentView=[[UIView alloc] init];
    [m_pcontentView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:m_pcontentView];
    m_pLable=[[UILabel alloc] init];
    m_pLable.text =@"学习学习学习学习学习学习学习学习学习学习学习学习学习学习";
    m_pLable.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:m_pLable];
}
-(void)make_constains
{
    [m_pcontentView setFrame:CGRectMake(100, 56, 60, 45)];
    [m_pLable setFrame:CGRectMake(59, 200, 69, 23)];
}
-(void)addShapeLayer{
    
    CAShapeLayer *m_pLayer=[CAShapeLayer layer];
    m_pLayer.opacity =0.8;
    m_pLayer.fillRule = kCAFillRuleEvenOdd;
    m_pLayer.fillColor = [UIColor colorWithWhite:0.8 alpha:0.8].CGColor;
    m_pLayer.frame = self.view.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.view.bounds];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(95, 54, 68, 48) cornerRadius:6]];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(59, 200, 69, 23) cornerRadius:0]];
    
    m_pLayer.path =path.CGPath;
    m_pLayer.fillColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:m_pLayer];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
