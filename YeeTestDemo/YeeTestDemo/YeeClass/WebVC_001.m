//
//  WebVC_001.m
//  YeeTestDemo
//
//  Created by Yee on 2017/6/18.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "WebVC_001.h"
#include <objc/runtime.h>
@interface WebVC_001 ()<UIWebViewDelegate>
{
    
    UIWebView  *_webView;
    
}
@end

@implementation WebVC_001

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addOwnView];
    // Do any additional setup after loading the view.
}
-(void)addOwnView{
    
    
    
    unsigned int count = 0;
    objc_property_t *property = class_copyPropertyList([UIWebView class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t var = property[i];
        const char *name = property_getName(var);
        //const char *type = ivar_getTypeEncoding(var);
        NSLog(@"%s =============== ",name);
    }
    
    
    
    
    
    _webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate=self;
    _webView.opaque=NO;
    [_webView loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/p/0c255336f84b"]]];
    [self.view addSubview:_webView];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
 
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
