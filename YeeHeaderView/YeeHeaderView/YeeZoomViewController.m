//
//  YeeZoomViewController.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "YeeZoomViewController.h"
#import "UIImageView+ClickBlock.h"
#import "YeeZoomScrollView.h"
@interface YeeZoomViewController ()

@end

@implementation YeeZoomViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)showHeadPortrait:(UIImageView *)toImageView originUrl:(NSString *)originUrl{
    
    UIView *mainView = [[UIView alloc] init];
    mainView.backgroundColor = [UIColor blackColor];
    mainView.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:mainView];
    
    CGRect tempF = [toImageView.superview convertRect:toImageView.frame toView:[self getParsentView:toImageView]];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.frame = tempF;
    imageView.image = toImageView.image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [mainView addSubview:imageView];
    mainView.clipsToBounds = YES;
    [UIView animateWithDuration:.25 animations:^{
        
     imageView.frame = [UIScreen mainScreen].bounds;
        
    } completion:^(BOOL finished) {
         imageView.hidden=YES;
        
        YeeZoomScrollView *scrollView = [[YeeZoomScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds withImageUrlString:originUrl  placeImage:toImageView.image];
        [scrollView setBackgroundColor:[UIColor blackColor]];
        __weak typeof(YeeZoomScrollView*)weakscrollView=scrollView;
        scrollView.clickBlock=^(UIImageView  *clickImageView){
            [weakscrollView removeFromSuperview];
            mainView.backgroundColor = [UIColor clearColor];
            imageView.hidden=NO;
            [UIView animateWithDuration:.25 animations:^{
                
                imageView.frame = tempF;
                
            } completion:^(BOOL finished) {
              
                [mainView removeFromSuperview];
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }];

        };
        [mainView addSubview:scrollView];
    }];
}

#pragma mark get Controller.view
- (UIView *)getParsentView:(UIView *)view{
    
    if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]){
    }
    if ([[view nextResponder] isKindOfClass:[UIViewController class]] || view == nil) {
        return view;
    }
    return [self getParsentView:view.superview];
}

- (id)getParsentViewController:(UIView *)view{
    
    if ([[view nextResponder] isKindOfClass:[UIViewController class]] || view == nil) {
        return [view nextResponder];
    }
    
    return [self getParsentViewController:view.superview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
