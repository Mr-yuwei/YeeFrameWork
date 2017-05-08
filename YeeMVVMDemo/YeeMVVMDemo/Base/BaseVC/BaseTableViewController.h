//
//  BaseTableViewController.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/8.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController

@property(nonatomic,retain)UITableView      *tableView;

-(void)registerCellClass;

@end
