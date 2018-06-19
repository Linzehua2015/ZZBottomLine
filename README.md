# ZZBottomLine
顶部分类切换效果
# 效果如下

![Demo](https://upload-images.jianshu.io/upload_images/2083012-25db4cafefd488b5.gif?imageMogr2/auto-orient/strip)

# 使用方法

```
    // 添加bottomView
    [self.segCollectionView zz_addBottomLineWithScrollView:self.scrollView];
```

# 实现思路

1、使用分类的写法简化调用方法。

2、使用KVO去监听内容collectionView的contentOffset，根据其变化让横线“动起来”。

3、动画的基础参数设置通过运行时机制动态给分类加上成员变量。

# 结构

![相关成员变量](https://upload-images.jianshu.io/upload_images/2083012-6548e99a1f1d365b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/800)


其实我觉得这鬼东西没什么好解释的，直接去git下载代码看下就懂了。
在导入文件后跑起来如果有因为objc_runtime 报错，解决方法如下：

![objc_runtime](https://upload-images.jianshu.io/upload_images/2083012-056a6a0ad02fe53c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/800)

喜欢的话点个赞吧，觉得哪边写得不好也跟我说下谢谢。
