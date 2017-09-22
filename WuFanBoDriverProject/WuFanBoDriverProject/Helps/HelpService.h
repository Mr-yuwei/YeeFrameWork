//
//  HelpService.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//  网络请求

#import <Foundation/Foundation.h>

@interface HelpService : NSObject

+(void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary*)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;

+(void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary*)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;


@end
