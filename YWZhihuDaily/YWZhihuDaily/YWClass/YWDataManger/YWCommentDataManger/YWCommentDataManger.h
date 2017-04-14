//
//  YWCommentDataManger.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/22.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWCommentDataManger : NSObject
+(void)getCommenListdata:(NSString *)url parameters:(NSDictionary *)parameters SuccessBlock:(void(^)(NSDictionary*result))successBlock failBlock:(void(^)(NSError*error))failBlock;
@end
