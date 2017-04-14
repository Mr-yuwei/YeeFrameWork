//
//  YWLeftViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//
////https://github.com/Mr-yuwei/YWZhihuDaily
#import "YWLeftViewController.h"
#import "YWcommonHeader.h"
#import "YWLeftDataManger.h" //网络数据获取
#import "YWLeftModel.h"
#import "AppDelegate.h"
#import "RESideMenu.h"
#import "YWLeftListController.h"
#import "YWPageViewController.h"
#import "YWButton.h"
#import "YWPersonSetViewController.h" //设置

@interface YWLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView           *_leftTableView;
    UIView                *_topView;
    UIView                *_bottomView;
    NSMutableArray        *_dataListArray;
    
}
@end

@implementation YWLeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeSubViews];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadListData];//加载网络展示数据
    
}

-(void)makeSubViews
{
    [self.view setBackgroundColor: RGB(15, 20, 24)];
    [self makeTopView];
    [self makeTableViews];
    [self makeBottomView];
}
-(void)makeTopView
{
    
    __weak typeof(self)weakself=self;
    UIView *topView=[[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, 80)];
   
    UIImageView *headerView=[[UIImageView alloc]init];
    [headerView setImage:[UIImage imageNamed:@"Dark_Menu_Avatar"]];
    [headerView setFrame:CGRectMake(15, 5, 30, 30)];
    headerView.layer.masksToBounds=YES;
    headerView.layer.cornerRadius=15;
    [topView addSubview:headerView];
    
    UILabel *userNameLable=[[UILabel alloc] init];
    [topView addSubview:userNameLable];
    [userNameLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:headerView withOffset:10] ;
    [userNameLable  autoPinEdgeToSuperviewEdge:ALEdgeTop  withInset:10];
    [userNameLable autoSetDimension:ALDimensionHeight toSize:21];
    userNameLable.textColor=[UIColor whiteColor];
    userNameLable.font=[UIFont systemFontOfSize:17];
    userNameLable.text=@"曦紫牧";
  
    
    YWButton *collectButton=[YWButton buttonWithType:UIButtonTypeCustom];
    [collectButton setImage:[UIImage imageNamed:@"Dark_Fav_icon"] forState:UIControlStateNormal];
    [collectButton setTitleColor:[UIColor colorWithWhite:0.7 alpha:0.8] forState:UIControlStateNormal];
    collectButton.titleLabel.font=SystemFont(12);
    [collectButton setImageTitleSpace:5.0f];
    [collectButton setTitle:@"收藏" forState:UIControlStateNormal];
    [collectButton setFrame:CGRectMake(10, 35, 60, 50)];
    [collectButton setEdgeInsetsStyle:YWButtonEdgeInsetsStyleImageTop];
    [topView addSubview:collectButton];
    
    YWButton *setButton=[YWButton buttonWithType:UIButtonTypeCustom];
    [setButton setImage:[UIImage imageNamed:@"Menu_Icon_Setting"] forState:UIControlStateNormal];
    [setButton setTitleColor:[UIColor colorWithWhite:0.7 alpha:0.8] forState:UIControlStateNormal];
    setButton.titleLabel.font=SystemFont(12);
    [setButton setImageTitleSpace:5.0f];
    [setButton setTitle:@"设置" forState:UIControlStateNormal];
    [setButton setFrame:CGRectMake(launchwith-70, 35, 60, 50)];
    [setButton setEdgeInsetsStyle:YWButtonEdgeInsetsStyleImageTop];
    [topView addSubview:setButton];
    
    [setButton addTarget:weakself action:@selector(pushtoDifferentVC:) forControlEvents:UIControlEventTouchUpInside];
    
    YWButton *MessageButton=[YWButton buttonWithType:UIButtonTypeCustom];
    [MessageButton setImage:[UIImage imageNamed:@"Menu_Icon_Message"] forState:UIControlStateNormal];
    [MessageButton setTitleColor:[UIColor colorWithWhite:0.7 alpha:0.8] forState:UIControlStateNormal];
    MessageButton.titleLabel.font=SystemFont(12);
    [MessageButton setImageTitleSpace:5.0f];
    [MessageButton setTitle:@"消息" forState:UIControlStateNormal];
    [MessageButton setFrame:CGRectMake((launchwith-60)*0.5, 35, 60, 50)];
    [MessageButton setEdgeInsetsStyle:YWButtonEdgeInsetsStyleImageTop];
    [topView addSubview:MessageButton];
    
    //创建
    [self.view addSubview:topView];
}
#pragma mark --push-->入栈不同的
-(void)pushtoDifferentVC:(UIButton *)sender
{
    
    RESideMenu *root = (RESideMenu*)[AppDelegate sharedAppDelegate].window.rootViewController;
    [root hideMenuViewController];
    [root setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[YWPersonSetViewController alloc] init]]animated:YES];

}
-(void)makeTableViews
{
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,100 ,launchwith, kScreenHeight-100-49) style:UITableViewStylePlain];
    [tableView setBackgroundColor:RGB(15, 20, 24)];
    tableView.showsVerticalScrollIndicator=NO;
    tableView.showsHorizontalScrollIndicator=NO;
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.separatorColor=[UIColor clearColor];
    _leftTableView=tableView;
    [self.view addSubview:tableView];
    
}
-(void)makeBottomView
{
    UIView  *bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, self.view.height-49, self.view.width, 49)];
    [bottomView setBackgroundColor:RGB(26, 32, 36)];

    //下载按钮
    UIButton *downButon=[UIButton buttonWithType:UIButtonTypeCustom];
   [downButon setFrame:CGRectMake(8, (49-30)*0.5, 80, 30)];
   [downButon setImage:[UIImage imageNamed:@"Dark_Menu_Download"] forState:UIControlStateNormal];
   [downButon setTitle:@" 下载" forState:UIControlStateNormal];
   downButon .titleLabel.font=[UIFont systemFontOfSize:14];
   [downButon setTitleColor:kWhiteColor forState:UIControlStateNormal];
    //点击下载
