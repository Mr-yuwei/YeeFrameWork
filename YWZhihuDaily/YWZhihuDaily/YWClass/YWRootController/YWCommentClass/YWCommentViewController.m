//
//  YWCommentViewController.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/22.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//
//////https://github.com/Mr-yuwei/YWZhihuDaily
#import "YWCommentViewController.h"
#import "YWcommonHeader.h"
#import "YWCommentDataManger.h"
#import "YWCommentModel.h"
#import "YWCommentTableViewCell.h"
@interface YWCommentViewController ()
{
    UIView           *_bottomView;
    NSMutableArray   *_longDataArray;
    NSMutableArray   *_shortDataArray;
}
@end

@implementation YWCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"评论";
    _longDataArray=[[NSMutableArray alloc] init];
    _shortDataArray=[[NSMutableArray alloc] init];
    [self makeSubviews];
    [self loadlongCommentData];
    [self loadshortCommentData];//加载网络数据
}
-(void)makeSubviews
{
    self.YWtableView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight-49);
    [self addBottomView];
    [self addNoLongView];
   
}
#pragma mark --添加底部评论框
-(void)addBottomView
{
    __weak typeof(self)weakself=self;
  
    UIView  *bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    [bottomView  setBackgroundColor:RGB(26, 32, 36)];
    
    UIButton  *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(15, 5, 45, 35)];
    [leftButton setImage:[UIImage imageNamed:@"Back_White"] forState:UIControlStateNormal];
    [leftButton addTarget:weakself action:@selector(clickdifferentButton:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:leftButton];
    
    
    UIButton  *centerButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [centerButton setFrame:CGRectMake(kScreenWidth*0.5-40, 5, 80, 35)];
    [centerButton setImage:[UIImage imageNamed:@"Comment_Icon_Compose"] forState:UIControlStateNormal];
    [centerButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [centerButton setTitle:@"添加评论" forState:UIControlStateNormal];
    centerButton.titleLabel.font=SystemFont(12);
    [bottomView addSubview:centerButton];
    [self.view addSubview:bottomView];
}
-(void)clickdifferentButton:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --添加没有长评论数据图
-(void)addNoLongView
{
    UIView  *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*0.5)];
    UIImageView  *backImageView=[[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-100)*0.5, (kScreenHeight*0.5-100)*0.5, 100, 100)];
    [backImageView setImage:[UIImage imageNamed:@"Comment_Empty"]];
    backImageView.contentMode=UIViewContentModeScaleAspectFill;
    backImageView.clipsToBounds=YES;
    [view addSubview:backImageView];
    self.YWtableView.tableHeaderView=view;
}
#pragma mark - UITableViewDelegate - 子类重写
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark --需要判断是否存在长评论和短评论--->数据异步不太好处理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            
            break;
        case 1:
            
            break;
            
        default:
            break;
    }
    return 0;
    
//    if (_longDataArray.count!=0)
//    {
//        return _longDataArray.count+1+_shortDataArray.count!=0?_shortDataArray.count+1:0;
//    }else
//    {
//        return _shortDataArray.count!=0?_shortDataArray.count+1:0;
//    }
//    
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    YWCommentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"YWCommentTableViewCell"];
    if (!cell)
    {
        cell=[[YWCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YWCommentTableViewCell"];
    }
    
    if (_longDataArray.count!=0)
    {
       
        
    }else
    {
        if (indexPath.row==0)
        {
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Mr-yuwei"];
            if (!cell) {
                cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Mr-yuwei"];
            }
            cell.textLabel.text=[NSString stringWithFormat:@"%li个短评论",_shortDataArray.count];
            cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Comment_Icon_Fold_Highlight"]];
            return cell;
        }
        YWCommentModel *model=_shortDataArray[indexPath.row-1];
        cell.commentModel=model;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_longDataArray.count!=0)
    {
      
        
    }else
    {
     if (indexPath.row==0)return 44;
    }
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

#pragma mark --加载评论内容
-(void)loadlongCommentData
{
    NSString *url=[NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%@/long-comments",_messageID];
    [YWCommentDataManger getCommenListdata:url parameters:nil SuccessBlock:^(NSDictionary *result)
     {
         _longDataArray=[YWCommentModel mj_objectArrayWithKeyValuesArray:result[@"comments"]];
        if (_longDataArray.count!=0)
        {
            self.YWtableView.tableHeaderView=[[UIView alloc] init];
            
        }
        [self.YWtableView reloadData];
    } failBlock:^(NSError *error) {
        
    }];
}
#pragma mark --短评论
-(void)loadshortCommentData
{
    NSString *url=[NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%@/short-comments",_messageID];
    [YWCommentDataManger getCommenListdata:url parameters:nil SuccessBlock:^(NSDictionary *result) {
        _shortDataArray=[YWCommentModel mj_objectArrayWithKeyValuesArray:result[@"comments"]];
        [self.YWtableView reloadData];
    } failBlock:^(NSError *error) {
        
    }];
    
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
