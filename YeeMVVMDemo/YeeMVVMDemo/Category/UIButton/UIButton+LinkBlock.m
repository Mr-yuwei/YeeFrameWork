//
//  UIButton+LinkBlock.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/11.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIButton+LinkBlock.h"

@implementation UIButton (LinkBlock)
//定时器
+ (void)countdownButton:(UIButton *)btn timeout:(int)second originalTitle:(NSString *)title timingTitle:(NSString *)timingTitle
{
    __block int timeout = second; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                [btn setTitle:title forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            
            if (seconds == 0)
            {
                seconds = 60;
            }
            NSString *strTime = [NSString stringWithFormat:@"%.d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                btn.titleLabel.font =  [UIFont systemFontOfSize:13];
                [btn setTitle:[NSString stringWithFormat:@"%@秒%@",strTime,timingTitle] forState:UIControlStateNormal];
                btn.userInteractionEnabled = NO;
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}


@end
