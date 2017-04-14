//
//  YWNetWorkRequest.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
//网络数据请求
@interface YWNetWorkRequest : NSObject
+(void)POSTWithURLString:(NSString *)urlString parameters:(NSDictionary*)parameters  SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;
+(void)GetWithURLString:(NSString *)urlString parameters:(NSDictionary*)parameters  SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;
@end
