//
//  BidgeViewController.m
//  YeeTestDemo
//
//  Created by Yee on 2017/7/6.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BidgeViewController.h"
#import "UIView+YeeBridge.h"

@interface BidgeViewController ()

@end

@implementation BidgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(60, 100, 200, 60)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [blueView  makeBridge:200];
    [self.view addSubview:blueView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
