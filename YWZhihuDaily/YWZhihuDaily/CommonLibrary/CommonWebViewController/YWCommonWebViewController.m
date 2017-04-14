//
//  YWCommonWebViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWCommonWebViewController.h"
#import "YWcommonHeader.h"

@interface YWCommonWebViewController ()<UIWebViewDelegate>
{
        UIWebView   *_webView;
}
@end

@implementation YWCommonWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)init
{
    if (self=[super init])
    {
        [self makeWebview];
    }
    return self;
}
-(void)makeWebview
{
    _webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate=self;
    [_webView  sizeThatFits:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    [_webView.scrollView setBackgroundColor:[ UIColor whiteColor]];
    _webView.opaque=NO;
    [self.view addSubview:_webView];
}
- (void)loadYWWebViewRequest:(NSURLRequest *)request
{
    [_webView loadRequest:request];
}
- (void)loadYWWebViewHTMLString: (NSString *)string baseURL:(NSURL *)baseURL
{
     [_webView loadHTMLString:string baseURL:baseURL];
}
- (void)loadYWWebViewData:( NSData *)data MIMEType:( NSString*)MIMEType textEncodingName:( NSString *)textEncodingName baseURL:( NSURL *)baseURL
{
    [_webView loadData:data MIMEType:MIMEType textEncodingName:textEncodingName baseURL:baseURL];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
