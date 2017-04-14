//
//  YWCommentDataManger.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/22.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWCommentDataManger.h"
#import "YWNetWorkRequest.h"
@implementation YWCommentDataManger
#pragma mark --获取评论信息
+(void)getCommenListdata:(NSString *)url parameters:(NSDictionary *)parameters SuccessBlock:(void(^)(NSDictionary*result))successBlock failBlock:(void(^)(NSError*error))failBlock
{
    
    [YWNetWorkRequest GetWithURLString:url parameters:parameters SuccessBlock:^(NSDictionary *dic)
     {
         if (successBlock)
         {
            successBlock(dic);
         }
    }failBlock:^(NSError *error){
        if (failBlock)
        {
            failBlock(error);
        }
    }];
    
    
}
@end
