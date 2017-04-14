//
//  YWPageTextImageTableViewCell.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWPageTextImageTableViewCell.h"
#import "YWcommonHeader.h"
#import "YWPageModel.h"
#import "YWLeftModel.h"
@interface YWPageTextImageTableViewCell()
{
    UILabel           *_titleLable;
    UIImageView       *_rightIamgeView;
}
@end
@implementation YWPageTextImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self addSubViews];//添加子视图
    }
    return self;
}
-(void)addSubViews
{
    _rightIamgeView=[[UIImageView alloc] init];
    [self.contentView addSubview:_rightIamgeView];
    [_rightIamgeView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15.0f];
    [_rightIamgeView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10.0f];
    [_rightIamgeView autoSetDimensionsToSize:CGSizeMake(70, 60)];
    [_rightIamgeView setImage:[UIImage imageNamed:@"Homescreen_Icon"]];
    
    _titleLable=[[UILabel alloc] init];
    [self.contentView addSubview:_titleLable];
    [_titleLable autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_rightIamgeView];
    [_titleLable autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15.0f];
    [_titleLable autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    _titleLable.numberOfLines=0;
    _titleLable.text=@"yuweiweiwuueuweuueuruuruwuruwueruwreuuwreuwueuue";
    
}
-(void)setThememodel:(YWLeftthemeStoriesModel *)thememodel
{
    _thememodel=thememodel;
    [_rightIamgeView sd_setImageWithURL:[NSURL URLWithString:thememodel.images[0]]];
    _titleLable.text=[NSString stringWithFormat:@"%@",thememodel.title];
}
#pragma mark --set方法
-(void)setModel:(YWPageModel *)model
{
    _model=model;
    [_rightIamgeView sd_setImageWithURL:[NSURL URLWithString:model.images[0]]];
    _titleLable.text=[NSString stringWithFormat:@"%@",model.title];
}
@end
