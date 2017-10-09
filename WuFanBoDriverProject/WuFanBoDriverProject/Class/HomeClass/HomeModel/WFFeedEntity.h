//
//  WFFeedEntity.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/8.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFFeedEntity : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;
@end
