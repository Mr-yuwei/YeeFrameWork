//
//  YeeSegmentController.h
//  HappyRent
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YeeSegmentConfig : NSObject

@property(nonatomic,retain)UIColor *normalColor;

@property(nonatomic,retain)UIColor *SelectedColor;

@property(nonatomic,retain)UIFont   *font;

@property(nonatomic,retain)UIColor  *backColor;

@property(nonatomic,assign)CGFloat  *height;



@end

@protocol YeeSegmentControllerdelegate <NSObject>


@optional

-(void)shouldSuperCanpop:(BOOL )canpop;


@end

@interface YeeSegmentController : UIViewController

@property (nonatomic, strong) UIColor *segementTintColor;

@property (nonatomic, strong) UIScrollView *segementView;

@property(nonatomic,weak)id<YeeSegmentControllerdelegate>delegate;


+ (instancetype)segementControllerWithFrame:(CGRect)frame titles:(NSArray <NSString *>*)titles controllers:(NSArray <UIViewController *>*)viewControllers;

- (NSInteger)selectedAtIndex;

- (void)selectedAtIndex:(void(^)(NSInteger index))indexBlock;

- (void)setSelectedItemAtIndex:(NSInteger)index;

@end
