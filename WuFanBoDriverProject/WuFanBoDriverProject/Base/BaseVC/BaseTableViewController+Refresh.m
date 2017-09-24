//
//  BaseTableViewController+Refresh.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseTableViewController+Refresh.h"

@implementation BaseTableViewController (Refresh)

#pragma mark  header Refresh Block
-(void)tablePullupHeaderRefresh:(void (^)(void))headerBlock{
 
    __weak typeof(self)weakself=self;
    MJRefreshNormalHeader  *headerView=[MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        if (headerBlock)
        {
            headerBlock();
        }
    }];
    weakself.tableView.mj_header=headerView;
    
}

#pragma mark  footView Refresh Block
-(void)tablePullDownFootRefresh:(void (^)(void))footerBlock{
   
    __weak typeof(self)weakself=self;
    MJRefreshBackNormalFooter  *footrefreshView=[MJRefreshBackNormalFooter  footerWithRefreshingBlock:^{
        if (footerBlock)
        {
            footerBlock();
        }
    }];
    weakself.tableView.mj_footer=footrefreshView;
    
}
#pragma mark  stop Refresh
-(void)tableViewEndRefresh{
    
    __weak typeof(self)weakself=self;
    [weakself.tableView.mj_header endRefreshing];
    [weakself.tableView.mj_footer endRefreshing];
}

#pragma mark --停止刷新
-(void)tableViewEndRefreshWith:(NSArray *)listArray
{
    [self.tableView.mj_header endRefreshing];
    if (listArray.count %15|| listArray.count == 0)
    {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.tableView.mj_footer endRefreshing];
    }
}
@end
