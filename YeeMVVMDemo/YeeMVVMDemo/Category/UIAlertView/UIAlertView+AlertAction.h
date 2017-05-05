//
//  UIAlertView+AlertAction.h
//  YWBaseFrameWork
//
//  Created by CoderYee on 2017/2/12.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AlertCallBack)(UIAlertView *, NSUInteger);
@interface UIAlertView (AlertAction)<UIAlertViewDelegate>

@property (nonatomic, copy) AlertCallBack callBack;


@end
