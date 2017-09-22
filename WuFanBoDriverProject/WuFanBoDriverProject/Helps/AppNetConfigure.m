//
//  AppNetConfigure.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "AppNetConfigure.h"
//#define DEBUG  0
@implementation AppNetConfigure
+ (NSString*)GetWebServiceDomain
{
#if DEBUG
    return @"http://csbwg.1bu2bu.com/index.php?s=/Api/";    //测试服务器
#endif
    return @"http://csbwg.1bu2bu.com/index.php?s=/Api/";     //正式服务器
}
+ (NSString*)GetWebServiceCachePath{
   
  return @"http://csbwg.1bu2bu.com/index.php?s=/Api/";     //正式服务器
}
@end
