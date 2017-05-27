//
//  UITableViewProtocol.h
//  YeeAsyncDisplayKitDemo
//
//  Created by CoderYee on 2017/5/26.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UITableViewProtocol <NSObject>

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
