//
//  UITextField+LinkBlock.m
//  YeeLinkBlock
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UITextField+LinkBlock.h"

@implementation UITextField (LinkBlock)

- (UITextField * (^)(UIFont *font))yfont{
    
    return ^id(UIFont *yfont){
        self.font= yfont;
        return self;
    };
}
- (UITextField * (^)(CGRect frame))yframe{
    return ^id(CGRect yframe){
        self.frame= yframe;
        return self;
    };
}
- (UITextField * (^)(CGRect bounds))ybounds{
    return ^id(CGRect  ybounds){
      self.bounds=ybounds;
      return  self;
    };
}
- (UITextField * (^)(UIColor *textColor))ytextColor{
    
    return ^id(UIColor *ytextColor ){
        
        self.textColor=ytextColor;
        return self;
    };
}
- (UITextField * (^)(UIColor *backgroundColor))ybackgroundColor{
   
    return ^id(UIColor *ybackgroundColor ){
        
        self.backgroundColor=ybackgroundColor;
        return self;
    };
    
}
- (UITextField * (^)(NSTextAlignment textAlignment))ytextAlignment{
  
    return ^id(NSTextAlignment  ytextAlignment){
        
        self.textAlignment=ytextAlignment;
        return self;
    };
}
- (UITextField * (^)(NSString *text))ytext{
    
    return ^id(NSString  *ytext){
        
        self.text=ytext;
        return self;
    };
}
- (UITextField * (^)(NSString *yplaceholder))yplaceholder{
    
    return ^id(NSString  *yplaceholder){
        
        self.placeholder=yplaceholder;
        return self;
    };
}
- (UITextField * (^)(NSAttributedString *attributedText))yattributedText{
    
    return ^id(NSAttributedString  *yattributedText){
        
        self.attributedText=yattributedText;
        return self;
    };
}
- (UITextField * (^)(NSAttributedString *attributedPlaceholder))yattributedPlaceholder{
    
    return ^id(NSAttributedString  *yattributedPlaceholder){
        
        self.attributedPlaceholder=yattributedPlaceholder;
        return self;
    };
}

- (UITextField * (^)(UITextBorderStyle borderStyle))yborderStyle{
    
    return ^id(UITextBorderStyle  yborderStyle){
        
        self.borderStyle= yborderStyle;
        
        return self;
    };
    
}

//leftView rightView

- (UITextField * (^)(UIView  *leftView))yleftView{
    
    return ^id(UIView *yleftView){
        
        self.leftView= yleftView;
        self.leftViewMode=UITextFieldViewModeAlways;
        return self;
    };
}

- (UITextField * (^)(UIView  *rightView))yrightView{
    
    return ^id(UIView *yrightView){
        
        self.rightView= yrightView;
        self.rightViewMode=UITextFieldViewModeAlways;
        return self;
    };
}

- (UITextField * (^)(UITextFieldViewMode  leftViewMode))yleftViewMode{
    
    return ^id(UITextFieldViewMode yleftViewMode){
        
        self.leftViewMode=yleftViewMode;
        return self;
    };
}
- (UITextField * (^)(UITextFieldViewMode  rightViewMode))yrightViewMode{
    
    return ^id(UITextFieldViewMode yrightViewMode){
        self.rightViewMode=yrightViewMode;
        return self;
    };
}
@end
