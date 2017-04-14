//
//  YWPageTextImageTableViewCell.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YWPageModel,YWLeftthemeStoriesModel;
@interface YWPageTextImageTableViewCell : UITableViewCell

@property(nonatomic,retain)YWPageModel *model;
@property(nonatomic,retain)YWLeftthemeStoriesModel *thememodel;
@end
