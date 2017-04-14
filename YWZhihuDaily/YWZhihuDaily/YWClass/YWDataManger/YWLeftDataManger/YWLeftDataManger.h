//
//  YWLeftDataManger.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/20.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWLeftDataManger : NSObject

//主题日报列表查看
+(void)getNewslistdataSuccessBlock:(void(^)(NSDictionary*result))successBlock failBlock:(void(^)(NSError*error))failBlock;
//主题日报内容查看
+(void)getThemelistdatathemeid:(NSString *)themeID SuccessBlock:(void(^)(NSDictionary*result))successBlock failBlock:(void(^)(NSError*error))failBlock;

@end
