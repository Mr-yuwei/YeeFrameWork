//
//  YWPageDataManger.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWPageDataManger.h"
#import "YWNetWorkRequest.h"
static  NSString *leastNews =@"http://news-at.zhihu.com/api/4/news/latest";//获取最新消息
static  NSString *NewsDetail =@"http://news-at.zhihu.com/api/4/news/";//消息详情
static  NSString *Newsbefore =@"http://news.at.zhihu.com/api/4/news/before/";//过往消息
// //http://news.at.zhihu.com/api/4/news/before/20131119
@implementation YWPageDataManger
+(void)getleastNewsdataSuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock
{
   [YWNetWorkRequest GetWithURLString:leastNews parameters:nil SuccessBlock:^(NSDictionary *dic)
    {
        if (successBlock)
        {
          successBlock(dic);
        }
    } failBlock:^(NSError *error)
    {
        if (failBlock)
        {
            failBlock(error);
        }
    }];
}
#pragma mark --新闻详情
+(void)getNewsDetaildatawithid:(NSString*)detailid SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    NSString *url=[NSString stringWithFormat:@"%@%@",NewsDetail,detailid];
    [YWNetWorkRequest GetWithURLString:url parameters:nil SuccessBlock:^(NSDictionary *dic)
     {
         if (successBlock)
         {
             successBlock(dic);
         }
     } failBlock:^(NSError *error)
     {
         if (failBlock)
         {
             failBlock(error);
         }
         
     }];
}
#pragma mark --获取
+(void)getNewsBeforeawithDataSting:(NSString*)datastring SuccessBlock:(void(^)(NSDictionary*dic))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    NSString *url=[NSString stringWithFormat:@"%@%@",Newsbefore,datastring];
    [YWNetWorkRequest GetWithURLString:url parameters:nil SuccessBlock:^(NSDictionary *dic)
     {
         if (successBlock)
         {
             successBlock(dic);
         }
     } failBlock:^(NSError *error)
     {
         if (failBlock)
         {
             failBlock(error);
         }
         
     }];

    
    
}

@end
