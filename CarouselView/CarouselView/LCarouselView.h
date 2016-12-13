//
//  CarouselView.h
//  LMForum
//
//  Created by 梁海军 on 2016/12/12.
//  Copyright © 2016年 lhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCarouselDataSource;

@protocol LCarouselDataDelegate;

@interface LCarouselView : UIView

@property(nonatomic,weak) id<LCarouselDataSource> dataSource;

@property(nonatomic,weak) id<LCarouselDataDelegate> delegate;

@property(nonatomic)BOOL showPageControl;

@property(nonatomic,strong)UIColor *pageIndicatorTintColor;
@property(nonatomic,strong)UIColor *currentPageIndicatorTintColor;

-(void)next;
-(void)reloadData;

@end

@protocol LCarouselDataSource<NSObject>

- (NSInteger)numberOfItemsInCarouselView:(LCarouselView *)carouselView;

- (NSString *)carouselView:(LCarouselView *)carouselView urlStringForItemWithIndex:(NSInteger)index;

@end

@protocol LCarouselDataDelegate <NSObject>

- (void)carouselView:(LCarouselView *)carouselView didSelectPageWithIndex:(NSInteger)index;

@end
