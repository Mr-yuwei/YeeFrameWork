//
//  BaseTableViewCell.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseModel,BaseTableViewCell;
typedef NS_ENUM(NSInteger,TableClickEvent)
{
    TableClickEventValue1 = 0,
    TableClickEventValue2,
    TableClickEventValue3,
    TableClickEventValue4,
    TableClickEventValue5,
    TableClickEventValue6,
    TableClickEventValue7,
    TableClickEventValue8,
    TableClickEventValue9,
    TableClickEventValue10,
};
@protocol BaseTableViewCelldelegate <NSObject>

@optional

-(void)clickTableView:(BaseTableViewCell*)tableCell withEventType:(TableClickEvent)eventValue;

-(void)clickTableView:(BaseTableViewCell*)tableCell withtouchView:(UIView *)touchView    EventType:(TableClickEvent)eventValue;

-(void)clickTableView:(BaseTableViewCell*)tableCell withtouchView:(UIView *)touchView    EventType:(TableClickEvent)eventValue value:(id)value;
@end

@interface BaseTableViewCell : UITableViewCell

@property(nonatomic,weak)id<BaseTableViewCelldelegate>delegate;

-(void)addOwnView;

-(void)bindViewModel;

+ (NSString *)cellIdentifier;

-(void)configTableView:(UITableView *)tableView withModel:(BaseModel*)model;

-(void)configTableCellindexPath:(NSIndexPath*)indexPath;


@end
