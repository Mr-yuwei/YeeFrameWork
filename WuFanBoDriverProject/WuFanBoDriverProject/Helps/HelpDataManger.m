//
//  HelpDataManger.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "HelpDataManger.h"
#import "HelpService.h"
#import "HelpCacheManger.h"
/*
  需要处理用户登录失效的问题
  无网络重新加载配置
  网络变化监听
  需要根据后台数据做相应的修改
 
 */
@implementation HelpDataManger
#pragma mark 数据请求
+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
            SuccessBlock:(void(^)(NSDictionary*dic))successBlock
               failBlock:(void(^)(NSError*error))failBlock{
    [HelpService postWithUrlString:urlString parameters:parameters SuccessBlock:^(NSDictionary *dic)
    {
        if (successBlock) {
            
            successBlock(dic);
        }
    } failBlock:^(NSError *error)
     {
         if (failBlock) {
             
             failBlock(error);
         }
    }];
}
+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
       ModelSuccessBlock:(void(^)(BaseModel *ItemModel))ModelBlock
               failBlock:(void(^)(NSError*error))failBlock{
    [HelpDataManger postWithUrlString:urlString parameters:parameters SuccessBlock:^(NSDictionary *dic) {
      // 根据后台数据直接解析 返回Model
        
    } failBlock:^(NSError *error) {
        
    }];
}
+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
       ArraySuccessBlock:(void(^)(NSArray <BaseModel *>*listArray) )ModelBlock
               failBlock:(void(^)(NSError*error))failBlock
{
    [HelpDataManger postWithUrlString:urlString parameters:parameters SuccessBlock:^(NSDictionary *dic) {
        
    } failBlock:^(NSError *error) {
        
    }];
}
+(void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary*)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock{
    
    [HelpService getWithUrlString:urlString parameters:parameters SuccessBlock:^(NSDictionary *dic)
     {
        
    } failBlock:^(NSError *error)
    {
        
    }];
}
#pragma mark 列表界面数据请求 YYCache缓存
+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
              CacheBlock:(void(^)(NSDictionary*dic))cacheBlock
            SuccessBlock:(void(^)(NSDictionary*dic))successBlock
               failBlock:(void(^)(NSError*error))failBlock{
    
    if (cacheBlock) {
        //有缓存直接获取
        if ([[HelpCacheManger sharedHelpCacheManger] containsObjectForKey:urlString]) {
            cacheBlock((NSDictionary *)[[HelpCacheManger sharedHelpCacheManger] objectForKey:urlString]);
        }
    }
    [HelpDataManger postWithUrlString:urlString parameters:parameters SuccessBlock:^(NSDictionary *dic)
    {
        
        if ([dic[@"code"]integerValue]==0) {
            
        }else{
            
            
        }
        
    } failBlock:^(NSError *error) {
        
        // 直接提示用户错误信息
        
    }];
}
+(void)getWithUrlString:(NSString *)urlString
             parameters:(NSDictionary*)parameters
             CacheBlock:(void(^)(NSDictionary*dic))cacheBlock
           SuccessBlock:(void(^)(NSDictionary*dic))successBlock
              failBlock:(void(^)(NSError*error))failBlock{
    
    
}
@end
