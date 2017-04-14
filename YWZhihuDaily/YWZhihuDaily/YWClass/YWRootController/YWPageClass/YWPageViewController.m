//
//  YWPageViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//
//////https://github.com/Mr-yuwei/YWZhihuDailyc
#import "YWPageViewController.h"
#import "YWcommonHeader.h"
#import "AppDelegate.h"
#import "RESideMenu.h"
#import "YWPageDataManger.h" //网络数据获取
#import "YWPageModel.h"
#import "YWPageTextImageTableViewCell.h"
#import "YWPageDetailViewController.h" //消息详情
#import <MJRefresh/MJRefresh.h>
@interface YWPageViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    NSMutableArray      *_dataListArray;
    NSMutableArray      *_bannerListArray;
    NSMutableArray      *_dateListArray;//用于存放日期
    UITableView         *_tableView;
    SDCycleScrollView   *_pageBannerHeaderView;//轮播图
    
    UIView              *_topView;
    UIButton            *_leftButton;
    UILabel             *_titleLableView;//标题
    UIView              *_alplaView;//模拟渐变效果的View
    NSInteger           _currentPage;
}
@end

@implementation YWPageViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataListArray=[[NSMutableArray alloc] init];
    _bannerListArray=[[NSMutableArray alloc] init];
    _dateListArray=[[NSMutableArray alloc] init];
    [self makeNav];
    [self makeTableView];
    [self addRefreshView];
    [self getleastNewsData];
}
-(void)makeNav
{
    UIView *topView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    [topView setBackgroundColor:[UIColor clearColor]];
    UIView *colorView=[[UIView alloc] initWithFrame:topView.bounds];
    [topView addSubview:colorView];
    [colorView setBackgroundColor:[UIColor colorWithString:@"0071C7"]];
    colorView.alpha=0.00;
    
    UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"iOS6_Home_Icon_Menu_G_Highlight"] forState:UIControlStateNormal];
    [leftButton setFrame:CGRectMake(5, 25, 40, 26)];
    _leftButton=leftButton;
    
    [leftButton addTarget:self action:@selector(showMenuVC) forControlEvents:UIControlEventTouchUpInside];
    //[[leftButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
    
   // }];
    
    UILabel *titleLable=[[UILabel alloc]initWithFrame:CGRectMake(50, 21, kScreenWidth-70, 21)];
    titleLable.font=SystemFont(17);
    titleLable.textColor=kWhiteColor;
    titleLable.text=@"今日热闻";
    titleLable.textAlignment=NSTextAlignmentCenter;
    _topView=topView;
    _titleLableView=titleLable;
    _alplaView=colorView;
    [topView addSubview:leftButton];
    [topView addSubview:titleLable];
    [self.view addSubview:topView];
}

-(void)showMenuVC
{
     RESideMenu *root = (RESideMenu*)[AppDelegate sharedAppDelegate].window.rootViewController;
     [root presentLeftMenuViewController];
}
#pragma mark --tabelView --init 轮播图

