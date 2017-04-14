//
//  YWTableViewController.h
//  YWBaseFrameWork
//
//  Created by NeiQuan on 16/6/8.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "YWBaseViewController.h"

@interface YWTableViewController : YWBaseViewController<UITableViewDelegate,UITableViewDataSource>
/**tableView*/
@property(nonatomic,retain)UITableView *YWtableView;
/**数据源*/
@property (nonatomic, strong) NSMutableArray *dataArray;
/**开启头部刷新*/
@property (nonatomic, assign)   BOOL isOpenHeaderRefresh;
/**开始脚部加载更多*/
@property (nonatomic, assign)   BOOL isOpenFooterRefresh;

 //头部刷新的回调子类重写
- (void)headerRefresh;
// 脚部刷新的回调子类重写
- (void)footerRefresh;


@end
