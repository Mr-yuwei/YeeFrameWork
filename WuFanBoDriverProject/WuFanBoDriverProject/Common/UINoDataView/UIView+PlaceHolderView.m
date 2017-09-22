//
//  UIView+PlaceHolderView.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/19.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "UIView+PlaceHolderView.h"
#include <objc/runtime.h>
const NSString  *UIView_PlaceHolder=@"UIView_PlaceHolder";
@implementation UIView (PlaceHolderView)

-(void)setPlaceHolderView:(UIView *)placeHolderView{
    
  objc_setAssociatedObject(self, &UIView_PlaceHolder, placeHolderView, OBJC_ASSOCIATION_RETAIN);

}
-(UIView *)placeHolderView{
    
    return objc_getAssociatedObject(self, &UIView_PlaceHolder);
}
@end
