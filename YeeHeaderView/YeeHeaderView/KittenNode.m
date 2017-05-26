//
//  KittenNode.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/5/22.
//  Copyright © 2017年 CoderYee. All rights reserved.
//  ASTableNode练习尝试

#import "KittenNode.h"
@interface KittenNode ()
{
    ASNetworkImageNode  *_imageNode;
    ASTextNode          *_titlNodel;
    ASTextNode          *_priceNodel;
    ASDisplayNode       *_lineNode;//分割线
}
@end
@implementation KittenNode

- (instancetype)initWithKittenOfSize:(CGSize)size{
   
    if (self=[super init]) {
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [self addOwnView];
    }
    return self;
}
-(void)addOwnView{
    
    _imageNode=[[ASNetworkImageNode alloc] init];
    _imageNode.URL=[NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    _imageNode.placeholderColor=[UIColor  grayColor];
    
    _titlNodel=[[ASTextNode alloc] init];
    
    _titlNodel.attributedText=[[NSAttributedString alloc] initWithString:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"];
    _priceNodel=[[ASTextNode alloc] init];
   
    _priceNodel.attributedText=[[NSAttributedString alloc] initWithString:@"100"];
    _lineNode=[[ASDisplayNode alloc] init];
    _lineNode.backgroundColor=[UIColor grayColor];
    [self addSubnode:_imageNode];
    [self addSubnode:_titlNodel];
    [self addSubnode:_priceNodel];
    [self addSubnode:_lineNode];
    
}
//设置布局
-(ASLayoutSpec*)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    _imageNode.style.preferredSize=CGSizeMake(80, 80);
    _titlNodel.style.flexShrink=YES;
    _titlNodel.layerBacked = YES;
    
    _priceNodel.style.preferredSize=CGSizeMake(100, 21);
    _priceNodel.layerBacked = YES;
    _priceNodel.style.flexShrink=YES;
    _priceNodel.maximumNumberOfLines = 1;
    
  
    ASStackLayoutSpec *hpri=[ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_priceNodel]];
    
    
    ASStackLayoutSpec   *verLayoutSpec=[ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStart children:@[_titlNodel,hpri]];
    ASStackLayoutSpec  *hLayoutSpec=[ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_imageNode,verLayoutSpec]];
    
    return  [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 5, 5, 5) child:hLayoutSpec];
    
}
@end
