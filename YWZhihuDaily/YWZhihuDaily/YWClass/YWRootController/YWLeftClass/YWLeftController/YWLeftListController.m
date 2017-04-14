  //
//  YWLeftListController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/20.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//
//////https://github.com/Mr-yuwei/YWZhihuDailyc
#import "YWLeftListController.h"
#import "YWLeftDataManger.h"
#import "UIBarButtonItem+Extension.h"
#import "YWcommonHeader.h"
#import "RESideMenu.h"
#import "YWLeftModel.h"
#import "YWLeftClassTableViewCell.h"
#import "YWPageTextImageTableViewCell.h"
#import "YWThemeAuthorListViewController.h"  //主编
#import "YWPageDetailViewController.h" //文章详情
@interface YWLeftListController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView   *_tableView;
    
    YWLeftthemeListModel   *_themeListModel;
}


@end

@implementation YWLeftListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeSubViews];
    [self getThemeData];//获取网络数据
}

-(void)makeSubViews
{
    [self makeNavView];
    [self makeTableViews];
}
-(void)makeNavView
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"Back_White" higImage:@"Back_White" target:self action:@selector(backtoNext)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImage:@"Management_Add" higImage:@"Management_Add" target:self action:@selector(addnotice)];
    
}
-(void)backtoNext
{
    
    RESideMenu *root = (RESideMenu*)[AppDelegate sharedAppDelegate].window.rootViewController;
    [root  presentLeftMenuViewController];
    
}
-(void)addnotice
{
    
}
-(void)makeTableViews
{
    UITableView  *tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tableFooterView=[[UIView alloc] init];
    _tableView=tableView;
    [self.view addSubview:tableView];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _themeListModel?_themeListModel.stories.count+1:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        YWLeftClassTableViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:@"YWLeftClassTableViewCell"];
        if (cell==nil)
        {
            cell=[[YWLeftClassTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YWLeftClassTableViewCell"];
        }
        cell.listArray=_themeListModel.editors;
        return cell;
    }else
    {
        YWLeftthemeStoriesModel  *model=_themeListModel.stories[indexPath.row-1];
        if ( [model.type integerValue]==1)//有图集
        {
            YWPageTextImageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"YWPageTextImageTableViewCell"];
            if (cell==nil)
            {
                cell=[[YWPageTextImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YWPageTextImageTableViewCell"];
            }
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.thememodel=model;
            return cell;
      }else
        {
            //文字
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Mr-yuwei"];
            if (!cell)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Mr-yuwei"];
            }
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.textLabel.numberOfLines=0;
            cell.textLabel.text=model.title;
            return cell;
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        YWThemeAuthorListViewController *author=[[YWThemeAuthorListViewController alloc] init];
        author.ediorArray=_themeListModel.editors;
        [self.navigationController pushViewController:author animated:YES];
    }else
    {
      YWLeftthemeStoriesModel  *model=_themeListModel.stories[indexPath.row-1];
        YWPageDetailViewController  *detailVC=[[YWPageDetailViewController alloc] init];
        detailVC.newsId=model.id;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)return 45;
     return 90;
}
#pragma mark --根据主题获取数据
-(void)getThemeData
{
    [YWLeftDataManger getThemelistdatathemeid:_themeid SuccessBlock:^(NSDictionary *result)
     {
        _themeListModel=[YWLeftthemeListModel mj_objectWithKeyValues:result];
         self.title=_themeListModel.name;//当前文章标题
         [_tableView reloadData];
    } failBlock:^(NSError *error)
     {
        
    }];
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
