//
//  MineVC.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/24.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "MineVC.h"
#import "MineHeaderView.h"
#import "UIButton+CodeCount.h"
@interface MineVC ()
{
    MineHeaderView *m_pHeaderView;
}
@end

@implementation MineVC

-(void)addOwnViews
{
    [super addOwnViews];
    
    [self addHeaderView];
}
-(void)addHeaderView{
    
    m_pHeaderView=[[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenWidth*0.5)];
    self.tableView.tableHeaderView=m_pHeaderView;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(50, 200, 45, 34)];

    [self.view addSubview:btn];
    [btn  countdowntimeout:60 originalTitle:@"123" timingTitle:@"234"];

}

@end
