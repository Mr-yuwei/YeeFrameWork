//
//  BaseTableViewController.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseTableViewController.h"
//#define  adjustsScrollViewInsets(scrollView)\
//do {\
//_Pragma("clang diagnostic push")\
//_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
//if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
//NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
//NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
//NSInteger argument = 2;\
//invocation.target = scrollView;\
//invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
//[invocation setArgument:&argument atIndex:2];\
//[invocation retainArguments];\
//[invocation invoke];\
//}\
//_Pragma("clang diagnostic pop")\
//} while (0)
@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    
    
}

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self registerTableViewCell];
    // Do any additional setup after loading the view.
}
-(void)configOwnViews{
    
    [super configOwnViews];
    
    if (@available(iOS 11.0, *)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
-(void)addOwnViews{
    
    [super addOwnViews];
    
    [self.view addSubview:self.tableView];
}
-(void)registerTableViewCell{
    
    [self.tableView registerClass:[BaseTableViewCell class] forCellReuseIdentifier:[BaseTableViewCell cellIdentifier]];
    
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:[BaseTableViewCell cellIdentifier] forIndexPath:indexPath];
    cell.textLabel.textColor=kBlackColor;
    cell.textLabel.text=@"yeeOS";
    return cell;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
    
}
#pragma mark tableView Selected method
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
        _tableView.estimatedSectionFooterHeight=0.1f;
        _tableView.estimatedSectionHeaderHeight=0.1f;
    }
    return _tableView;
}

@end
