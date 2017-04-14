//
//  YWCommentTableViewCell.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/22.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWCommentTableViewCell.h"
#import "YWcommonHeader.h"
#import "YWCommentModel.h"
@interface YWCommentTableViewCell()
{
    
    UIImageView    *_headerImage;
    UILabel        *_nameLable;
    UIButton       *_likebutton;
    UILabel        *_contentLable;
    UILabel        *_dateLable;//时间
    
}
@end
@implementation YWCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self addSubViews];
    }
    return self;
}
#pragma mark --添加子视图
-(void)addSubViews
{
    UIImageView *headerIamge=[[UIImageView alloc] init];
    [self.contentView addSubview:headerIamge];
    [headerIamge autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.0f];
    [headerIamge autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10.0f];
    [headerIamge autoSetDimension:ALDimensionWidth toSize:30.0f];
    [headerIamge autoSetDimension:ALDimensionHeight toSize:30.0f];
    headerIamge.layer.masksToBounds=YES;
    headerIamge.layer.cornerRadius=15.0f;
    [headerIamge setImage:[UIImage imageNamed:@"Comment_Avatar"]];
    
    UIButton *likebutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:likebutton];
    
    [likebutton autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10.0f];
    [likebutton  autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.0f];
    [likebutton autoSetDimension:ALDimensionWidth toSize:60];
    [likebutton autoSetDimension:ALDimensionHeight toSize:30];
    [likebutton setImage:[UIImage imageNamed:@"Comment_Vote"] forState:UIControlStateNormal];
    [likebutton setTitleColor:kGrayColor forState:UIControlStateNormal];
    [likebutton setTitle:@"0" forState:UIControlStateNormal];
    likebutton.titleLabel.font=SystemFont(10);
    UILabel *nameLable=[[UILabel alloc] init];
    [self.contentView addSubview:nameLable];
    
    [nameLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:headerIamge withOffset:5.0f];
    [nameLable autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft  ofView:likebutton withOffset:5.0];
    [nameLable autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15.0f];
    nameLable.font=SystemFont(14);
    nameLable.text=@"Mr-yuwei";
    
    UILabel *dateLable=[[UILabel alloc] init];
    [self.contentView addSubview:dateLable];
    
    [dateLable autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [dateLable autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:40];
    [dateLable autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
    [dateLable autoSetDimension:ALDimensionHeight toSize:21.0f];
    dateLable.text=@"2016/9/14";
    dateLable.font=SystemFont(10);
    dateLable.textColor=kGrayColor;
    
    UILabel *contentlable=[[UILabel alloc] init];
    [self.contentView addSubview:contentlable];
    
    [contentlable autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:headerIamge withOffset:-5.0];
    [contentlable autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:dateLable withOffset:5.0];
    [contentlable autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:40];
    [contentlable autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
    
    
    contentlable.text=@"123`123`124`124`124`124`1241ewrwqerqwerertewrtywerywer235";
    contentlable.numberOfLines=0;
    contentlable.font=SystemFont(13);
    contentlable.textColor=kGrayColor;
    
    
    _headerImage=headerIamge;
    _nameLable=nameLable;
    _likebutton=likebutton;
    _dateLable=dateLable;
    _contentLable=contentlable;
}
#pragma mark -set方法
-(void)setCommentModel:(YWCommentModel *)commentModel
{
    _commentModel=commentModel;
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:commentModel.avatar]];
    _nameLable.text=commentModel.author;
    _contentLable.text=commentModel.content;
    [_likebutton setTitle:commentModel.likes forState:UIControlStateNormal];
    _dateLable.text=commentModel.time;
}
@end
