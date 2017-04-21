//
//  ViewController.m
//  YeeLinkBlock
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "ViewController.h"
#import "YeeLinkBlockHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self  addOwnViews];
    
//    struct Block_layout {
//        void *isa;
//        int flags;
//        int reserved;
//        void (*invoke)(void *, ...);
//        struct Block_descriptor *descriptor;
//        /* Imported variables. */
//    };
//    
//    struct Block_descriptor {
//        unsigned long int reserved;
//        unsigned long int size;
//        void (*copy)(void *dst, void *src);
//        void (*dispose)(void *);
//    };
    
    
   // Block_copy(<#...#>)
}

-(void)addOwnViews{
  
     UILabel  *lable=YLable.ytext(@"123455").yframe(CGRectMake(15, 30, 90, 45));
     [lable showInView:self.view];
    
    UITextField  *textField=YTextField.yplaceholder(@"1234555").yframe(CGRectMake(0, 80, 100, 44)).yborderStyle(UITextBorderStyleRoundedRect);
    [textField showInView:self.view];

    
    /*
     
   
     
     后台接口  1 用户第三方登陆绑定手机号 2 用户注册 3用户修改密码 4 忘记密码

     
     
     */
    
    
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
