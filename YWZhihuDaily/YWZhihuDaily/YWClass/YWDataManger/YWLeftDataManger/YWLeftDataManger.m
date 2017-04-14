//
//  YWLeftDataManger.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/20.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWLeftDataManger.h"
#import "YWNetWorkRequest.h"
@implementation YWLeftDataManger

//主题日报列表查看
+(void)getNewslistdataSuccessBlock:(void(^)(NSDictionary*result))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    [YWNetWorkRequest GetWithURLString:@"http://news-at.zhihu.com/api/4/themes" parameters:nil SuccessBlock:^(NSDictionary *dic)
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
+(void)getThemelistdatathemeid:(NSString *)themeID SuccessBlock:(void(^)(NSDictionary*result))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    //@"http://news-at.zhihu.com/api/4/themes"
    [YWNetWorkRequest GetWithURLString:[NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/theme/%@",themeID] parameters:nil SuccessBlock:^(NSDictionary *dic)
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
