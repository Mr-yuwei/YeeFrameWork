//
//  HomeViewController.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/21.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "HomeViewController.h"
#import <ARKit/ARKit.h>
#import "WFHomeTestTableViewCell.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self tablePullupHeaderRefresh:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self tableViewEndRefresh];//结束刷新
            
            [self  setNoNetWorkView];
            
        });
    }];
    [self tablePullDownFootRefresh:^{
        
       // [self tableViewEndRefresh];//结束刷新
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
    }];
}
-(void)registerTableViewCell{
    
     [super registerTableViewCell];
    
     [self.tableView registerClass:[WFHomeTestTableViewCell class] forCellReuseIdentifier:@"HomeTestTableViewCell"];
}
-(void)configOwnViews{
    
    [super configOwnViews];
    
    self.tableView.frame=CGRectMake(0, 0, kMainScreenWidth, KcontentTabViewHeight);
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WFHomeTestTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"HomeTestTableViewCell"];
    
   // [tableView dequeueReusableCellWithIdentifier:@"HomeTestTableViewCell" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:@"HomeTestTableViewCell" configuration:^(WFHomeTestTableViewCell *cell) {
        
        NSLog(@"%@",cell.subviews);
        
    }];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self showSuccessMessage:@"请求成功请求成功请求成功请求成功请求!"];

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