-(void)makeTableView
{
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight+20) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    
    
    SDCycleScrollView *bannerHeaderView=[[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    bannerHeaderView.delegate=self;
    bannerHeaderView.bannerImageViewContentMode=UIViewContentModeScaleAspectFill;
    bannerHeaderView.titleLabelTextFont=[UIFont fontWithName:@"STHeitiSC-Medium" size:21];
    bannerHeaderView.titleLabelBackgroundColor=[UIColor clearColor];
    bannerHeaderView.titleLabelTextColor=kWhiteColor;
    bannerHeaderView.titleLabelHeight=100;
    bannerHeaderView.pageControlStyle=SDCycleScrollViewPageContolStyleClassic;
    tableView.tableHeaderView=bannerHeaderView;
    
    _tableView=tableView;
    _pageBannerHeaderView=bannerHeaderView;

    [self.view addSubview:tableView];
    [self.view bringSubviewToFront:_topView];
}
#pragma mark --添加刷新事件
-(void)addRefreshView
{
    __weak typeof(self)weakself=self;
  
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _currentPage=0;
        [weakself getleastNewsData];//获取最新消息
    }];
    
    _tableView .mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
        _currentPage++;
        [weakself  getbeforeNewsdata];//加载之前的信息
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return _dataListArray.count;
}
#pragma mark --tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *newsArray=_dataListArray[section];
    return  newsArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YWPageTextImageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"YWPageTextImageTableViewCell"];
    if (cell==nil)
    {
        cell=[[YWPageTextImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YWPageTextImageTableViewCell"];
    }
    NSArray *newsArray=_dataListArray[indexPath.section];
    YWPageModel *model=newsArray[indexPath.row];
    cell.model=model;
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    if (section!=0)
    {
        [headerView setBackgroundColor:[UIColor colorWithString:@"0071C7"]];
        UILabel  *lable=[[UILabel alloc] initWithFrame:headerView.bounds];
        lable.textAlignment=NSTextAlignmentCenter;
        lable.font=[UIFont systemFontOfSize:13];
        lable.textColor=kWhiteColor;
        [headerView addSubview:lable];
        lable.text=[NSString stringWithFormat:@"%@",_dateListArray[section]];
    }
    
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) return 0.01f;
    return 30.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *newsArray=_dataListArray[indexPath.section];
    YWPageModel *model=newsArray[indexPath.row];
    [self pushtoDetailcontrollerdidselected:model];
}
#pragma mark --SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    YWPageModel *model= _bannerListArray[index];
    [self pushtoDetailcontrollerdidselected:model];
}
#pragma mark --查看详情
-(void)pushtoDetailcontrollerdidselected:(YWPageModel*)model
{
    YWPageDetailViewController *detailVc=[[YWPageDetailViewController alloc] init];
    detailVc. newsId=model.ID;
    [self.navigationController pushViewController:detailVc animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = 0;
#define NAVBAR_CHANGE_POINT 64
    if (offsetY > NAVBAR_CHANGE_POINT) {
        alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
    }
    _alplaView.alpha=alpha;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark --获取最新数据
-(void)getleastNewsData
{
    [YWPageDataManger getleastNewsdataSuccessBlock:^(NSDictionary *dic)
    {
        _bannerListArray=[YWPageModel mj_objectArrayWithKeyValuesArray:dic[@"top_stories"]]; //轮播图
        
        if (_dataListArray.count!=0)
        {
            [_dataListArray removeAllObjects];
        }
        if (_dateListArray.count!=0)
        {
            [_dateListArray removeAllObjects];
        }
        
        [_dateListArray addObject:dic[@"date"]];
        [_dataListArray addObject: [YWPageModel mj_objectArrayWithKeyValuesArray:dic[@"stories"]]];//当日新闻
        _pageBannerHeaderView.imageURLStringsGroup=[_bannerListArray valueForKeyPath:@"image"];
        //不应该使用别人的框架没法修改
       _pageBannerHeaderView.titlesGroup=[_bannerListArray valueForKeyPath:@"title"];
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
    }failBlock:^(NSError *error)
    {
        
    }];
}
#pragma mark --获取过往消息
//一大堆时间问题
-(void)getbeforeNewsdata
{
    //http://news.at.zhihu.com/api/4/news/before/20131119
    NSLocale * locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];//中国市区
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.locale=locale;
    [formatter setDateFormat:@"YYYYMMdd"]; //只获取月和日的数据
    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:-24*60*60*(_currentPage-1)];//按照网上大神给的文档
    NSString * dateString = [formatter stringFromDate:date];
    NSLog(@"Mr-yuwei----%ld",(long)_currentPage);
    NSLog(@"Mr-yuwei%@",dateString);
    [YWPageDataManger getNewsBeforeawithDataSting:dateString SuccessBlock:^(NSDictionary *dic)
    {
      [_dateListArray addObject:dic[@"date"]];
      [_dataListArray addObject: [YWPageModel mj_objectArrayWithKeyValuesArray:dic[@"stories"]]];//
      [_tableView reloadData];
      [_tableView.mj_header endRefreshing];
     [_tableView.mj_footer endRefreshing];
        
    } failBlock:^(NSError *error)
    {
        
        
    }];
    
    
    
    
}
@end
