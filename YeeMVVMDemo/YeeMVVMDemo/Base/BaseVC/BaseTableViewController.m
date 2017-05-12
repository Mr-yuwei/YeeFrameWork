//
//  BaseTableViewController.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/8.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseTableViewController.h"
#import "YTableViewModel.h"
#import "YViewModel.h"

@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, readonly) YTableViewModel *viewModel;

@end

@implementation BaseTableViewController
@dynamic viewModel;
- (instancetype)initWithViewModel:(YViewModel *)viewModel {
    
    self = [super initWithViewModel:viewModel];
    if (self) {
        if (viewModel.shouldRequestRemoteDataOnViewDidLoad==YES) {
            @weakify(self)
            [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                @strongify(self)
                [[[self.viewModel.requestRemoteDataCommand execute:(@(1))] deliverOnMainThread]subscribeNext:^(NSMutableArray   *array) {
                    //这里获取到数据
                    @strongify(self)
                    self.viewModel.page=1;
                    [self.viewModel.dataSource removeAllObjects];
                    [self.viewModel.dataSource addObjectsFromArray:array];
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView reloadData];
                } error:^(NSError * _Nullable error) {
                    
                    [self.view showNBNetErrorWithMessage:error.userInfo[@"NSLocalizedDescription"]];
                    [self.tableView.mj_header endRefreshing];
                    
                } completed:^{
                    
                    
                }] ;
            }];
        }
    }
    return self;
}
- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView setBackgroundColor:kBackgroundColor];
    [self registerCellClass];
}
-(void)configOwnViews{
    
    [super configOwnViews];
    
}
-(void)bindViewModel{
    
    [super bindViewModel];
    
}
//停止刷新
- (void)endRefreshing {
    
    if (self.viewModel.shouldInfiniteScrolling) {
        if ((self.viewModel.dataSource.count %self.viewModel.Pagesize != 0) || self.viewModel.dataSource.count == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.tableView.mj_footer endRefreshing];
        }
    }
}
-(void)registerCellClass{
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}
#pragma mark - UITableViewDataSource
#pragma mark  warning
//需要子类从写 --
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.viewModel.dataSource ? self.viewModel.dataSource.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.viewModel.dataSource[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.textColor=kBlackColor;
    cell.textLabel.text=@"yeeOS";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
-(UITableView *)tableView{
    
    if (_tableView==nil) {
        _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.tableFooterView=[[UIView alloc] init];
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
