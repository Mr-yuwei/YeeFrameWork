//
//  UIView+snapView.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/24.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "UIView+snapView.h"

@implementation UIView (snapView)
-(UIView *)snapshotInView:(UIView *)inView{
    
    UIView *snapshot = [inView snapshotViewAfterScreenUpdates:YES];
    snapshot.layer.masksToBounds = YES;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    return snapshot;
}
@end
