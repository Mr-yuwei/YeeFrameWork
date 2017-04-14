//
//  YWNoDataView.h
//  NoDataView
//
//  Created by NeiQuan on 16/7/1.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    YWVerticalAlignmentTop = 0, // default
    YWVerticalAlignmentMiddle,
    YWVerticalAlignmentBottom,
} YWVerticalAlignment;

typedef enum
{
    YWNoInternet = 0, // default
    YWNoData,
    
} YWNoDataViewType;

@protocol YWNoDataViewdelegate <NSObject>



@end



@interface YWNoDataView : UIView
/**
 *  @param frame       视图的大小
 *  @param type      1.YWNoInternet 没有网络 2.YWNoData没有数据
 *  @param description 描述信息
 *  @param isCanTouch   点击视图是否重新加载
 *
 *  @return  self
 */
- (instancetype)initNoDataWithFrame:(CGRect)frame
                       YWNoDataType:(YWNoDataViewType)type
                        description:(NSString *)description
                           canTouch:(BOOL)isCanTouch;
/**
 *  @param frame       视图的大小
 *  @param imageName   图片的名称
 *  @param description 描述信息
 *  @param isCanTouch  是否支持点击视图重新加载
 *  @return  self
 */
- (instancetype)initImageNameWithFrame:(CGRect)frame
                             imageName:(NSString *)imageName
                          description:(NSString *)description
                             canTouch:(BOOL)isCanTouch;
/**
 *  重新加载视图
 *  @param frame       视图大小
 *  @param type        类别
 *  @param description 描述信息
 *  @param title       标题/点击按钮重新加载
 *  @return self
 */
- (instancetype)initReloadBtnWithFrame:(CGRect)frame
                     YWNoDataViewType:(YWNoDataViewType)type
                          reloadBtnSel:(SEL)btnSelname
                   reloadBtnweakTarget:(id)weakTarget
                          description:(NSString *)description
                       reloadBtnTitle:(NSString *)title;

@end

@interface YWLabel : UILabel

@property (assign, nonatomic) YWVerticalAlignment llverticalAlignment;

@end
