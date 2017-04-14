//
//  NetWorkRequest.h
//  MyBus
//
//  Created by yytmzys on 15/3/16.
//  Copyright (c) 2015年 Beijing Fengyangtianshun Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  YWNetWorkRequest 网络请求数据
 */
typedef void(^NetWorkrequestBlock)(NSDictionary*dic,NSError*error);
@interface NetWorkRequest : NSObject
+(void)netWorkPOSTWithURLString:(NSString *)urlString parameters:(NSDictionary*)parameters  SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;

@end
