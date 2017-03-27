//
//  SinaViewController.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/26.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "SinaViewController.h"
#import "YeeZoomViewController.h"

@interface SinaViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView      *_tableView;
}
@end

@implementation SinaViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addtableView];
}
#pragma mark --tableView
-(void)addtableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text=@"Mr_yuwei";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self presentViewController:[YeeZoomViewController new] animated:YES completion:^{
        
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
