//
//  BaseViewController.h
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseViewController : UIViewController
//子类添加控件
- (void)addOwnViews;
//子类控件属性值配置
- (void)configOwnViews;
//添加导航栏设置
- (void)addNavbarView;
//RAC绑定事件
- (void)bindViewModel;
//判断当前是否有网络
- (BOOL)isNetReachable;
//为每个VC封装一套数据请求，简化代码
-(void)requestDataWithUrlString:(NSString *)urlString
              parameters:(NSDictionary*)parameters
            SuccessBlock:(void(^)(NSDictionary*dic))successBlock;



@end
