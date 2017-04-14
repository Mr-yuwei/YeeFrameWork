//
//  YWPageDetailBottomView.h
//  YWZhihuDaily
//
//  Created by NeiQuan on 16/9/19.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YWPageDetailBottomViewdelegate <NSObject>

-(void)DetailBottomViewclickatIndex:(NSInteger)index;//点击按钮事件

@end
@interface YWPageDetailBottomView : UIView

@property(nonatomic,weak)id<YWPageDetailBottomViewdelegate>delegete;

@end
