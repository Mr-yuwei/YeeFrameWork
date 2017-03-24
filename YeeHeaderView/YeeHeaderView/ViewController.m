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
    [btn  setFrame:CGRectMake(100, 120, 80, 80)];
    [btn setBackgroundColor:[UIColor blackColor]];
    [self .view addSubview:btn];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)click:(UIButton *)sender
{
    
//    - (nullable UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0);
    UIView  *maskView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [maskView setBackgroundColor:[UIColor redColor]];
    
     [[YeePopCover shareManger] PopMaskView:maskView InView:self.view animations:^{
        
        [maskView addBaseSpringAnimationType:YeeFromTopType Duration:0.8 completion:^(BOOL finished)
         {
             
         }];
    } ClickBlock:^{
      
        
        UIView *snapView=[self.view snapshotInView:sender];
        UIView *coverView=[self.view snapshotInView:self.view];
        snapView.frame=sender.frame;
        [coverView addSubview:snapView];
        [[UIApplication sharedApplication] .keyWindow addSubview:coverView];
        [UIView animateWithDuration:1.0 animations:^{
            
            snapView.center=self.view.center;
            snapView.alpha=1.0;
        }completion:^(BOOL finished) {
         
            [coverView removeFromSuperview];
            
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
