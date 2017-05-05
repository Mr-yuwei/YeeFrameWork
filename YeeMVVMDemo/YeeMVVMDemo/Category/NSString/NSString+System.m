//
//  NSString+System.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/27.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSString+System.h"

@implementation NSString (System)

+ (BOOL)isLocationServiceOpen {
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        
        return NO;
    } else
        return YES;
}
@end
