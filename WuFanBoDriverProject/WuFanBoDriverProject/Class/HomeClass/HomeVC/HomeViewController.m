//
//  HomeViewController.m
//  WuFanBoDriverProject
//
//  Created by Yee on 2017/9/21.
//  Copyright © 2017年 WuFanBao. All rights reserved.
//

#import "HomeViewController.h"
#import <ARKit/ARKit.h>
@interface HomeViewController ()

@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tablePullupHeaderRefresh:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self tableViewEndRefresh];//结束刷新
            
            [self  setNoNetWorkView];
            
        });
    }];
    [self tablePullDownFootRefresh:^{
        
        [self tableViewEndRefresh];//结束刷新
        
    }];
    
  
    
    
   // ARSession
    // Do any additional setup after loading the view.
}
-(void)configOwnViews{
    
    [super configOwnViews];
    if (@available(iOS 11.0, *)) { //这里需要判断屏幕的尺寸大小-->而不是
//        [self.tableView setFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44)];
         //self.navigationController.navigationBar.prefersLargeTitles=YES;
    } else {
        //  [self.tableView setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self showSuccessMessage:@"请求成功请求成功请求成功!"];
    
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
