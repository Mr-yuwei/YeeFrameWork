//
//  YWTableViewController.m
//  YWBaseFrameWork
//
//  Created by NeiQuan on 16/6/8.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "YWTableViewController.h"
#import "MJRefresh.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface YWTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YWTableViewController
//加载视图完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableView
    [self.view addSubview:self.YWtableView];
 
}
-(NSMutableArray*)dataArray{
    if (_dataArray==nil)
    {
        _dataArray=[[ NSMutableArray alloc] init];
    }
    return _dataArray;
    
}
//视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    
}
//视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
}
//视图将要消失
- (void)viewWillDisappear:(BOOL)animated
{
    
}
//视图已经消失
- (void)viewDidDisappear:(BOOL)animated
{
}
//收到系统内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)fitCondition
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"wwdc15.jpg"] forBarMetrics:UIBarMetricsDefault];
}

- (UITableView *)YWtableView
{
    if (!_YWtableView)
    {
        _YWtableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width ,self.view.frame.size.height ) style:UITableViewStyleGrouped];
      //  _YWtableView.separatorColor=[ UIColor clearColor];
        _YWtableView.showsVerticalScrollIndicator=NO;
        _YWtableView.showsHorizontalScrollIndicator=NO;
        self.YWtableView.delegate = self;
        self.YWtableView.dataSource = self;
        //去掉下面没有数据呈现的cell
        self.YWtableView.tableFooterView = [[UIView alloc]init];
    }
    return _YWtableView;
}
#pragma mark - UITableViewDelegate - 子类重写
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据-%02ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.01)];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.01)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

#pragma mark - 注册是否开启头部刷新and脚部刷新
- (void)setIsOpenHeaderRefresh:(BOOL)isOpenHeaderRefresh
{ _isOpenHeaderRefresh =  isOpenHeaderRefresh;
    if (_isOpenHeaderRefresh) {
        WS(weakSelf);
        self.YWtableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf headerRefresh];
        }];
    }else{
        NSLog(@"不开启头部刷新");
    }
}
- (void)setIsOpenFooterRefresh:(BOOL)isOpenFooterRefresh
{  _isOpenFooterRefresh =  isOpenFooterRefresh;
    if (_isOpenFooterRefresh) {
        WS(weakSelf);
        self.YWtableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            [weakSelf footerRefresh];
        }];
    }else{
        NSLog(@"不开启头脚部刷新");
    }
}
//cell顶格
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}
#pragma mark - 头部刷新and脚部刷新
- (void)headerRefresh
{
    
}
- (void)footerRefresh
{
}



@end
