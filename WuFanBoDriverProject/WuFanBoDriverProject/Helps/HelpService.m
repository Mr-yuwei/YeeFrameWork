//
//  HelpService.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "HelpService.h"
#import <AFNetworking/AFNetworking.h>
/*
 -->这里只做简单的数据请求封装
 -->这里不做任何与缓存相关的东西
 
 */
@implementation HelpService
#pragma  post 获取数据
+(void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary*)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock{
    
    AFHTTPSessionManager  *sessionManagerage=[AFHTTPSessionManager manager];
    sessionManagerage.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManagerage.requestSerializer.timeoutInterval=netWorkTimeOut; //设置请求超时时间
   [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [sessionManagerage POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (successBlock)
        {
            successBlock(JSON);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (failBlock) {
            failBlock(error);
        }
    }];
}
#pragma mark get 获取数据
+(void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary*)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock{
      [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPSessionManager  *sessionManagerage=[AFHTTPSessionManager manager];
    sessionManagerage.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManagerage.requestSerializer.timeoutInterval=netWorkTimeOut; //设置请求超时时间
    [sessionManagerage GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (successBlock)
        {
            successBlock(JSON);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (failBlock) {
            failBlock(error);
        }
    }];
}

@end
