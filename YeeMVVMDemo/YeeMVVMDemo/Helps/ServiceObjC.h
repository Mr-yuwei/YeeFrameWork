//
//  Service.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/15.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  这里存放网络请求,返回的信号

#import <Foundation/Foundation.h>
@interface ServiceObjC : NSObject

+(RACSignal*)postRequestWithUrl:(NSString *)Url parameters:(NSDictionary *)parameters;

@end
