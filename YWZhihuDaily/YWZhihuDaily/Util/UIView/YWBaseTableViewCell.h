//
//  YWBaseTableViewCell.h
//  YWBaseFrameWork
//
//  Created by NeiQuan on 16/7/6.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YWBaseTableViewCell : UITableViewCell
@property(nonatomic ,readonly) NSIndexPath            *indexPath;
@property(nonatomic ,readonly) UIView                 *lineView;//有时候需要隐藏

@end
