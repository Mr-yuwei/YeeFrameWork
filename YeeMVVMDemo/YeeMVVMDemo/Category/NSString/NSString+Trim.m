//
//  NSString+Trim.m
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/22.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "NSString+Trim.h"

@implementation NSString (Trim)
- (NSString*)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (location=0; location < length; location++) {
        if (![characterSet characterIsMember:charBuffer[location]]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length;
    unichar charBuffer[[self length]];
    [self getCharacters:charBuffer];
    
    for (length = self.length; length > 0; length--) {
        if (![characterSet characterIsMember:charBuffer[length - 1]]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

- (NSString *)stringByTrimmingLeadingWhitespace {
    return [self stringByTrimmingLeadingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingTrailingWhitespace {
    return [self stringByTrimmingTrailingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingLeadingWhitespaceAndNewline {
    return [self stringByTrimmingLeadingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingTrailingWhitespaceAndNewline {
    return [self stringByTrimmingTrailingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingLineBreakAndWhitespaceSide {
    NSMutableString *mtString = [NSMutableString stringWithString:self];
    [mtString replaceOccurrencesOfString:@"\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mtString.length)];
    [mtString replaceOccurrencesOfString:@"\t" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mtString.length)];
    
    while ([mtString hasPrefix:@" "]) {
        [mtString replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    
    while ([mtString hasSuffix:@" "]) {
        [mtString replaceCharactersInRange:NSMakeRange(mtString.length - 1, 1) withString:@""];
    }
    return mtString;
}

@end
