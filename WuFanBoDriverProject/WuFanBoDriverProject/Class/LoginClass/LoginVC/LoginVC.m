//
//  LoginVC.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/14.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "LoginVC.h"
#import "WFLoginView.h"
@interface LoginVC ()
{
    WFLoginView  *m_pLoginView;
}
@end

@implementation LoginVC

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

}
-(void)addOwnViews{
    
    [super addOwnViews];
    m_pLoginView=[[WFLoginView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:m_pLoginView];
}



@end
