//
//  RacServiceHelp.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/9.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RacServiceHelp : NSObject

/**
 RAC返回数据
 @param urlStr URL
 @param parameter 后台字段 NSDictionary
 @return 返回一个 RACSignal
 */
+(RACSignal*)postJSONWithUrl:(NSString *)urlStr
                  parameters:(NSDictionary*)parameter;

@end
