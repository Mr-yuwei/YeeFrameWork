//
//  YWPageDetailViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWPageDetailViewController.h"
#import "YWcommonHeader.h"
#import "YWPageDataManger.h"
#import "YWPageModel.h"
#import "YWPageDetailBottomView.h"
#import "YWCommentViewController.h" //查看评论详情
@interface YWPageDetailViewController ()<UIWebViewDelegate,UIScrollViewDelegate,YWPageDetailBottomViewdelegate>
{
  
      UIView                               *_detailtopView;
      YWPageDetailBottomView               *_bottomView;
      UIWebView                            *_webView;
      YWPagedetailModel                    *_detailModel;
      UIImageView                          *_headerImageView;
      UILabel                              *_imagesoucelable;
      UILabel                              *_imagetitlelable;
}
@end

@implementation YWPageDetailViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeSubViews];
    [self getleastNewsData];//获取新闻详情
    
}
-(void)makeSubViews
{
    [self makeWebView];
    [self makeHeaderView];
    [self makeBottomview];
    
}
-(void)makeWebView
{
    _webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight+20-49)];
    _webView.scrollView.delegate=self;
    _webView.delegate=self;
    [self.view addSubview:_webView];
    
}
#pragma mark --头部伸缩效果
-(void)makeHeaderView
{
    
    UIView *headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    UIImageView *headerimageView=[[UIImageView alloc] initWithFrame:headerView.bounds];
    headerimageView.contentMode=UIViewContentModeScaleAspectFill;
    headerimageView.clipsToBounds=YES;
    [headerView addSubview:headerimageView];
    
    UILabel *imagesoucelable=[[UILabel alloc] init];
    [headerView addSubview:imagesoucelable];//图片来源
    imagesoucelable.text=@"图片来源:";
    imagesoucelable.font=SystemFont(9);
    imagesoucelable.textColor=[UIColor whiteColor];
    imagesoucelable.textAlignment=NSTextAlignmentRight;
    [imagesoucelable autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5.0];
    [imagesoucelable autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [imagesoucelable autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
    [imagesoucelable autoSetDimension:ALDimensionHeight toSize:21];
    
    UILabel *headerTitleLable=[[UILabel alloc] init];
    [headerView addSubview:headerTitleLable];//图片来源
    headerTitleLable.textColor=kWhiteColor;
    headerTitleLable.font=SystemFont(20);
    headerTitleLable.numberOfLines=0;
    [headerTitleLable autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15.0f];
    [headerTitleLable autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:15.0f];
    [headerTitleLable autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:imagesoucelable withOffset:5.0f];
    _headerImageView=headerimageView;
    _imagesoucelable=imagesoucelable;
    _imagetitlelable=headerTitleLable;
    _detailtopView=headerView;
   [_webView.scrollView addSubview:headerView];
}
-(void)makeBottomview
{
    _bottomView=[[YWPageDetailBottomView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    [_bottomView setBackgroundColor:kWhiteColor];
    _bottomView.delegete=self;
    [self.view addSubview:_bottomView];
}
#pragma mark --YWPageDetailBottomViewdelegate
-(void)DetailBottomViewclickatIndex:(NSInteger)index
{
    switch (index)
    {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        case 1:
           NSLog(@"下一篇文章");
            break;
        case 2://点赞
              NSLog(@"点赞");
            break;
        case 3://分享
            NSLog(@"分享");
            break;
        case 4://查看评论
        {
            YWCommentViewController  *comment=[[YWCommentViewController alloc] init];
            comment.messageID=_newsId;
            [self.navigationController pushViewController:comment animated:YES];
            
        }
            break;
        default:
            break;
    }
    
    
}
#pragma mark --不好做--->用户体验
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    if (y < 0)
    {
        
        
    }
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.absoluteString hasPrefix:@"http://zhuanlan.zhihu.com"])
    {
        YWCommonWebViewController *webVC=[[YWCommonWebViewController alloc] init];
        [webVC loadYWWebViewRequest:[NSURLRequest requestWithURL:request.URL]];
        [self.navigationController pushViewController:webVC animated:YES];
        return NO;
    }
    NSLog(@"%@",request.URL.absoluteString);
    return YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --获取最新数据
-(void)getleastNewsData
{
    //借鉴网上swift
    [YWPageDataManger getNewsDetaildatawithid:_newsId SuccessBlock:^(NSDictionary *dic)
    {
        _detailModel= [YWPagedetailModel mj_objectWithKeyValues:dic];
        NSString *html = [NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" href=%@</head><body>%@</body></html>",_detailModel.css[0],_detailModel.body];
        [_webView loadHTMLString:html baseURL:nil];
        [_headerImageView sd_setImageWithURL:[NSURL URLWithString:_detailModel.image]];
        _imagesoucelable.text=[NSString stringWithFormat:@"图片来源:%@",_detailModel.image_source];
        _imagetitlelable.text=[NSString stringWithFormat:@"%@",_detailModel.title];
        
    } failBlock:^(NSError *error) {
        
    } ];
}
@end
