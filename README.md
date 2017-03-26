
#### 一个简单的头像查看过渡动画
```
主要方法
- (nullable UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0);
```
```
思路：
1.获取点击的TouchView视图,执行snapshotViewAfterScreenUpdates将snapView添加到目标视图self.view上。
2. snapView视图消失复原
```

![2017-03-26 17_30_09.gif](http://upload-images.jianshu.io/upload_images/1488651-8137dc8ef777cfb0.gif?imageMogr2/auto-orient/strip)

实现部分：

```
-(UIView *)snapshotInView:(UIView *)inView{
UIView *snapshot = [inView snapshotViewAfterScreenUpdates:YES];
snapshot.layer.masksToBounds = YES;
snapshot.layer.cornerRadius = 0.0;
snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
snapshot.layer.shadowRadius = 5.0;
snapshot.layer.shadowOpacity = 0.4;
return snapshot;
}
```
```
UIView *snapView=[self.view snapshotInView:sender.view];
snapView.frame=sender.view.frame;
[[UIApplication sharedApplication].keyWindow addSubview:snapView];
[[YeePopCover shareManger] setBackgroundColor:[UIColor blackColor]];
[[YeePopCover shareManger] PopMaskView:snapView InView:nil transformanimation:^{

[UIView animateWithDuration:0.1 animations:^{

snapView.transform=CGAffineTransformScale(snapView.transform, 1.05, 1.05);

} completion:^(BOOL finished)
{
snapView.transform=CGAffineTransformScale(snapView.transform, 1/1.05, 1/1.05);

[UIView animateWithDuration:0.5 animations:^{
snapView.center=[UIApplication sharedApplication].keyWindow.center;

}];
}];
} ClickBlock:^(UIView *maskView){//点击遮罩，视图复原
[[YeePopCover shareManger] setBackgroundColor:[UIColor clearColor]];
[UIView animateWithDuration:0.4 animations:^{

maskView.center=sender.view.center;
[[UIApplication sharedApplication].keyWindow addSubview:snapView];

} completion:^(BOOL finished) {
[maskView removeFromSuperview];
}];
}];
```



#### YeePopCover
前言：最近的项目上有各种提示栏，背景都需要一个黑色遮罩图，之前太懒都是在需要用的时候在当前视图添加个Button,代码冗余太多.这周末花了一点时间写了一个。
效果图如下:
![Simulator Screen Shot 2017年3月19日 下午6.17.25.png](http://upload-images.jianshu.io/upload_images/1488651-2b4c1c5221849c01.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)


下面直接上代码:
```
/*
maskView:显示的视图
InView:  一般是window
animations:可以对显示视图添加动画效果
clickBlock ：点击移除遮罩回调
*/
-(void)PopMaskView:(UIView *)maskView InView:(UIView *)InView  animations:(void (^)(void))animations  ClickBlock:(YeeCoverClick) clickBlock;
```
```
//移除遮罩/视图
-(void)removeCover;
```
```
//使用方法
UIView  *maskView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
[maskView setBackgroundColor:[UIColor redColor]];

[[YeePopCover shareManger] PopMaskView:maskView InView:self.view animations:^{
[maskView addBaseSpringAnimationType:YeeFromTopType Duration:0.8 completion:^(BOOL finished)
{

}];
} ClickBlock:^{
//点击回调
}];
```


[动画效果：snapshotViewAfterScreenUpdates的使用](http://www.jianshu.com/p/7cdabe568830)

联系我：13137880636@163.com
