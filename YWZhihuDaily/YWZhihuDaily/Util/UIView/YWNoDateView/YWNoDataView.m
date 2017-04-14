//
//  YWNoDataView.m
//  NoDataView
//
//  Created by NeiQuan on 16/7/1.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "YWNoDataView.h"

#define LLSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define LLImageWithNamed(name) [UIImage imageNamed:name]

#define LLDescriptionFontSize 14.f
#define LLDescriptionHeight 80.f
#define LLDescriptionTopSpace 10.f
#define LLColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface YWNoDataView()
{
    UIImageView *_imageView;
    YWLabel *_tipLabel;
    
}
@end
@implementation YWNoDataView

- (instancetype)initNoDataWithFrame:(CGRect)frame YWNoDataType:(YWNoDataViewType)type description:(NSString *)description canTouch:(BOOL)isCanTouch
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImage *iconImage;
        if (type==YWNoInternet)
        {
          iconImage = LLImageWithNamed(@"network_xinhao_");
        }else
        {
         iconImage = LLImageWithNamed(@"no_data_katong_");
            
        }
        _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-iconImage.size.width*0.5, frame.size.height*0.5-iconImage.size.height, iconImage.size.width, iconImage.size.height)];
        _imageView.image = iconImage;
        [self addSubview:_imageView];
        
        YWLabel *tipLabel = [[YWLabel alloc] initWithFrame:CGRectMake(10, _imageView.center.y+iconImage.size.height*0.5+LLDescriptionTopSpace, LLSCREEN_WIDTH-20, LLDescriptionHeight)];
        tipLabel.textColor = LLColorFromRGB(0x999999);
        tipLabel.font = [UIFont systemFontOfSize:LLDescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.llverticalAlignment = YWVerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
        _tipLabel = tipLabel;
        if (isCanTouch)
        {
            UIButton *btnTouchView = [[UIButton alloc] initWithFrame:frame];
            [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];
        }
        
    }
    return self;
}
- (instancetype)initImageNameWithFrame:(CGRect)frame imageName:(NSString *)imageName description:(NSString *)description canTouch:(BOOL)isCanTouch
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImage *iconImage = LLImageWithNamed(imageName);
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-iconImage.size.width*0.5, frame.size.height*0.5-iconImage.size.height, iconImage.size.width, iconImage.size.height)];
        _imageView.image = iconImage;
        [self addSubview:_imageView];
        YWLabel *tipLabel = [[YWLabel alloc] initWithFrame:CGRectMake(10, _imageView.center.y+iconImage.size.height*0.5+LLDescriptionTopSpace-20, LLSCREEN_WIDTH, LLDescriptionHeight)];
        tipLabel.textColor = LLColorFromRGB(0x999999);
        tipLabel.font = [UIFont systemFontOfSize:LLDescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.llverticalAlignment = YWVerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
        _tipLabel = tipLabel;
           if (isCanTouch)
           {
            UIButton *btnTouchView = [[UIButton alloc] initWithFrame:frame];
            [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];
          }
    }
    return self;
}
- (instancetype)initReloadBtnWithFrame:(CGRect)frame YWNoDataViewType:(YWNoDataViewType)type reloadBtnSel:(SEL)btnSelname reloadBtnweakTarget:(id)weakTarget description:(NSString *)description reloadBtnTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *iconImage;
        if (type == YWNoInternet) {
            iconImage =    LLImageWithNamed(@"no_data_katong_");
        }
        
        if (type == YWNoData)
        {
            iconImage = LLImageWithNamed(@"network_xinhao_");
        }
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-iconImage.size.width*0.5, frame.size.height*0.5-iconImage.size.height, iconImage.size.width, iconImage.size.height)];
        imageView.image = iconImage;
        
        
        [self addSubview:imageView];
        
        
        CGSize tipLabelSize = [self sizeWithString:description font:[UIFont systemFontOfSize:LLDescriptionFontSize] constrainedToWidth:LLSCREEN_WIDTH-20];
        YWLabel *tipLabel = [[YWLabel alloc] initWithFrame:CGRectMake(10, imageView.center.y+iconImage.size.height*0.5+LLDescriptionTopSpace, LLSCREEN_WIDTH-20, tipLabelSize.height)];
        tipLabel.textColor = LLColorFromRGB(0x999999);
        tipLabel.font = [UIFont systemFontOfSize:LLDescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.llverticalAlignment = YWVerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
         _tipLabel = tipLabel;
        
        if (title && title.length>0) {
            CGSize btnSize = [self sizeWithString:title font:[UIFont systemFontOfSize:LLDescriptionFontSize] constrainedToWidth:LLSCREEN_WIDTH];
            CGFloat btnWidth = btnSize.width + 30;
            UIButton *btnTouchView = [[UIButton alloc] initWithFrame:CGRectMake(LLSCREEN_WIDTH*0.5 - btnWidth*0.5, tipLabel.center.y + LLDescriptionHeight * 0.5, btnWidth, btnSize.height+20)];
            btnTouchView.layer.borderColor = LLColorFromRGB(0x999999).CGColor;
            btnTouchView.layer.borderWidth = 0.5;
            btnTouchView.layer.cornerRadius = (btnSize.height+20) * 0.5;
            btnTouchView.titleLabel.font = [UIFont systemFontOfSize:LLDescriptionFontSize];
            [btnTouchView setTitleColor:LLColorFromRGB(0x999999) forState:UIControlStateNormal];
            [btnTouchView setTitle:title forState:UIControlStateNormal];
            [btnTouchView addTarget:weakTarget action:btnSelname forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];
        }
    }
    return self;
}
#pragma mark - 计算文本
- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 5000
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        options:(NSStringDrawingUsesLineFragmentOrigin |
                                                 NSStringDrawingTruncatesLastVisibleLine)
                                     attributes:attributes
                                        context:nil].size;
    } else {
        textSize = [string sizeWithFont:textFont
                      constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                          lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:(NSStringDrawingUsesLineFragmentOrigin |
                                             NSStringDrawingTruncatesLastVisibleLine)
                                 attributes:attributes
                                    context:nil].size;
#endif
    
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

//空数据View的点击响应协议
- (void)windowTouchAction{
   
    
}
@end
@implementation YWLabel
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
      self.llverticalAlignment = YWVerticalAlignmentMiddle;
    }
    return self;
}

- (void)setLlverticalAlignment:(YWVerticalAlignment)llverticalAlignment{
    
    _llverticalAlignment = llverticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.llverticalAlignment)
    {
        case YWVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case YWVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case YWVerticalAlignmentMiddle:
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end