# MCButtonDemo
## 前言
>在平时的开发中我们经常会碰到图片配合文字的情况（如下图），而控件UIButton默认是左图右字，如果想实现下面的效果我们就要进行一些处理
![样式展示](http://upload-images.jianshu.io/upload_images/1828346-865f5c26823ccece.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## UIButton扩展
这里主要用到了两个属性
```
@property(nonatomic) UIEdgeInsets titleEdgeInsets; // default is UIEdgeInsetsZero  
@property(nonatomic) UIEdgeInsets imageEdgeInsets; // default is UIEdgeInsetsZero
```
原理详解参考[调整UIButton的title和image详解](https://www.jianshu.com/p/fb20bce230d9?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)
## 问题总结
* 问题1，文字展示不全显示...，图片偶现不居中bug
在实现过程中碰到了一点问题,就是如果按钮的大小不能按左图右字的样式(默认样式)，完全显示图片和文字，文字会显示...，这个时候布局展示也会出现问题
这里在扩展中做了如下处理
```
//计算字体的大小，如果titleLabel的宽度小于字体的宽度，则是没显示全，给label宽度赋值
CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
if (labWidth < frameSize.width) {
        labWidth = frameSize.width;
 }
```

* Masonry布局处理
依然适用，在写完布局代码后调用即可
```
    UIButton *btn4 = [[UIButton alloc] init];
    [btn4 setImage:[UIImage imageNamed:@"tab_me"] forState:UIControlStateNormal];
    [btn4 setTitle:@"首页" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn4];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(60);
        make.left.offset(50);
        make.top.mas_equalTo(btn3.mas_bottom).offset(20);
    }];
    [btn4 layoutWithStatus:MCLayoutStatusImageBottom andMargin:3];
```

* 按钮点击部分无效
最大的可能就是button元素的frame超出了button的frame，button的frame设大一点即可解决，
更多可能原因可参考[iOS UIButton 点击无响应的解决办法](https://www.jianshu.com/p/7a35d6c25bfe)

* 间距不是太准确
间距会有些偏差，大概零点几，具体原因还没找到，如果你知道，望告知

如果对你有用的话，请给个star✨
