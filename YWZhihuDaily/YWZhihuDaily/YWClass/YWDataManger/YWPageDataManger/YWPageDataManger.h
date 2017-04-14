//
//  YWPageDataManger.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWPageDataManger : NSObject
/**
 *获取最新新闻
 */
+(void)getleastNewsdataSuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;
/**
 获取新闻详情
 */
+(void)getNewsDetaildatawithid:(NSString*)detailid SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;
/**
 获取过往的信息
 */
+(void)getNewsBeforeawithDataSting:(NSString*)datastring SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;

@end
