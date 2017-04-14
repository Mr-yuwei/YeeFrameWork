//
//  YWBaseTableViewCell.m
//  YWBaseFrameWork
//
//  Created by NeiQuan on 16/7/6.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "YWBaseTableViewCell.h"
@interface YWBaseTableViewCell()

@end
@implementation YWBaseTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
   
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //横线
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(0, self.contentView.frame.size.height-1, self.contentView.frame.size.width, 1);
        _lineView.backgroundColor = [UIColor colorWithWhite:0.685 alpha:1.000];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:_lineView];
    }
    return self;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
  
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
