//
//  BaseViewController.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewControllerProtocolHeader.h"
@class YViewModel;
@interface BaseViewController : UIViewController<BaseViewControllerProtocol>


//ViewModel
@property (nonatomic, strong, readonly) YViewModel *viewModel;

- (instancetype)initWithViewModel:(YViewModel *)viewModel;

@end
