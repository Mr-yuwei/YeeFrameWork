//
//  AppNetConfigure.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppNetConfigure : NSObject
//配置服务器 
+ (NSString*)GetWebServiceDomain;
//缓存的地址
+ (NSString*)GetWebServiceCachePath;
@end
