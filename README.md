# CarouselView
###效果图：





![image](https://github.com/ovOSign/CarouselView/blob/master/images/GifMakerProject8.gif)



###代码设计：

######使用三张UIImageView实现两张以上的图片轮播
######对图片路径队列的动态排序，实现无限循环切换功能
######采用SDWebImage实现图片下载




###部分代码：
```objective-c
//向左滑动
-(void)changeImagePageWithLeftSrcoll{
    if (self.urlNumber == 2){
        [_carouselUrls removeLastObject];
        CarouselUrl *lastTwoUrl = [_carouselUrls lastObject];
        [_carouselUrls insertObject:lastTwoUrl atIndex:0];
        
    }else{
        CarouselUrl *endUrl = [_carouselUrls lastObject];
        [_carouselUrls removeObject:endUrl];
        [_carouselUrls insertObject:endUrl atIndex:0];
        
    }
    [self setImageToImageViews];
}

//向右滑动
-(void)changeImagePageWithRightSrcoll{
    if (self.urlNumber == 2){
        [_carouselUrls removeObjectAtIndex:0];
        CarouselUrl *secondUrl = [_carouselUrls firstObject];
        [_carouselUrls addObject:secondUrl];
    }else{
       CarouselUrl *firstUrl = [_carouselUrls firstObject];
       [_carouselUrls removeObject:firstUrl];
       [_carouselUrls addObject:firstUrl];
    }
    [self setImageToImageViews];
}
//点击选择
-(void)changeImagePageWithRightTap:(NSInteger)index{
    if (self.urlNumber ==2 ) {
        if (self.currentPageIndex<index){
            [_carouselUrls removeObjectAtIndex:0];
            CarouselUrl *secondUrl = [_carouselUrls firstObject];
            [_carouselUrls addObject:secondUrl];
        }else{
            [_carouselUrls removeLastObject];
            CarouselUrl *lastTwoUrl = [_carouselUrls lastObject];
            [_carouselUrls insertObject:lastTwoUrl atIndex:0];
        }
        [self setImageToImageViews];
        return;
    }
    if ((self.currentPageIndex - index) == 1) {
        CarouselUrl *endUrl = [_carouselUrls lastObject];
        [_carouselUrls removeObject:endUrl];
        [_carouselUrls insertObject:endUrl atIndex:0];
        [self setImageToImageViews];
    }else{
        NSInteger tapIndex = 0;
        if (self.currentPageIndex<index) {
            tapIndex = index-self.currentPageIndex+1;
        }else{
            tapIndex = [_carouselUrls count] - (self.currentPageIndex-index-1);
        }
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < tapIndex-1; i ++) {
            CarouselUrl* url = [_carouselUrls objectAtIndex:i];
            [array addObject:url];
        }
        [_carouselUrls removeObjectsInArray:array];
        [_carouselUrls addObjectsFromArray:array];
        [self setImageToImageViews];
    }
}

-(void)setImageToImageViews{
    for (UIImageView *view in self.views) {
        NSInteger index = view.tag;
        CarouselUrl* url = [_carouselUrls objectAtIndex:index];
        if (index == 1){
         self.currentPageIndex = url.index;
         if (_pageControl) _pageControl.currentPage = url.index;
        }
       [view sd_setImageWithURL:[NSURL URLWithString:url.url]];
    }
}
```
















