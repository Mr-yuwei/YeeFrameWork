//
//  YWCommentModel.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/22.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import "YWBaseModel.h"

@interface YWCommentModel : YWBaseModel
@property(nonatomic,copy)NSString     *author;//作者
@property(nonatomic,copy)NSString     *avatar;
@property(nonatomic,copy)NSString     *content;
@property(nonatomic,copy)NSString     *id;
@property(nonatomic,copy)NSString     *likes;
@property(nonatomic,copy)NSString     *time;
@end
