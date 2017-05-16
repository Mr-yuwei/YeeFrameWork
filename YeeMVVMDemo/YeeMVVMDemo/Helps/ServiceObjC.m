//
//  Service.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/15.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "ServiceObjC.h"
#import "AFNetworking.h"
#import "ReactiveObjC.h"
@implementation ServiceObjC

+(RACSignal*)postRequestWithUrl:(NSString *)Url parameters:(NSDictionary *)parameters{

    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
       [ServiceObjC postWithUrlString:Url parameters:parameters SuccessBlock:^(NSDictionary *dic) {
         
            
        } failBlock:^(NSError *error) {
           
            
        }];
        return [RACDisposable disposableWithBlock:^{

        }];
    }] ;
}
#pragma mark --post请求数据接口
+ (void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary*)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock{
    
    
    
    
}
@end
