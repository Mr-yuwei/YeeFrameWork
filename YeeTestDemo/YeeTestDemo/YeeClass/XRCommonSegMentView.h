//
//  XRCommonSegMentView.h
//  XClassRoom
//
//  Created by NeiQuan on 16/11/11.
//  Copyright © 2016年 Mr-yuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XRCommonSegMentView;

@protocol XRCommonSegMentViewdelegate <NSObject>

-(void)XRCommonSegMentView:(XRCommonSegMentView *) segmentView ClickatIndex:(NSInteger)index;

@end

@interface XRCommonSegMentView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

- (void)setLineViewFrameWithClickIndex:(NSInteger)index;

@property(nonatomic,weak)id<XRCommonSegMentViewdelegate>delegate;

@end
