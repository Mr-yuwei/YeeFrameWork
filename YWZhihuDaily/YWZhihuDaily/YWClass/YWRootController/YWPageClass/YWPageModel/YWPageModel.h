//
//  YWPageModel.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWBaseModel.h"

@interface YWPageModel : YWBaseModel

@property(nonatomic,copy)NSString     *ga_prefix;
@property(nonatomic,copy)NSString     *id;
@property(nonatomic,copy)NSString     *image;
@property(nonatomic,retain)NSArray    *images;
@property(nonatomic,copy)NSString     *title;
@property(nonatomic,copy)NSString     *type;

@end

//详情id
@interface YWPagedetailModel : YWBaseModel

@property (nonatomic,copy  ) NSString *body;
@property (nonatomic,copy  ) NSString *image_source;//图片来源
@property (nonatomic,copy  ) NSString *title;
@property (nonatomic,copy  ) NSString *image;
@property (nonatomic,copy  ) NSString *share_url;//分享url
@property (nonatomic,retain) NSArray  *images;
@property (nonatomic,copy  ) NSString *id;
@property (nonatomic,retain) NSArray  *css;

@end
