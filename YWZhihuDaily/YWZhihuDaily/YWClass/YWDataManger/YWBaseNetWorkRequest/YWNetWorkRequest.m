//
//  YWNetWorkRequest.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWNetWorkRequest.h"
#import "YWcommonHeader.h"
#import "AFNetworking.h"
@implementation YWNetWorkRequest
+(void)POSTWithURLString:(NSString *)urlString parameters:(NSDictionary*)parameters  SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.f;
    NSMutableDictionary *mDic=[NSMutableDictionary dictionaryWithDictionary:parameters];
    [manager POST:urlString parameters:mDic progress:^(NSProgress * _Nonnull downloadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (successBlock)
        {
            successBlock(dictionary);
        }
     }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
         if (failBlock)
         {
            failBlock(error);
         }
         
     }];
}

+(void)GetWithURLString:(NSString *)urlString parameters:(NSDictionary*)parameters  SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.f;
    NSMutableDictionary *mDic=[NSMutableDictionary dictionaryWithDictionary:parameters];
    [manager GET:urlString parameters:mDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (successBlock)
        {
            successBlock(dictionary);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        if (failBlock)
        {
            failBlock(error);
        }
        
    }];
    
}
@end
