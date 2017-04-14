//
//  YWPersonSetViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/22.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWPersonSetViewController.h"
#import "YWcommonHeader.h"
#import "RESideMenu.h"
#import "UIViewController+RESideMenu.h"
@interface YWPersonSetViewController ()

@end
@implementation YWPersonSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置";
    [self setNavView];
   
}
-(void)setNavView
{
    [[UISwitch appearance] setOnTintColor:kNavBarThemeColor];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem  itemWithImage:@"Back_White" higImage:@"Back_White" target:self action:@selector(showMenuClick)];
}
-(void)showMenuClick
{
    RESideMenu *root = (RESideMenu*)[AppDelegate sharedAppDelegate].window.rootViewController;
    [root  presentLeftMenuViewController];
}
#pragma mark - UITableViewDelegate - 子类重写
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        case 1:
        case 3:
        case 5:
          return 1;
          break;
        default:
            return 2;
            break;
    };
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.font=SystemFont(12);
    cell.accessoryView=[[UISwitch  alloc] init];
    switch (indexPath.section)
    {
        case 0:
        {
            [cell.imageView setImage:[UIImage imageNamed:@"Comment_Avatar"]];
            cell.textLabel.text=@"我的资料";
            cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Editor_Arrow"]];
        }
            break;
        case 1:
        {
            cell.textLabel.text=@"自动离线下载";
        }
            break;
        case 2:
        {
            if (indexPath.row==0)
            {
               cell.textLabel.text=@"移动网络不下载图片";
            }else
            {
                cell.textLabel.text=@"大字号";
            }
        }
            break;
        case 3:
        {
            cell.textLabel.text=@"消息推送";
        }
            break;
        case 4:
        {
            if (indexPath.row==0)
            {
                cell.textLabel.text=@"去好评";
            }else
            {
                
                cell.textLabel.text=@"去吐槽";
            }
             cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Editor_Arrow"]];
        }
            break;
        case 5:
        {
            cell.textLabel.text=@"清除缓存";
            cell.accessoryView=[[UIView alloc] init];

        }
            break;
        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15.0f)];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.01)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01f;
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
