//
//  HomeVC.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/12.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "HomeVC.h"
#import "Home_ViewModel.h"
#import "Home_Detial_ViewModel.h"


@interface HomeVC ()

@property (nonatomic, strong)Home_ViewModel  *viewModel;
@end

@implementation HomeVC

@dynamic viewModel;
-(void)addNavbarView{
    
    [super addNavbarView];
}
-(void)configOwnViews{
    
    [super configOwnViews];
}
-(void)addOwnViews{
    
    [super  addOwnViews];
}
//需要子类从写 --
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.textColor=kBlackColor;
    cell.textLabel.text=@"yeeOS";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.viewModel.services pushViewModel:[[Home_Detial_ViewModel alloc] initWithServices:self.viewModel.services params:nil] animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
@end
