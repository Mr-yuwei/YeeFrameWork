//
//  main.m
//  YeeLinkBlock
//
//  Created by CoderYee on 2017/4/14.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
//int global_i = 1;
//
//static int static_global_j = 2;
//
//int main(int argc, const char * argv[]) {
//    
//    static int static_k = 3;
//    int val = 4;
//    
//    void (^myBlock)(void) = ^{
//        global_i ++;
//        static_global_j ++;
//        static_k ++;
//        NSLog(@"Block中 global_i = %d,static_global_j = %d,static_k = %d,val = %d",global_i,static_global_j,static_k,val);
//    };
//    
//    global_i ++; //2
//    static_global_j ++; //2
//    static_k ++;  //4
//    val ++;   //5
//    NSLog(@"Block外 global_i = %d,static_global_j = %d,static_k = %d,val = %d",global_i,static_global_j,static_k,val);
//    
//    myBlock();
//    
//    return 0;
//}
//
//
//int global_i = 1;
//static int static_global_j = 2;
//
//int main(int argc, const char * argv[]) {
//    
//    static int static_k = 3;
//    
//    void (^myBlock)(void) = ^{
//        NSLog(@"Block中 变量 = %d %d %d",static_global_j ,static_k, global_i);
//    };
//    
//    NSLog(@"%@",myBlock);
//    
//    myBlock();
//    
//    return 0;
//}
