//
//  YWCommonWebViewController.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWBaseViewController.h"

@interface YWCommonWebViewController : YWBaseViewController
- (void)loadYWWebViewRequest:(NSURLRequest *)request;
- (void)loadYWWebViewHTMLString: (NSString *)string baseURL:(NSURL *)baseURL;
- (void)loadYWWebViewData:( NSData *)data MIMEType:( NSString*)MIMEType textEncodingName:( NSString *)textEncodingName baseURL:( NSURL *)baseURL;
@end
