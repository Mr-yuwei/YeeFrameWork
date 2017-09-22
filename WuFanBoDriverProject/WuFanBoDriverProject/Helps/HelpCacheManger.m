//
//  HelpCacheManger.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "HelpCacheManger.h"
#import <YYCache/YYCache.h>
#import "AppNetConfigure.h"
@interface HelpCacheManger ()
{
    YYCache  *m_pCache;
    
}
@end
@implementation HelpCacheManger
singleton_implementation(HelpCacheManger)
-(instancetype)init
{
    if(self=[super init])
    {
        [self configureYYCache];
    }
    return self;
}
#pragma mark 配置YYCache
-(void)configureYYCache
{
    m_pCache=[[YYCache alloc] initWithPath:[AppNetConfigure GetWebServiceCachePath]];

}
- (BOOL)containsObjectForKey:(NSString *)key{
    
    return [m_pCache containsObjectForKey:key];
}
- ( id<NSCoding>)objectForKey:(NSString *)key{
    
    return [m_pCache objectForKey:key];
}
- (void)setObject:( id<NSCoding>)object forKey:(NSString *)key{
    
      [m_pCache  setObject:object forKey:key];
}
@end