//    [[downButon  rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
//        
//    }];
    
    //夜间
    UIButton *nightButon=[UIButton buttonWithType:UIButtonTypeCustom];
    [nightButon setFrame:CGRectMake(launchwith-100, (49-30)*0.5, 80, 30)];
    [nightButon setImage:[UIImage imageNamed:@"Menu_Dark"] forState:UIControlStateNormal];
    [nightButon setTitle:@" 夜间" forState:UIControlStateNormal];
    nightButon .titleLabel.font=[UIFont systemFontOfSize:14];
    [nightButon setTitleColor:kWhiteColor forState:UIControlStateNormal];
    //夜间模式
   // [[nightButon  rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
    //}];
   
    [bottomView addSubview:downButon];
    [bottomView addSubview:nightButon];
    
    [self.view addSubview:bottomView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataListArray.count+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Mr-yuwei"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Mr-yuwei"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell setBackgroundColor:RGB(15, 20, 24)];
    cell.textLabel.font=SystemFont(13);
    cell.textLabel.textColor=[UIColor colorWithWhite:0.7 alpha:0.8];
    if (indexPath.row==0)
    {
        cell.imageView.image=[UIImage imageNamed:@"Menu_Icon_Home"];
        cell.textLabel.text=@"首页";
        cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Menu_Enter"]];
    }else
    {
       cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Menu_Follow"]];
       YWLeftModel *model=_dataListArray[indexPath.row-1];
       cell.textLabel.text=model.name;
    }
    return cell;
}
#pragma mark --tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RESideMenu *root = (RESideMenu*)[AppDelegate sharedAppDelegate].window.rootViewController;
    [root hideMenuViewController];
    if (indexPath.row!=0)
    {
         YWLeftListController  *listVC=[[YWLeftListController alloc] init];
         YWLeftModel *model=_dataListArray[indexPath.row-1];
         listVC.themeid=model.id;
         [root setContentViewController:[[UINavigationController alloc] initWithRootViewController:listVC]animated:YES];
    }else
    {
        YWPageViewController   *page=[[YWPageViewController alloc] init];
        [root setContentViewController:[[UINavigationController alloc] initWithRootViewController:page]animated:YES];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --加载网络数据
-(void)loadListData
{
    if (_dataListArray==nil)_dataListArray=[[NSMutableArray alloc] init];
    
    
    [YWLeftDataManger  getNewslistdataSuccessBlock:^(NSDictionary *result)
    {
     _dataListArray=[YWLeftModel mj_objectArrayWithKeyValuesArray: result[@"others"]];
    [_leftTableView reloadData];
        
    } failBlock:^(NSError *error) {
        
    }];
}

@end
