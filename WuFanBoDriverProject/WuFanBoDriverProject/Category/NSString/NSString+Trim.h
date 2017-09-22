//
//  NSString+Trim.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/3/22.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trim)
// 去除尾部space, /n, /t
- (NSString*)trim;
- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingLeadingWhitespace;
- (NSString *)stringByTrimmingTrailingWhitespace;
- (NSString *)stringByTrimmingLeadingWhitespaceAndNewline;
- (NSString *)stringByTrimmingTrailingWhitespaceAndNewline;
- (NSString *)stringByTrimmingLineBreakAndWhitespaceSide;
@end
