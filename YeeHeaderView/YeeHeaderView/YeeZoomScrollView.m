//
//  YeeZoomScrollView.m
//  YeeHeaderView
//
//  Created by CoderYee on 2017/3/27.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "YeeZoomScrollView.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "DACircularProgressView.h"
@interface YeeZoomScrollView ()<UIScrollViewDelegate>
{
    UIImageView                   *_ImageView;
    NSString                      *_imageUrl;
    UIImage                       *_placeImage;
}
@end
@implementation YeeZoomScrollView

-(instancetype)initWithFrame:(CGRect)frame withImageUrlString:(NSString *)Urlstring{
    
    if (self=[super initWithFrame:frame]) {
    
        _imageUrl=Urlstring;
        [self configureView];
        [self  addOwnView];
    }
    
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame withImageUrlString:(NSString *)Urlstring placeImage:(UIImage *)image{
    if (self=[super initWithFrame:frame]) {
        
        _imageUrl=Urlstring;
        _placeImage=image;
        [self configureView];
        [self  addOwnView];
    }
    return self;
    
}
-(void)configureView{
    
    self.backgroundColor = [UIColor blackColor];
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.minimumZoomScale = 1.0f;
    self.maximumZoomScale = 3.0f;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.directionalLockEnabled = YES;
    self.delegate = self;
    //添加单击取消事件
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(CancelReviewImage)];
    [self addGestureRecognizer:singleTap];
    //添加双击事件
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomInOrOut:)];
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
    //约束单击和双击不能同时生效
    [singleTap requireGestureRecognizerToFail:doubleTap];
    //添加长按保存图片事件
    UILongPressGestureRecognizer *pSaveImage = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(SaveImageToAlbum:)];
    [self addGestureRecognizer:pSaveImage];

}
-(void)addOwnView{
    
    _ImageView=[[UIImageView alloc] initWithFrame:self.bounds];
    _ImageView.contentMode=UIViewContentModeScaleAspectFit;
    _ImageView.clipsToBounds=YES;
    [self addSubview:_ImageView];
    
    
    
//    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self animated:YES];
//    hud.mode=MBProgressHUDModeAnnularDeterminate;
    
//    MBRoundProgressView  *goundView=[[MBRoundProgressView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    goundView.center=self.center;
//    [self addSubview:goundView];
    
    
    DACircularProgressView  *ProgressView=[[DACircularProgressView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    ProgressView.center=self.center;
    [self addSubview:ProgressView];
    
    ProgressView.trackTintColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    ProgressView.progressTintColor = [UIColor whiteColor];
    ProgressView.thicknessRatio = 1.0f;
    //ProgressView.clockwiseProgress = NO;
//    ProgressView.roundedCorners = YES;
//   ProgressView.trackTintColor = [UIColor clearColor];
//    ProgressView.innerTintColor=[UIColor whiteColor];
//    
//    ProgressView.trackTintColor=[UIColor clearColor];

    [_ImageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:_imageUrl] placeholderImage:_placeImage options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        [ProgressView setProgress:receivedSize/expectedSize*1.0 animated:YES];
        
        //[goundView setProgress:receivedSize/expectedSize*1.0];
       // hud.progress=receivedSize/expectedSize*1.0;
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [ProgressView removeFromSuperview];
        //[hud hideAnimated:NO];
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }];
}

- (void)setFrame:(CGRect)frame
{
    CGRect fScreenBounds = [[UIScreen mainScreen] bounds];
    CGRect fFrame = CGRectMake(frame.origin.x, frame.origin.y, fScreenBounds.size.width, fScreenBounds.size.height);
    [super setFrame:fFrame];
}

- (void)RestoreViewScale
{
    if (self.zoomScale != 1.0f)
    {
        [self setZoomScale:1.0f animated:NO];
    }
}
#pragma mark -- UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _ImageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)layoutSubviews {
    // Super
    [super layoutSubviews];
    
    // Center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = _ImageView.frame;
    
    // Horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = floorf((boundsSize.width - frameToCenter.size.width) / 2.0);
    } else {
        frameToCenter.origin.x = 0;
    }
    
    // Vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = floorf((boundsSize.height - frameToCenter.size.height) / 2.0);
    } else {
        frameToCenter.origin.y = 0;
    }
    
    // Center
    if (!CGRectEqualToRect(_ImageView.frame, frameToCenter))
        _ImageView.frame = frameToCenter;
    
}

#pragma mark -- long press gesture method
- (void)SaveImageToAlbum:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
//        UIActionSheet *pActionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存图片到相册", nil];
//        [pActionSheet showInView:self];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex)
    {
        //保存图片到相册
        UIImageWriteToSavedPhotosAlbum(_ImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
//    if (error != NULL){
//        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//        NSString *appName = [infoDictionary objectForKey:@"CFBundleName"];
//        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"保存图片被阻止了" message:[NSString stringWithFormat:@"请到系统->“设置”->“隐私”->“照片”中开启“%@”访问权限",appName] delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
//        [alertView show];
//    } else {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"已保存至照片库"delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil] ;
//        [alertView show];
//    }
    
}

#pragma mark -- single tap gesture method
- (void)CancelReviewImage
{
    if (_clickBlock&&_ImageView) {
        
        _clickBlock(_ImageView);
    }

}

#pragma mark -- double tap gesture method
- (void)zoomInOrOut:(UITapGestureRecognizer *)tapGesture
{
    CGPoint touchPoint=[ tapGesture locationInView:_ImageView];
    if (self.zoomScale != self.minimumZoomScale) {
        // Zoom out
        [self setZoomScale:self.minimumZoomScale animated:YES];
    } else {
       
            // Zoom in to twice the size
            CGFloat newZoomScale = ((self.maximumZoomScale + self.minimumZoomScale) / 1.5);
            CGFloat xsize = self.bounds.size.width / newZoomScale;
            CGFloat ysize = self.bounds.size.height / newZoomScale;
          [self zoomToRect:CGRectMake(touchPoint.x - xsize/2, touchPoint.y - ysize/2, xsize, ysize) animated:YES];
    }
    
}
@end
