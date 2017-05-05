
//
//  UIViewController+ActionSheet.m
//  HappyRent
//
//  Created by CoderYee on 2017/4/27.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIViewController+ActionSheet.h"

@implementation UIViewController (ActionSheet)

-(void)showActionSheetControllerWithTitle:(NSString *)title message:(NSString *)message destructivehandler:(void (^)(void))deshandler  cancelhandler:(void (^)(void))cancelhandler{
    
   [self  showActSheeControllerWithTitle:title message:message desTitle:@"确定" cancelTitle:@"取消" destructivehandler:^{
       if (deshandler) {
           
           deshandler();
       }
   } cancelhandler:^{
       
       if (cancelhandler) {
           
           cancelhandler();
       }
   }];
}
-(void)showActSheeControllerWithTitle:(NSString *)title message:(NSString *)message desTitle:(NSString *)desTitle cancelTitle:(NSString *)cancelTitle  destructivehandler:(void (^)(void))deshandler   cancelhandler:(void (^)(void))cancelhandler{
    
    UIAlertController  *actVC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet ];
    UIAlertAction  *cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelhandler) {
            
            cancelhandler();
        }
    }];
    UIAlertAction  *destructive=[UIAlertAction actionWithTitle:desTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (deshandler) {
            
            deshandler();
        }
    }];
    [actVC addAction:cancel];
    [actVC addAction:destructive];
    [self presentViewController:actVC animated:YES completion:^{
        
    }];
}
-(void)showActSheeControllerWithTitle:(NSString *)title message:(NSString *)message desTitles:(NSArray <NSString*>*)desTitle cancelTitle:(NSString *)cancelTitle  destructivehandler:(void (^)(void))deshandler   cancelhandler:(void (^)(void))cancelhandler{
    
    
    
//    UIAlertController  *actVC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet ];
//    UIAlertAction  *cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        if (cancelhandler) {
//            
//            cancelhandler();
//        }
//    }];
//    
//
//    UIAlertAction  *destructive=[UIAlertAction actionWithTitle:desTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        if (deshandler) {
//            
//            deshandler();
//        }
//    }];
//    [actVC addAction:cancel];
//    [actVC addAction:destructive];
//    [self presentViewController:actVC animated:YES completion:^{
//        
//    }];
    
    
}


@end
