//
//  NetWorkRequest.m
//  MyBus
//
//  Created by yytmzys on 15/3/16.
//  Copyright (c) 2015年 Beijing Fengyangtianshun Technology Co., Ltd. All rights reserved.
//

#import "NetWorkRequest.h"
#import "AFNetworking.h"
#import "YWcommonHeader.h"
@implementation NetWorkRequest
+(void)netWorkPOSTWithURLString:(NSString *)urlString parameters:(NSDictionary*)parameters  SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock;
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.f;
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
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
+(void)POSTWithUrl:(NSString *)url parameters:(NSString *)parameters SuccessBlock:(void(^)(NSDictionary*dic))successBlock{

    NSMutableURLRequest *mutableURLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    //将字符串转化为data
    NSData *dataParameters = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    //将data放入请求体中
    [mutableURLRequest setHTTPBody:dataParameters];
    //设置请求方法
    [mutableURLRequest setHTTPMethod:@"POST"];
    //同步连接 一次性返回所有数据 如果数据量大 会造成主线程阻塞 主线程UI线程 卡
    NSData *data = [NSURLConnection sendSynchronousRequest:mutableURLRequest returningResponse:nil error:nil];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    successBlock(dic);
}
//压缩图片
+ (NSData *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.8);
}
@end
