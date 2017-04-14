//
//  YWThemeAuthorListViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/21.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWThemeAuthorListViewController.h"
#import "YWLeftModel.h"
#import "YWcommonHeader.h"

@interface YWThemeAuthorListViewController ()

@end

@implementation YWThemeAuthorListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"主编";
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _ediorArray.count;
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    YWLeftthemeeditorsModel *model=_ediorArray[indexPath.row];
    cell.imageView.layer.masksToBounds=YES;
    cell.imageView.layer.cornerRadius=25.0f;
    [cell.imageView  sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
     cell.textLabel.text =model.name;
    cell.textLabel.font=SystemFont(12);
    cell.detailTextLabel.font=SystemFont(8);
    cell.detailTextLabel.textColor=kGrayColor;
    cell.detailTextLabel.numberOfLines=0;
    cell.detailTextLabel.text=model.bio;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //http://news-at.zhihu.com/api/4/editor/79/profile-page/ios
    YWLeftthemeeditorsModel *model=_ediorArray[indexPath.row];
    YWCommonWebViewController *webVC=[[YWCommonWebViewController alloc] init];
    webVC.title=model.name;
    [webVC loadYWWebViewRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://news-at.zhihu.com/api/%@/editor/79/profile-page/ios",model.id]]]];
    [self.navigationController pushViewController:webVC animated:YES];
    
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
