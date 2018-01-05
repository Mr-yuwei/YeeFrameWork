//
//  AppDelegate+Configure.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "AppDelegate+Configure.h"

@implementation AppDelegate (Configure)

- (void)configAppearance{
    
    //移除导航栏黑线
    [[UINavigationBar appearance]  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarTintColor:kNavBarThemeColor];

    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [[UINavigationBar appearance] setTintColor: kNavBarThemeColor];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:kWhiteColor,
                                                           NSShadowAttributeName:shadow,
                                                           NSFontAttributeName:[UIFont systemFontOfSize:18]
                                                           }];
}
-(void)registerRoute{
    
    
    
    [[JLRoutes globalRoutes] addRoute:@"/user/view/:userID" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters)
     {
         NSString *userID = parameters[@"userID"];
         NSLog(@"%@",userID);
        return YES;
    }];
    
    

    
    [[JLRoutes globalRoutes]routeURL:[NSURL URLWithString:@"/user/view/123444"]];
}
@end
