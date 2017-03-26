//
//  ViewController.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "ViewController.h"
#import "YeeButton.h"
#import "UIView+YeeViewAnimation.h"
#import "YeePopCover.h"
#import "UIView+snapView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton  *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn  setFrame:CGRectMake(70,-40, 120, 300)];
    [btn setBackgroundColor:[UIColor blackColor]];
    [self .view addSubview:btn];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)click:(UIButton *)sender
{
      UIView *snapView=[self.view snapshotInView:sender];
      snapView.frame=sender.frame;
      [[UIApplication sharedApplication].keyWindow addSubview:snapView];
     [[YeePopCover shareManger] setBackgroundColor:[UIColor clearColor]];
     [[YeePopCover shareManger] PopMaskView:snapView InView:nil transformanimation:^{
        
        [UIView animateWithDuration:0.1 animations:^{
            
            snapView.transform=CGAffineTransformScale(snapView.transform, 1.05, 1.05);
            
        } completion:^(BOOL finished)
         {
             snapView.transform=CGAffineTransformScale(snapView.transform, 1/1.05, 1/1.05);
             
             [UIView animateWithDuration:0.5 animations:^{
                 snapView.center=[UIApplication sharedApplication].keyWindow.center;
                 
             }];
         }];
    } ClickBlock:^(UIView *maskView){
       
       
        [UIView animateWithDuration:0.4 animations:^{
            
            maskView.center=sender.center;
            [[UIApplication sharedApplication].keyWindow addSubview:snapView];
            
        } completion:^(BOOL finished) {
            
            [maskView removeFromSuperview];
            
        }];
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
