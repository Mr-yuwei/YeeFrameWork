//
//  VC_02.m
//  YeeTestDemo
//
//  Created by CoderYee on 2017/4/20.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "VC_02.h"

@interface VC_02 ()

@end

@implementation VC_02

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;

    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    UIScrollView  *scroView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 200)];
    [scroView setBackgroundColor:[UIColor redColor]];
    scroView.contentSize=CGSizeMake(self.view.frame.size.width*2.0, 0);
    [self.view addSubview:scroView];
//    
//    NSArray *gestureArray = self.navigationController.view.gestureRecognizers;
//    //当是侧滑手势的时候设置scrollview需要此手势失效才生效即可
//    for (UIGestureRecognizer *gesture in gestureArray) {
//        if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
//            [scroView.panGestureRecognizer requireGestureRecognizerToFail:gesture];
//        }
//    }
    
    
        

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
