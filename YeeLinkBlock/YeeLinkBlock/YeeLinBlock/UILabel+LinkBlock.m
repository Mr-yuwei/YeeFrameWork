//
//  UILabel+LinkBlock.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/11.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UILabel+LinkBlock.h"

@implementation UILabel (LinkBlock)
+(UILabel *)Init{
    
    return [[UILabel alloc] init];
}
- (UILabel * (^)(UIFont *font))yfont{
    
    return ^id(UIFont *yfont){
        self.font= yfont;
        return self;
    };
}
- (UILabel * (^)(CGRect frame))yframe{
  
    return ^id(CGRect yframe){
        self.frame= yframe;
        return self;
    };
}
- (UILabel * (^)(CGRect bounds))ybounds{
    
    return ^id(CGRect ybounds){
        self.bounds= ybounds;
        return self;
    };
}
- (UILabel * (^)(UIColor *textColor))ytextColor{
    
    return ^id(UIColor *ytextColor ){
        
        self.textColor=ytextColor;
        return self;
    };
}
- (UILabel * (^)(UIColor *backgroundColor))ybackgroundColor{
   
    return ^id(UIColor *ybackgroundColor ){
        
        self.backgroundColor=ybackgroundColor;
        
        return self;
    };
    
}
- (UILabel * (^)(NSInteger numberOfLines))ynumberOfLines{
   
    return ^id(NSInteger ynumberOfLines ){
        
        self.numberOfLines=ynumberOfLines;
        return self;
    };
}
- (UILabel * (^)(NSTextAlignment textAlignment))ytextAlignment{
    
    return ^id(NSTextAlignment  ytextAlignment){
       
        self.textAlignment=ytextAlignment;
        return self;
    };
}
- (UILabel * (^)(NSString *text))ytext{
   
    return ^id(NSString  *ytext){
        
        self.text=ytext;
        return self;
    };
}
- (UILabel * (^)(NSAttributedString *attributedText))yattributedText{
   
    return ^id(NSAttributedString  *yattributedText){
        
        self.attributedText=yattributedText;
        return self;
    };
}
- (UILabel * (^)(CGFloat cornerRadius))ycornerRadius{
   
    return ^id(CGFloat  ycornerRadius){
        
        self.layer.cornerRadius=ycornerRadius;
        self.layer.masksToBounds=YES;
        return self;
    };
}
- (UILabel * (^)(UIView *View))InView{
    
    return ^id(UIView  *InView){
        
        [InView addSubview:self];
        
        return self;
    };
    
}
@end
