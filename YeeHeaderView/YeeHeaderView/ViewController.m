//
//  ViewController.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "ViewController.h"
#import "YeeButton.h"
#import "UIView+YeeViewAnimation.h"
#import "YeePopCover.h"
#import "UIView+snapView.h"
#import "YeeZoomViewController.h"
#import "UIImageView+WebCache.h"
#import "AsyncDisplayKit.h"
#import "KittenNode.h"
#import "MJRefresh.h"
@interface ViewController ()<ASTableDelegate,ASTableDataSource>
{
    
    NSInteger currentPage;
    NSInteger pageSize;
    NSInteger maxRows;
    NSMutableArray  *_listArray;
    
}
@property(nonatomic,retain)ASTableNode *tableNode;
@end

@implementation ViewController

//- (instancetype)init
//{    if (!(self = [super initWithNode:_tableNode])) {
//        return nil;
//    }
//    
//    self.navigationItem.title = @"Home";
//    
//    return self;
//}
- (void)viewDidLoad
{
     [super viewDidLoad];
    
//  _tableNode = [[ASTableNode alloc] init];
//    _tableNode.delegate = self;
//    _tableNode.dataSource = self;
//    _tableNode.frame=CGRectMake(0, 64, self.view.frame.size.width,   self.view.frame.size.height-64-49);
//    [self.node addSubnode:_tableNode];
    
    _listArray= [NSMutableArray new];
    currentPage = 0;
    pageSize = 10;
    maxRows = 82;
    _tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    self.tableNode.frame = self.view.bounds;
    // 2
    self.tableNode.dataSource = self;
    self.tableNode.delegate = self;
    // 3
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 4
    self.tableNode.view.leadingScreensForBatching = 1.0;
    // 5
    [self.view addSubnode:self.tableNode];
    
   
    
//    __weak __typeof(self) weakSelf= self;
//    self.tableNode.view.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf.tableNode.view.mj_header endRefreshing];
//        
//        currentPage = 0;
//        [_listArray removeAllObjects];
//        if(![weakSelf hasMoreData]){// 无数据显示
//            weakSelf.tableNode.view.mj_footer.state = MJRefreshStateNoMoreData;
//        }else{
//            
//            //            [weakSelf removeAllRowsInTableNode:_models];
//            //            [_models addObjectsFromArray:[self loadNextBatchData]];//这句不需要 ASDK 会自己加载第一页
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [weakSelf.tableNode reloadData];
//            });
//        }
//    }];
//    
//    self.tableNode.view.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        
//        if(![weakSelf hasMoreData]){// 无数据显示
//            weakSelf.tableNode.view.mj_footer.state = MJRefreshStateNoMoreData;
//            NSLog(@"no more data");
//        }else{
//            [weakSelf.tableNode.view.mj_footer endRefreshing];
//        }
//        
//    }];
//
//    ASImageNode  *imageNode=[[ASImageNode alloc] init];
//    imageNode.frame=CGRectMake(35, 80, 40, 50);
//    imageNode.userInteractionEnabled=YES;
//    [imageNode addTarget:self action:@selector(clickImageNode:) forControlEvents:ASControlNodeEventTouchUpInside];
//    imageNode.placeholderColor=[UIColor greenColor];
//    imageNode.image=[UIImage imageNamed:@"morentouxiang"];
//    [self.view addSubview:imageNode.view];
//    
//    ASNetworkImageNode  *netWorkImage=[[ASNetworkImageNode alloc] init];
//    netWorkImage.frame=CGRectMake(90, 140, 60, 60);
//    netWorkImage.URL=[NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
//    netWorkImage.placeholderColor=[UIColor grayColor];
//    [self.view addSubview:netWorkImage.view];
//    
//    ASButtonNode  *buttonNode=[[ASButtonNode alloc] init];
//    [buttonNode setFrame:CGRectMake(120, 180, 200, 180)];
//    buttonNode.contentVerticalAlignment=ASVerticalAlignmentTop;
//    buttonNode.contentHorizontalAlignment=ASHorizontalAlignmentMiddle;
//
//    [buttonNode setTitle:@"123445" withFont:[UIFont systemFontOfSize:13] withColor:[UIColor redColor] forState:UIControlStateNormal];
//    [buttonNode setImage:[UIImage imageNamed:@"morentouxiang"] forState:UIControlStateNormal];
//    [self.view addSubview:buttonNode.view];
//    
//    
//    ASTextNode  *textNode=[[ASTextNode alloc] init];
//    textNode.attributedText=[[NSAttributedString alloc] initWithString:@"1235666235666235666235666235666235666235666235666235666235666"];
//    textNode.frame=CGRectMake(0, 250, 34, 34);
//    [self.view addSubview:textNode.view];
    
//    ASTableNode *tableViewNode=[[ASTableNode alloc] initWithStyle:UITableViewStyleGrouped];
//    tableViewNode.frame=self.view.frame;
//    tableViewNode.delegate=self;
//    tableViewNode.dataSource=self;
//    [self.view addSubview:tableViewNode.view];
}

- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode{
  
    return 1;
    
}
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}
- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath
{

    KittenNode   *cellnodel=[[KittenNode alloc] initWithKittenOfSize:CGSizeMake(self.view.frame.size.width, 100)];
    return cellnodel;
}

//- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
//        
//       
//    
//    };
//    
//    return cellNodeBlock;
//    
//}

#pragma mark 点击事件
- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ViewController *vc=[[ViewController alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark 判断是否请求网络数据
- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    
    return NO;
}
- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context
{
    [context beginBatchFetching];
    
}
-(void)clickImageNode:(ASImageNode *)imageNode{
    
    NSLog(@"12344");
    
    
}
-(void)click:(UIGestureRecognizer  *)sender
{
   
    //    UIButton  *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    //    [btn  setFrame:CGRectMake(70,-40, 120, 300)];
    //    [btn setBackgroundColor:[UIColor blackColor]];
    //    [self .view addSubview:btn];
    //    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    UIImageView  *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width*0.5)];
    //    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"] placeholderImage:[UIImage  imageNamed:@"1"]];
    //    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    //    imageView.userInteractionEnabled=YES;
    //    [imageView addGestureRecognizer:tap];
    //
    //    [self.view addSubview:imageView];
    //

    
//      UIView *snapView=[self.view snapshotInView:sender.view];
//      snapView.frame=sender.view.frame;
//      [[UIApplication sharedApplication].keyWindow addSubview:snapView];
//     [[YeePopCover shareManger] setBackgroundColor:[UIColor blackColor]];
//     [[YeePopCover shareManger] PopMaskView:snapView InView:nil transformanimation:^{
//        
//        [UIView animateWithDuration:0.1 animations:^{
//            
//            snapView.transform=CGAffineTransformScale(snapView.transform, 1.05, 1.05);
//            
//        } completion:^(BOOL finished)
//         {
//             snapView.transform=CGAffineTransformScale(snapView.transform, 1/1.05, 1/1.05);
//             
//             [UIView animateWithDuration:0.5 animations:^{
//                 snapView.center=[UIApplication sharedApplication].keyWindow.center;
//                 
//             }];
//         }];
//    } ClickBlock:^(UIView *maskView){
//        [[YeePopCover shareManger] setBackgroundColor:[UIColor clearColor]];
//        [UIView animateWithDuration:0.4 animations:^{
//            
//            maskView.center=sender.view.center;
//            [[UIApplication sharedApplication].keyWindow addSubview:snapView];
//            
//        } completion:^(BOOL finished) {
//            
//            [maskView removeFromSuperview];
//            
//        }];
//        
//    }];
    
    
    YeeZoomViewController  *zoomVC=[[YeeZoomViewController alloc] init];
    
    [zoomVC  showHeadPortrait:(UIImageView *)sender.view originUrl:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    [self presentViewController:zoomVC animated:YES completion:^{
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
