//
//  UITextPlaceHolderView.m
//  YWBaseFrameWork
//
//  Created by 余伟 on 2017/1/12.
//  Copyright © 2017年 NeiQuan. All rights reserved.
//

#import "UITextPlaceHolderView.h"

@interface UITextPlaceHolderView ()

@property (nonatomic,weak) UILabel *placeholderLabel;


@end

@implementation UITextPlaceHolderView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        //设置一个字体大小的默认值
        self.font = [UIFont systemFontOfSize:14];
        
        //初始化占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        //设置占位label的文字颜色
        placeholderLabel.textColor = [UIColor grayColor];
        placeholderLabel.text=@"请输入内容";
        //换行
        placeholderLabel.numberOfLines = 0;
        
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        self.placeholderLabel.font = self.font;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        //设置一个字体大小的默认值
        self.font = [UIFont systemFontOfSize:14];
        
        //初始化占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        //设置占位label的文字颜色
        placeholderLabel.textColor = [UIColor grayColor];
        //换行
        placeholderLabel.numberOfLines = 0;
        
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        self.placeholderLabel.font = self.font;
        
        self.placeholderLabel.text=self.placeholder;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //设置一个字体大小的默认值
        self.font = [UIFont systemFontOfSize:14];
        
        //初始化占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        //设置占位label的文字颜色
        placeholderLabel.textColor = [UIColor grayColor];
        //换行
        placeholderLabel.numberOfLines = 0;
        
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        self.placeholderLabel.font = self.font;
        
        self.placeholderLabel.text=self.placeholder;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置占位文字的x与y
    self.placeholderLabel.mj_x = 5;
    self.placeholderLabel.mj_y = 8;
    //设置大小
    //指定最大的宽度
    CGSize constrainedSize = CGSizeMake(self.mj_w , MAXFLOAT);
    self.placeholderLabel.mj_size =[self.placeholderLabel.text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesDeviceMetrics|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
}
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
    
}
/**
 *  重写setFont方法,以便在设置当前TextView的时候,去设置占位文字的label字体大小
 */
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = font;
}

-(void)setText:(NSString *)tex
{
    if (tex.length>0) {
        self.placeholderLabel.hidden=YES;
    }
    [super setText:tex];
}
- (void)textViewDidChange:(NSNotification *)noti
{
    if (self.text.length == 0)
    {
        [self setTextColor:[UIColor blackColor]];
    }
    self.placeholderLabel.hidden = self.text.length;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
