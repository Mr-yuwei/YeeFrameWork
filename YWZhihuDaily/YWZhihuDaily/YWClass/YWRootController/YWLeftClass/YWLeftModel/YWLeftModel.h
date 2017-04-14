//
//  YWLeftModel.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/20.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWBaseModel.h"

@interface YWLeftModel : YWBaseModel

@property(nonatomic,copy)NSString    *color;
@property(nonatomic,copy)NSString    *thumbnail;
@property(nonatomic,copy)NSString    *descriptions;
@property(nonatomic,copy)NSString    *id;
@property(nonatomic,copy)NSString    *name;

@end

@interface YWLeftthemeListModel : YWBaseModel

@property(nonatomic,copy)NSString    *background;
@property(nonatomic,copy)NSString    *color;
@property(nonatomic,copy)NSString    *descriptions;
@property(nonatomic,copy)NSString    *name;
@property(nonatomic,copy)NSString    *image_source;
@property(nonatomic,copy)NSString    *image;
@property(nonatomic,retain)NSArray    *editors;
@property(nonatomic,retain)NSArray    *stories;
@end

@interface YWLeftthemeStoriesModel : YWBaseModel
@property(nonatomic,copy)NSString        *id;
@property(nonatomic,retain)NSArray       *images;
@property(nonatomic,copy)NSString        *title;
@property(nonatomic,retain)NSNumber      *type;

@end


@interface YWLeftthemeeditorsModel : YWBaseModel
@property(nonatomic,copy)NSString     *avatar;
@property(nonatomic,copy)NSString     *bio;
@property(nonatomic,copy)NSString     *name;
@property(nonatomic,copy)NSString     *id;
@property(nonatomic,copy)NSString     *url;


@end



