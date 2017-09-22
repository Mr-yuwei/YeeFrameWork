//
//  UIViewController+NODataError.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/22.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UIViewController+NODataError.h"

@interface UIViewController()<UINoNetWorkViewdelegate>
{
    
    
}
@end
@implementation UIViewController (NODataError)
-(void)setNoDataView{
    
    UINoDataView *noDataView= [[UINoDataView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:noDataView];
    [self.view setPlaceHolderView:noDataView];
    
}
-(void)setNoNetWorkView{
    
    UINoNetWorkView *noNetWorkView= [[UINoNetWorkView alloc] initWithFrame:self.view.bounds];
    noNetWorkView.delegate=self;
    [self.view addSubview:noNetWorkView];
    [self.view setPlaceHolderView:noNetWorkView];
    
}

@end
