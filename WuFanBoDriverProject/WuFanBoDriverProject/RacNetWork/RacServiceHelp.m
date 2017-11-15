//
//  RacServiceHelp.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "RacServiceHelp.h"

@implementation RacServiceHelp
+(RACSignal*)postJSONWithUrl:(NSString  *)urlStr
                  parameters:(NSDictionary *)parameter{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [RacServiceHelp post:urlStr parameters:parameter success:^(NSDictionary *dic) {
            //需要在这里捕获错误信息
            //后台需要
            [subscriber sendNext:dic];
            [subscriber sendCompleted];
        } netError:^(NSError *error) {
            [subscriber sendError:error];//发送错误信息
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}
+(AFHTTPSessionManager *)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *dic))success netError:(void(^)(NSError *error))netError{
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.requestSerializer.timeoutInterval = 10.0f;
    NSString  *str=[NSString stringWithFormat:@"%@%@",APIBaseUrl,url];
    NSString  *Url = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    manger.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript" , @"text/plain" , nil];
    
    NSMutableDictionary *mDic=[NSMutableDictionary dictionaryWithDictionary:parameters];
    [manger POST:Url parameters:mDic progress:^(NSProgress * _Nonnull uploadProgress){
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        
        //NSDictionary *dic = (NSDictionary *)responseObject;
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        
        if (netError) {
            netError(error);
        }
    }];
    return manger;
}
@end
