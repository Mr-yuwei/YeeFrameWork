//
//  BaseTableViewController.m
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/27.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<ASTableDelegate,ASTableDataSource>
{
    
    
}
@end

@implementation BaseTableViewController
- (instancetype)init
{
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    self = [super initWithNode:_tableNode];
    
    if (self) {
        
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addNavbarView];
    
    [self addOwnViews];
    
    [self  configOwnViews];
    
    [self bindViewModel];
}
//添加导航栏设置
-(void)addNavbarView{
    
    
    
}
//子类添加控件
-(void)addOwnViews{
    
    
}
//子类控件属性值配置
-(void)configOwnViews{
    
    
}

//RAC绑定事件
-(void)bindViewModel{
    
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}


@end
