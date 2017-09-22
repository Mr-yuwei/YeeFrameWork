//
//  HelpCacheManger.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelpCacheManger : NSObject
singleton_interface(HelpCacheManger)

- (BOOL)containsObjectForKey:(NSString *)key;

- ( id<NSCoding>)objectForKey:(NSString *)key;

- (void)setObject:( id<NSCoding>)object forKey:(NSString *)key;

@end
