//
//  BaseTableViewController+Refresh.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//
//add Refresh Block

#import "BaseTableViewController.h"

@interface BaseTableViewController (Refresh)

// header Refresh Block
-(void)tablePullupHeaderRefresh:(void (^)(void))headerBlock;

// footView Refresh Block
-(void)tablePullDownFootRefresh:(void (^)(void))footerBlock;

//stop Refresh 
-(void)tableViewEndRefresh;

@end
