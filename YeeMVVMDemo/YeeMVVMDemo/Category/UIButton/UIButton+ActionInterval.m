//
//  UIButton+ActionInterval.m
//  YWBaseFrameWork
//
//  Created by 余伟 on 2017/2/5.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import "UIButton+ActionInterval.h"
#import <objc/runtime.h>
@interface UIButton ()
{
    
    
}
@property (nonatomic, assign) NSTimeInterval acceptEventTime;
@end


@implementation UIButton (ActionInterval)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";
- (NSTimeInterval)acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setCjr_acceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )cjr_acceptEventTime
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setCjr_acceptEventTime:(NSTimeInterval)acceptEventTime
{
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    //获取着两个方法
    Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    
    Method myMethod = class_getInstanceMethod(self, @selector(time_sendAction:to:forEvent:));
    SEL mySEL = @selector(time_sendAction:to:forEvent:);
    
    //添加方法进去
    BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    
    //如果方法已经存在了
    if (didAddMethod) {
        class_replaceMethod(self, mySEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, myMethod);
        
    }
    //----------------以上主要是实现两个方法的互换,load是gcd的只shareinstance，果断保证执行一次
    
}

- (void)time_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (NSDate.date.timeIntervalSince1970 - self.cjr_acceptEventTime < self.acceptEventInterval)
    {
        return;
    }
    
    if (self.acceptEventInterval > 0)
    {
        self.cjr_acceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self time_sendAction:action to:target forEvent:event];
}

@end
