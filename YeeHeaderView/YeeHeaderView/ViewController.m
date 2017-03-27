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
#import "YeeZoomViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIButton  *btn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [btn  setFrame:CGRectMake(70,-40, 120, 300)];
//    [btn setBackgroundColor:[UIColor blackColor]];
//    [self .view addSubview:btn];
//    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView  *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width*0.5)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"] placeholderImage:[UIImage  imageNamed:@"1"]];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:tap];
    
    [self.view addSubview:imageView];

}
-(void)click:(UIGestureRecognizer  *)sender
{
//      UIView *snapView=[self.view snapshotInView:sender.view];
//      snapView.frame=sender.view.frame;
//      [[UIApplication sharedApplication].keyWindow addSubview:snapView];
//     [[YeePopCover shareManger] setBackgroundColor:[UIColor blackColor]];
//     [[YeePopCover shareManger] PopMaskView:snapView InView:nil transformanimation:^{
//        
//        [UIView animateWithDuration:0.1 animations:^{
//            
//            snapView.transform=CGAffineTransformScale(snapView.transform, 1.05, 1.05);
//            
//        } completion:^(BOOL finished)
//         {
//             snapView.transform=CGAffineTransformScale(snapView.transform, 1/1.05, 1/1.05);
//             
//             [UIView animateWithDuration:0.5 animations:^{
//                 snapView.center=[UIApplication sharedApplication].keyWindow.center;
//                 
//             }];
//         }];
//    } ClickBlock:^(UIView *maskView){
//        [[YeePopCover shareManger] setBackgroundColor:[UIColor clearColor]];
//        [UIView animateWithDuration:0.4 animations:^{
//            
//            maskView.center=sender.view.center;
//            [[UIApplication sharedApplication].keyWindow addSubview:snapView];
//            
//        } completion:^(BOOL finished) {
//            
//            [maskView removeFromSuperview];
//            
//        }];
//        
//    }];
    
    
    YeeZoomViewController  *zoomVC=[[YeeZoomViewController alloc] init];
    
    [zoomVC  showHeadPortrait:(UIImageView *)sender.view originUrl:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    [self presentViewController:zoomVC animated:YES completion:^{
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
