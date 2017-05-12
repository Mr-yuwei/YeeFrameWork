//
//  AppDelegate+Configure.m
//  HappyRent
//
//  Created by CoderYee on 2017/5/2.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "AppDelegate+ConfigureApp.h"
#import "AFNetworkReachabilityManager.h"
@implementation AppDelegate (ConfigureApp)

#pragma mark  配置App中的控件的默认属性
- (void)configAppearance{
    
    //移除导航栏黑线
    [[UINavigationBar appearance]  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor grayColor]];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:[UIColor blackColor],
                                                           NSShadowAttributeName:shadow,
                                                           NSFontAttributeName:[UIFont systemFontOfSize:18]
                                                           }];
}
- (void)configureIQKeyboard{
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].shouldShowTextFieldPlaceholder=NO;
    
}
#pragma mark 检测网络变化
-(void)configureNetWork{
    
    AFNetworkReachabilityManager  *manager=[AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status==AFNetworkReachabilityStatusNotReachable||status==AFNetworkReachabilityStatusUnknown) {
            
            UIAlertView  *alertView=[[UIAlertView alloc] initWithTitle:@"网络连接出了点问题" message:@"请到'设置'里面里面找到'蜂窝移动网络',检查是否开启网络或者允许咔擦猫可以访问网络" delegate:nil cancelButtonTitle:@"去设置" otherButtonTitles:@"我知道了", nil];
            [alertView show];
            [alertView setCallBack:^(UIAlertView *alert, NSUInteger indexRow) {
                
                if (indexRow!=0)return ;

                NSURL*url=[NSURL URLWithString:@"Prefs:root=MOBILE_DATA_SETTINGS_ID"];
                Class LSApplicationWorkspace =NSClassFromString(@"LSApplicationWorkspace");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                
                //这里是会报警告的代码
                [[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)] performSelector:@selector(openSensitiveURL:withOptions:) withObject:url withObject:nil];
                
#pragma clang diagnostic pop
            }];
            
        }
    }];
    [manager startMonitoring];
}
@end
