//
//  GuideObject.h
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,GuideViewStyle){
   GuideViewNoneStyle,//have no other view , only one focusView
   GuideViewTopStyle,
   GuideViewBottomStyle,
   GuideViewLeftStyle,
   GuideViewRightStyle,
};
@interface GuideObject : NSObject

@property(nonatomic,weak)  UIView       *targetView;     //targetView
@property(nonatomic,assign)CGRect       targetViewFrame; //targetViewFrame
@property(nonatomic,assign)UIEdgeInsets targetViewInset; //targetViewInset
@property(nonatomic,copy)  NSString    *describeLableString;   //targetViewInset
@property(nonatomic,retain)UIColor     *describeLableColor;        //targetViewInset
@property(nonatomic,retain)UIFont      *describeLableFont;        //targetViewInset


@property(nonatomic,copy)  NSString *buttonTitle;               // buttonTitle
@property(nonatomic,copy)  NSString *buttonTitleColor;               // buttonTitle
@property(nonatomic,copy)  NSString *buttonbackImageName;               // buttonTitle

@end
