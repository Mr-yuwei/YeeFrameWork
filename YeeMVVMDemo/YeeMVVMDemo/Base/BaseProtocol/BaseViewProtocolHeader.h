//
//  BaseViewProtocolHeader.h
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/5.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#ifndef BaseViewProtocolHeader_h
#define BaseViewProtocolHeader_h

@protocol BaseViewProtocol <NSObject>

@optional

-(void)addOwnView;

-(void)bindViewModel;

@end


#endif /* BaseViewProtocolHeader_h */
