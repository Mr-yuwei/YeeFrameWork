//
//  BaseViewController.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong, readwrite) YViewModel *viewModel;

@end

@implementation BaseViewController

- (BaseViewController *)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        
        self.viewModel = viewModel;
    }
    return self;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addNavbarView];
    [self addOwnViews];
    [self configOwnViews];
    [self bindViewModel];
}
-(void)addNavbarView{
    
    
}
-(void)addOwnViews{
    
    
}
-(void)configOwnViews{
    
    [self.view setBackgroundColor:kBackgroundColor];
    
}
//RAC绑定事件
-(void)bindViewModel{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
