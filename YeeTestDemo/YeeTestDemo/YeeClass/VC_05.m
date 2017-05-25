//
//  VC_05.m
//  YeeTestDemo
//
//  Created by CoderYee on 2017/4/21.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "VC_05.h"
#import "VC_04.h"
@interface VC_05 ()

@end

@implementation VC_05

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.delegate=self;
    self.dataSource=self;
    [self setViewControllers:@[[VC_04 new]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
        
    }];
    // Do any additional setup after loading the view.
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    return [VC_04 new];
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    return    [VC_04 new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
