//
//  UITextPlaceHolderView.h
//  YWBaseFrameWork
//
//  Created by 余伟 on 2017/1/12.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
//带有展位字符串的UITextView
@interface UITextPlaceHolderView : UITextView

@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,copy) NSString *placeholderColor;
@property (nonatomic,copy) NSString *placeholderFont;

@end
