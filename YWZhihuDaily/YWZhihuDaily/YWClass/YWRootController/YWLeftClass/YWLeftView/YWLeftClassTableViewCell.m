//
//  YWLeftClassTableViewCell.m
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/18.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWLeftClassTableViewCell.h"
#import "YWcommonHeader.h"
#import "YWLeftModel.h"
@interface YWLeftClassTableViewCell()
{
    UILabel          *_titleLable;
    UIScrollView     *_scrollView;
    
}
@end


@implementation YWLeftClassTableViewCell

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
        [self addSubViews];//添加子标题
    }
    
    return self;
}
-(void)addSubViews
{
    UILabel *lable=[[UILabel alloc] init];
    [self.contentView addSubview:lable];
    
    [lable autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [lable autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15.0f];
    lable.textColor=kGrayColor;
    lable.font=SystemFont(12);
    lable.text=@"主编";
    
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    [self.contentView addSubview:scrollView];
    [scrollView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:15.0f];
    [scrollView  autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:lable withOffset:15.0];
    [scrollView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [scrollView autoSetDimension:ALDimensionHeight toSize:30];
    scrollView.multipleTouchEnabled=NO;
    scrollView.userInteractionEnabled=NO;
    [scrollView touchesShouldCancelInContentView:self];
    _scrollView=scrollView;
}
-(void)setListArray:(NSArray *)listArray
{
    _listArray=listArray;
    
    for (NSInteger  indexM=0; indexM<listArray.count; indexM++)
    {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(indexM*(30+5), 0, 30, 30)];
        imageView.layer.masksToBounds=YES;
        imageView.layer.cornerRadius=15.0f;
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds=YES;
        YWLeftthemeeditorsModel *model=_listArray[indexM];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
        [_scrollView addSubview:imageView];
    }
    [_scrollView setContentSize:CGSizeMake(35*_listArray.count, 0)];
}
@end
