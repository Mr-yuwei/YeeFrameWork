//
//  VC_006.m
//  YeeTestDemo
//
//  Created by Yee on 2017/7/4.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "VC_006.h"

@interface VC_006 ()
{
   
    UIImageView  *_orginImageView;
    
    UIImageView  *_topImageView;
    
    UIImageView  *_bottomImageView;
    
    CGFloat    topImageAngle;
    CGFloat    bottomImageAngle;
    
    
    
}
@end

@implementation VC_006

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    topImageAngle=-90;
    bottomImageAngle=90;
    
    [self addOwnView];

}
-(void)addOwnView{
    
    _orginImageView=[[UIImageView alloc] init];
    [_orginImageView setImage:[UIImage imageNamed:@"hejinli_zhezhi_quan"]];
    [_orginImageView setFrame:CGRectMake(100, 90, 200, 300)];
    //[self.view addSubview:_orginImageView];
    
    UIGraphicsBeginImageContext(_orginImageView.frame.size);
    [_orginImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage  *viewimage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _topImageView=[[UIImageView alloc] init];
    _topImageView.image=viewimage;
    _topImageView.layer.contentsRect=CGRectMake(0, 0, 1.0, 0.5);
    _topImageView.layer.anchorPoint=CGPointMake(0.5, 1.0);
    
    [_topImageView setFrame:CGRectMake(100, 90, 200, 150)];
    
    [self.view addSubview:_topImageView];
    
    _bottomImageView=[[UIImageView alloc] init];
    _bottomImageView.image=viewimage;
    _bottomImageView.layer.contentsRect=CGRectMake(0, 0.5, 1, 0.5);
    _bottomImageView.layer.anchorPoint=CGPointMake(0.5, 0.0);
    
    [_bottomImageView setFrame:CGRectMake(100, 240, 200, 150)];
    
    [self.view addSubview:_bottomImageView];
    
   
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (topImageAngle==0) {
            
            [timer invalidate];
            return ;
        }
        _topImageView.layer.transform=[self  translateWithAngle:topImageAngle];
        
        topImageAngle=topImageAngle+2;
        
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (bottomImageAngle==0) {
            
            [timer invalidate];
            return ;
        }
        _bottomImageView.layer.transform=[self  translateWithAngle:bottomImageAngle];
        
        bottomImageAngle=bottomImageAngle-2;
        
    }];
    
    

}

-(CATransform3D )translateWithAngle:(CGFloat )angle{
    
    

    CATransform3D transform3D = CATransform3DIdentity;
    
    // 设置立体效果
    transform3D.m34 = -1 / 1000.0;
    
    // 计算折叠角度，因为需要逆时针旋转，所以取反
//    CGFloat angle = -transP.y / 200.0 * M_PI;
    
    return CATransform3DRotate(transform3D, angle/200*M_PI, 1, 0, 0);
    
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
