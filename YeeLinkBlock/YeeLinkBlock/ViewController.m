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
    
}

-(void)addOwnViews{
  
     UILabel  *lable=YLable.ytext(@"123455").yframe(CGRectMake(15, 30, 90, 45));
     [lable showInView:self.view];
    
    UITextField  *textField=YTextField.yplaceholder(@"1234555").yframe(CGRectMake(0, 80, 100, 44));
    [textField showInView:self.view];

    
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
