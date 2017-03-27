//
//  SinaViewController.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/26.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "SinaViewController.h"
#import "YeeZoomViewController.h"
#import "SinaHeaderView.h"
#import "UIImageView+ClickBlock.h"
@interface SinaViewController ()<UITableViewDelegate,UITableViewDataSource,SinaHeaderViewdelegate>
{
    UITableView      *_tableView;
}
@end

@implementation SinaViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addtableView];
    [self tableHeaderView];
}
#pragma mark --tableView
-(void)addtableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:_tableView];
}
-(void)tableHeaderView
{
    
    SinaHeaderView  *headerView=[[SinaHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*0.5)];
    headerView.delegate=self;
    _tableView.tableHeaderView=headerView;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text=@"Mr_yuwei";
    return cell;
}
-(void)clickTouchView:(UIView *)touchView inView:(UIView *)inView{
    
   
//    YeeZoomViewController  *zoomVC=[[YeeZoomViewController alloc] init];
//    [zoomVC  showHeadPortrait:(UIImageView *)touchView originUrl:@""];
//    [self presentViewController:zoomVC animated:YES completion:^{
//        
//    }];
    
    [self  showHeadPortrait:(UIImageView *)touchView originUrl:@""];
    
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
        
    }];
    
    imageView.clickBlock=^(UIImageView *weakImageView){
        
        mainView.backgroundColor = [UIColor clearColor];
        weakImageView.hidden = NO;
        [UIView animateWithDuration:.25 animations:^{
            
            weakImageView.frame = tempF;
            
        } completion:^(BOOL finished) {
            
            [mainView removeFromSuperview];
        }];
    } ;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
