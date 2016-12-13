//
//  ViewController.m
//  CarouselView
//
//  Created by 梁海军 on 2016/12/13.
//  Copyright © 2016年 lhj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<LCarouselDataSource,LCarouselDataDelegate>
@property(nonatomic, strong)LCarouselView *carouselV;
@property (nonatomic, strong) NSArray *carouseMakes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _carouselV = [[LCarouselView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*0.35)];
    _carouselV.dataSource = self;
    _carouselV.delegate = self;
    _carouseMakes =@[@"http://img1.c.yinyuetai.com/others/admin/161213/0/9a27155032001ce981f9fff995ffdd75_0x0.jpg",@"http://img3.c.yinyuetai.com/others/admin/161212/0/9a47308c2f13c31fa7790097cac28d16_0x0.jpg",@"http://img3.c.yinyuetai.com/others/admin/161209/0/b7d84da50d620ceee4722e6301be397a_0x0.jpg",@"http://img4.c.yinyuetai.com/others/admin/161212/0/4a0bb90aed270122347308a66999e14f_0x0.jpg",@"http://img1.c.yinyuetai.com/others/admin/161210/0/8e516487c0d8dedc529946138ad99022_0x0.jpg"];
    _carouselV.showPageControl = YES;
    _carouselV.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:_carouselV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - LCarouselDataSource
- (NSInteger)numberOfItemsInCarouselView:(LCarouselView *)carouselView{
    return [_carouseMakes count];
}

- (NSString *)carouselView:(LCarouselView *)carouselView urlStringForItemWithIndex:(NSInteger)index{
    return _carouseMakes[index];
}
#pragma mark - LCarouselDataDelegate
- (void)carouselView:(LCarouselView *)carouselView didSelectPageWithIndex:(NSInteger)index{
    NSLog(@"index:%ld",(long)index);
}


@end
