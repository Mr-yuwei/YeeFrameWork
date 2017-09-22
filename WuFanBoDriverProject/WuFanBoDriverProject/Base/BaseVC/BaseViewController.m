//
//  BaseViewController.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    
    
}
@end

@implementation BaseViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
     self.view.backgroundColor = kBackgroundColor;
    [self addOwnViews];
    [self configContainer];
    [self configOwnViews];
    [self addNavbarView];
    [self bindViewModel];
    if (![self isNetReachable])
    {
        [self setNoNetWorkView];
    }
}
#pragma mark --configContainer
- (void)configContainer
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.navigationController.navigationBar.translucent = NO;//透明度
    self.tabBarController.tabBar.translucent = NO;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

#pragma mark --addOwnViews
- (void)addOwnViews
{ // 此处添加界面中的控件
}
#pragma mark --configOwnViews
- (void)configOwnViews
{// 此处配置界面中的控件的值
}

-(void)addNavbarView
{//添加导航栏设置
}
-(void)bindViewModel
{//RAC绑定事件

}
- (BOOL)isNetReachable{
    
    return [AFNetworkReachabilityManager managerForDomain:[AppNetConfigure GetWebServiceDomain]].isReachable;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return [self shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
//解决有水平方向滚动的ScrollView时边缘返回手势失效的问题
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}
#pragma mark   无网络重新请求数据
-(void)clickReloadButton:(UIButton *)sender InView:(UINoNetWorkView *)inView{
    
    //无论是无数据，还是无网络都会移除
    [self.view.placeHolderView removeFromSuperview];
    
}
//为每个VC封装一套数据请求，简化代码
-(void)requestDataWithUrlString:(NSString *)urlString
                     parameters:(NSDictionary*)parameters
                   SuccessBlock:(void(^)(NSDictionary*dic))successBlock{
    
    if (![self isNetReachable]) {
      //网络不可用-->重新加载问题
        [self setNoDataView];
        
       // [self.view .placeHolderView removeFromSuperview];
        
    }
    //数据请求
    [HelpDataManger postWithUrlString:urlString parameters:parameters SuccessBlock:^(NSDictionary *dic) {
        
        
    } failBlock:^(NSError *error)
    {
       //展示错误信息
        
    }];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
