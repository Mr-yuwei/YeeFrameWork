//
//  ViewController.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "ViewController.h"
#import "YeeButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    YeeButton  *button1=[YeeButton buttonWithType:YeeButtonImageLeft];
//    [button1.imageView setImage:[UIImage imageNamed:@"icon_shezhi_weidianji"]];
//    button1.titleLable.text=@"设置";
//    [button1 setFrame:CGRectMake(0, 40, 100, 35)];
//    [self.view addSubview:button1];
//    
//    YeeButton  *button2=[YeeButton buttonWithType:YeeButtonImageRight];
//    [button2 .imageView setImage:[UIImage imageNamed:@"icon_shoucang_yidianji"]];
//    button2.titleLable.text=@"设置";
//    [button2 setFrame:CGRectMake(100, 80, 100, 35)];
//    [self.view addSubview:button2];
//    
//    
//    YeeButton  *button3=[YeeButton buttonWithType:YeeButtonImageTop];
//    [button3 .imageView setImage:[UIImage imageNamed:@"icon_shoucang_yidianji"]];
//    button3.titleLable.text=@"设置";
//    button3.titleLable.textAlignment=NSTextAlignmentCenter;
//    [button3 setFrame:CGRectMake(0, 120, 100, 60)];
//    [self.view addSubview:button3];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake(30, 60, 70, 70)];
    
    
    [btn setImage:[UIImage imageNamed:@"icon_shezhi_weidianji"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon_shoucang_yidianji"] forState:UIControlStateHighlighted];
    [btn setTitle:@"1234" forState:UIControlStateNormal];
    [btn setTitle:@"yuwei" forState:UIControlStateHighlighted];
    //btn.enabled=NO;
    [self.view addSubview:btn];
    
    
    
    YeeButton  *button4=[YeeButton buttonWithType:YeeButtonImageRight];
    //[button4.imageView setImage:[UIImage imageNamed:@"icon_shezhi_weidianji"]];
    //button4.titleLable.text=@"设置";
    [button4 setImage:[UIImage imageNamed:@"icon_shezhi_weidianji"] forState:UIControlStateNormal];
      [button4 setImage:[UIImage imageNamed:@"icon_shoucang_yidianji"] forState:UIControlStateHighlighted];
    [button4 setTitle:@"1234" forState:UIControlStateNormal];
    [button4 setTitle:@"yuwei" forState:UIControlStateHighlighted];
   // button4.enabled=NO;
    button4.titleLable.textAlignment=NSTextAlignmentCenter;
    [button4 setFrame:CGRectMake(0, 180, 100, 60)];
    [self.view addSubview:button4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
