//
//  VC_01.m
//  YeeTestDemo
//
//  Created by CoderYee on 2017/4/20.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "VC_01.h"
#import "VC_02.h"
#import "VC_03.h"
#import "VC_05.h"
@interface VC_01 ()
{
    
    UIView    *_blueView;
    CGFloat   angle;
    
}
@end

@implementation VC_01

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];

    UIButton  *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag=1;
    [btn1 setFrame:CGRectMake(80, 100, 60, 40)];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"VC_02" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton  *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(80, 140, 60, 40)];
    btn2.tag=2;
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"VC_03" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton  *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setFrame:CGRectMake(80, 180, 60, 40)];
    btn3.tag=3;
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitle:@"VC_05" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(250, 150, 100, 100)];
    [view setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:view];
    _blueView=view;
    
//    UIPanGestureRecognizer  *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGes:)];
//    
//    [self.view addGestureRecognizer:pan];
    
    
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        angle=angle+10;
        view.layer.transform=[self getTransForm3DWithAngle:angle];
    }];
    
}
-(void)handleGes:(UIPanGestureRecognizer *)ges{
    
    CGPoint point= [ges locationInView:self.view];
    if (ges.state==UIGestureRecognizerStateBegan) {
     
        
    }else if (ges.state==UIGestureRecognizerStateChanged)
    {
        
        
       
        
    }else if (ges.state==UIGestureRecognizerStateEnded)
    {
    
    
    }
}
-(CATransform3D)getTransForm3DWithAngle:(CGFloat)angle{
    
    CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
    
    transform.m34=4.5/-2000;//透视效果
    
    transform=CATransform3DRotate(transform,M_PI*angle/180,0,1,0);//获取旋转angle角度后的rotation矩阵。
    
    return transform;
    
}
-(void)clickEvent:(UIButton *)sender{
    
    if (sender.tag==1) {
      
        VC_02  *vc=[VC_02 new];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];

    }else if (sender.tag==2){
        
        VC_03  *vc=[VC_03 new];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];

        
    }else{
        
        
        VC_05  *vc=[VC_05 new];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    
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
