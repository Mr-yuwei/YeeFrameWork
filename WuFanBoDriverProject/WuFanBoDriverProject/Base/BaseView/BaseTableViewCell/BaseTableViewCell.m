//
//  BaseTableViewCell.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "BaseModel.h"
@implementation BaseTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    CGFloat contentViewWidth = kMainScreenWidth;
    NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentViewWidth];
    [self.contentView addConstraint:widthFenceConstraint];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self addOwnView];
        [self bindViewModel];
    }
    return self;
}
#pragma mark 添加子视图
-(void)addOwnView
{


}
#pragma mark 绑定ViewModel
-(void)bindViewModel
{
    
}
+ (NSString *)cellIdentifier
{
    return NSStringFromClass([self class]);
}
// tableViewCell上collectionView空白部分点击事件穿透到 tablveiwcell上
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[UICollectionView class]] ) {
        return self;
    }
    return [super hitTest:point withEvent:event];
}
//便于子类快速调用子类
-(void)configTableView:(UITableView *)tableView withModel:(BaseModel*)model
{
    
    
}
-(void)configTableCellindexPath:(NSIndexPath*)indexPath{
    
    
}
@end
