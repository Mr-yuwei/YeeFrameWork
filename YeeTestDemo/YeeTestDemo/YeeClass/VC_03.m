//
//  VC_03.m
//  YeeTestDemo
//
//  Created by CoderYee on 2017/4/21.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "VC_03.h"
#import "VC_04.h"
#import "XRCommonSegMentView.h"
@interface VC_03 ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,XRCommonSegMentViewdelegate >
{
  
    UIScrollView       *_contentView;
    
    XRCommonSegMentView *_segmentView;
    
    NSInteger          _selectedIndex;
}
@end

@implementation VC_03

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.navigationController.interactivePopGestureRecognizer.delegate=self;
    
    _segmentView=[[XRCommonSegMentView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) titleArray:@[@"test01",@"test02",@"test03",@"test04"]];
    _segmentView.delegate=self;
    [self.view addSubview:_segmentView];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _contentView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 44+64, self.view.frame.size.width, self.view.frame.size.height-108)];
    _contentView.pagingEnabled=YES;
    _contentView.bounces=NO;
    _contentView.delegate=self;
    for (NSInteger i=0; i<4; i++) {
        
        VC_04 *vc=[VC_04 new];
        [vc.view setFrame:CGRectMake(CGRectGetWidth(self.view.frame)*i, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(_contentView.frame))];
        [_contentView addSubview:vc.view];
        [self addChildViewController:vc];
    }
    
    [_contentView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame)*4, 0)];
    [self.view addSubview:_contentView];
    
    
    
    
    __block UIScrollView *scrollView = nil;
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIScrollView class]])
        {
            scrollView = (UIScrollView *)obj;
        }
    }];
    if(scrollView)
    {
        NSArray *gestureArray = self.navigationController.view.gestureRecognizers;
        for (UIGestureRecognizer *gesture in gestureArray) {
            if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
                [scrollView.panGestureRecognizer requireGestureRecognizerToFail:gesture];
            }
        }
    }

    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger selected=scrollView.contentOffset.x/self.view.frame.size.width;
    
    _selectedIndex=selected;
    
    [_segmentView setLineViewFrameWithClickIndex:selected];
    
}
-(void)XRCommonSegMentView:(XRCommonSegMentView *) segmentView ClickatIndex:(NSInteger)index{
    
    _selectedIndex=index;
    
    [_contentView setContentOffset:CGPointMake(_selectedIndex*self.view.frame.size.width, 0) animated:YES];

    
}
//- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
//{
//    
//    return  _selectedIndex==0;
//}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    
//    return  _selectedIndex==0 ;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
