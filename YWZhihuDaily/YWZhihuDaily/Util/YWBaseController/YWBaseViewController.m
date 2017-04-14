//
//  YWBaseViewController.m
//  YWBaseFrameWork
//
//  Created by NeiQuan on 16/6/8.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "YWBaseViewController.h"
#import "ZDTostView.h"
#import "YWcommonHeader.h"
#import "AFNetworkReachabilityManager.h"
@interface YWBaseViewController ()
{
    

    
}
@end

@implementation YWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNetWorkstatus];//添加网络状态监控
    [self.view setBackgroundColor:[ UIColor colorWithString:@"#f2f2f2"]];
    
}
-(void)makeNetWorkstatus{
    __weak typeof(self)weakSelf=self;
    [[AFNetworkReachabilityManager  sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [weakSelf   checkNetWorkStatus:status];
    } ];
    [[ AFNetworkReachabilityManager sharedManager] startMonitoring];
}
-(void)checkNetWorkStatus:(NSInteger)status{
    if (status==-1||status==0) {
        UIAlertView *alert=[[ UIAlertView alloc] initWithTitle:@"公告" message:@"好像没有网了,请查看是否开启了网络" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}
#pragma mark 提示信息
- (void )showErrorMessage:(NSString *)aMessage inView:(UIView *)aView{
    [ZDTostView showErrorMessage:aMessage inView:aView ];
}
- (void )showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView{
    [ ZDTostView showSucceedMessage:aMessage inView:aView];
}
-(void)showNetErrorWithMessage:(NSString *)aMessage inView:(UIView *)aView{
    [ZDTostView showNetErrorWithMessage:aMessage inView:aView];
}
- (void)showLoadingMessage:(NSString *)aMessage inView:(UIView *)aView{
    [ ZDTostView showLoadingMessage:aMessage inView:aView];
}
-(void )showSucceedMessage:(NSString *)aMessage inView:(UIView *)aView finish:(void (^)(void))finish {
    [ ZDTostView  showSucceedMessage:aMessage inView:aView finish:^{
        finish();
    }];
}
- (void)removeLoadingTost{
    
    [ ZDTostView removeLoadingTost];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
