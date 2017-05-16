//
//  BaseTableViewCell.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/16.
//  Copyright © 2017年 CodeYee. All rights reserved.
//  简化子类创建cell

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

-(void)addOwnView;

-(void)layoutOwnView;

-(void)bindViewModel;

+ (NSString *)cellIdentifier;

-(void)configTableView:(UITableView *)tableView withModel:(BaseModel*)model;

-(void)configTableCellindexPath:(NSIndexPath*)indexPath;


@end
