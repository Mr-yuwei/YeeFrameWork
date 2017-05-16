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
    
    RACCommand *testCommand=[[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
      return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
          
          [subscriber sendNext:@(1)];
          [subscriber sendCompleted];
          return [RACDisposable disposableWithBlock:^{
          //信号取消
          }];
        }];
    }];
    
    [testCommand.executing subscribeNext:^(NSNumber *execut) {
      
        
    }];
    
    [[[testCommand execute:@1] takeUntil:self.rac_willDeallocSignal ]subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"23344");
    } completed:^{
        
    }];
    
    
//
//    [[testCommand.executionSignals switchToLatest ]subscribeNext:^(id  _Nullable x) {
//      
//        NSLog(@"1233");
//        
//    } completed:^{
//        
//    }];
//    
   [testCommand execute:@(3)];
//    
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//       
//         [testCommand execute:@(2)];
//    });
   
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
