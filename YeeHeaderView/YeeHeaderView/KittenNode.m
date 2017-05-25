//
//  KittenNode.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/5/22.
//  Copyright © 2017年 CoderYee. All rights reserved.
//  ASTableNode练习尝试

#import "KittenNode.h"

static const CGFloat kImageSize = 80.0f;
static const CGFloat kOuterPadding = 16.0f;
static const CGFloat kInnerPadding = 10.0f;

@interface KittenNode ()
{
    CGSize _kittenSize;
    
    ASNetworkImageNode *_imageNode; //网络图片
    ASTextNode *_textNode;
    ASDisplayNode *_divider;
    BOOL _isImageEnlarged;
    BOOL _swappedTextAndImage;
}
@end

@implementation KittenNode

- (instancetype)initWithKittenOfSize:(CGSize)size{
   
    if (self=[super init]) {
       
        _kittenSize = size;
     //   self.backgroundColor=[UIColor redColor];
        _imageNode = [[ASNetworkImageNode alloc] init];
        _imageNode.URL = [NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/1893883-f42d7dc00862bf11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
        _imageNode.placeholderFadeDuration = .5;
        _imageNode.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
        _imageNode.contentMode = UIViewContentModeCenter;
        [self addSubnode:_imageNode];
        
        // lorem ipsum text, plus some nice styling
        _textNode = [[ASTextNode alloc] init];
        _textNode.attributedText = [[NSAttributedString alloc] initWithString:@"12344"];
        [self addSubnode:_textNode];
        
        // hairline cell separator
        _divider = [[ASDisplayNode alloc] init];
        _divider.backgroundColor = [UIColor lightGrayColor];
        [self addSubnode:_divider];
        

    }
    
    return self;
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    // Set an intrinsic size for the image node
    CGSize imageSize = _isImageEnlarged ? CGSizeMake(2.0 * kImageSize, 2.0 * kImageSize) : CGSizeMake(kImageSize, kImageSize);
    _imageNode.style.preferredSize = imageSize;
    
    // Shrink the text node in case the image + text gonna be too wide
    _textNode.style.flexShrink = 1.0;
    
    // Configure stack
    ASStackLayoutSpec *stackLayoutSpec =
    [ASStackLayoutSpec
     stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
     spacing:kInnerPadding
     justifyContent:ASStackLayoutJustifyContentStart
     alignItems:ASStackLayoutAlignItemsStart
     children:_swappedTextAndImage ? @[_textNode, _imageNode] : @[_imageNode, _textNode]];
    
    // Add inset
    return [ASInsetLayoutSpec
            insetLayoutSpecWithInsets:UIEdgeInsetsMake(kOuterPadding, kOuterPadding, kOuterPadding, kOuterPadding)
            child:stackLayoutSpec];
}
- (void)toggleImageEnlargement{
    
    
    
}


@end
