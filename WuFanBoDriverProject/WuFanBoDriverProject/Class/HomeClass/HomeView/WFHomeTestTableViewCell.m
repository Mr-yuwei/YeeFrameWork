//
//  WFHomeTestTableViewCell.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/10/8.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "WFHomeTestTableViewCell.h"

@implementation WFHomeTestTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
}
-(void)addOwnView{
    
    [super addOwnView];
    
    UIImageView *userImageView=[[UIImageView alloc] init];
    [userImageView sd_setImageWithURL:[NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/6961097-77bc0857d7ace5d9.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"]];
    [self.contentView addSubview:userImageView];
    
    UILabel *textLable=[[UILabel alloc] init]; textLable.text=@"ergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejhwergwjhgejwhgejwhgejwhgejwhgejhw";
    textLable.numberOfLines=0;
    [self.contentView addSubview:textLable];
    
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(5);
        make.height.width.mas_equalTo(60);
    }];
    [textLable mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(0);
        make.top.equalTo(userImageView.mas_bottom).offset(5);
    }];
    
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
