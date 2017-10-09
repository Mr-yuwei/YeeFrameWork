//
//  WFFeedEntity.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/8.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "WFFeedEntity.h"

@implementation WFFeedEntity
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}
@end
