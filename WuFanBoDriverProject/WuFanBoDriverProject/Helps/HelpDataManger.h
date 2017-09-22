//
//  HelpDataManger.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseModel;
@interface HelpDataManger : NSObject

//非列表界面数据请求
+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
            SuccessBlock:(void(^)(NSDictionary*dic))successBlock
               failBlock:(void(^)(NSError*error))failBlock;

+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
            ModelSuccessBlock:(void(^)(BaseModel *ItemModel))ModelBlock
               failBlock:(void(^)(NSError*error))failBlock;

+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
       ArraySuccessBlock:(void(^)(NSArray <BaseModel *>*listArray) )ModelBlock
               failBlock:(void(^)(NSError*error))failBlock;

+(void)getWithUrlString:(NSString *)urlString
             parameters:(NSDictionary*)parameters
           SuccessBlock:(void(^)(NSDictionary*dic))successBlock
              failBlock:(void(^)(NSError*error))failBlock;


//列表界面数据请求 YYCache缓存
+(void)postWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
             CacheBlock:(void(^)(NSDictionary*dic))cacheBlock
            SuccessBlock:(void(^)(NSDictionary*dic))successBlock
               failBlock:(void(^)(NSError*error))failBlock;


+(void)getWithUrlString:(NSString *)urlString
             parameters:(NSDictionary*)parameters
             CacheBlock:(void(^)(NSDictionary*dic))cacheBlock
           SuccessBlock:(void(^)(NSDictionary*dic))successBlock
              failBlock:(void(^)(NSError*error))failBlock;


@end
