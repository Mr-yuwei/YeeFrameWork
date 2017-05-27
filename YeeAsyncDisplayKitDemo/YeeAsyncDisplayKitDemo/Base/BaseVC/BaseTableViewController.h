//
//  BaseTableViewController.h
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/27.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface BaseTableViewController : ASViewController<UIViewControllerProtocol>

@property(nonatomic,retain)ASTableNode     *tableNode;

@property(nonatomic,retain)NSMutableArray  *listArray;

@property(nonatomic,assign)BOOL            hasMoreData;//用于判断是否有更多数据


@end
