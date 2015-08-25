//
//  IntroViewController.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "IntroView.h"
#import "Constant.h"
//#import "MainViewController.h"
#import "MMPageControl.h"

#define TOTAL_PAGE (4)

@interface IntroView () <UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scroll;
@property (nonatomic,strong) MMPageControl *pageControl;

@end

@implementation IntroView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createIntroView];
    }
    return self;
}

- (void)createIntroView
{
//    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
//    {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }

    // Do any additional setup after loading the view from its nib.
    _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scroll.bounces = NO;
    [_scroll setPagingEnabled:YES];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.delegate = self;
    [self addSubview:_scroll];
    

    for (int i = 0; i < TOTAL_PAGE; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"welcome%d.png", i + 1]]];
        imageView.frame = CGRectOffset(self.bounds, self.bounds.size.width * i, 0);

        [_scroll addSubview:imageView];
    }
    [_scroll setContentSize:CGSizeMake(TOTAL_PAGE * self.bounds.size.width,
                                      self.bounds.size.height)];

    //start btn
    float btn_width = 200.0f;
    float btn_height = 44.0f;
    float screen_width = self.bounds.size.width;
    float screen_height = self.bounds.size.height;
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startButton setBackgroundImage:[UIImage imageNamed:@"btn_start.png"]
                           forState:UIControlStateNormal];
    [startButton setTitle:@"立即体验" forState:UIControlStateNormal];
    startButton.frame = CGRectMake(screen_width * 3 + (screen_width - btn_width) / 2, screen_height - btn_height - 70, btn_width, btn_height);
    [startButton addTarget:self.delegate action:@selector(onDoneButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [_scroll addSubview:startButton];


    _pageControl = [[MMPageControl alloc] initWithFrame:
                    CGRectMake(0, screen_height - btn_height - 30, self.frame.size.width, 50)];
    _pageControl.activeImage = [UIImage imageNamed:@"img_dot_after.png"];
    _pageControl.inactiveImage = [UIImage imageNamed:@"img_dot_normal.png"];
    _pageControl.dotGap = 20;
    _pageControl.numberOfPages = TOTAL_PAGE;
    _pageControl.currentPage = 0;
    [self addSubview:_pageControl];
}

#pragma mark UIScrollViewDelegate -

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
}

#pragma mark public -

- (void)showinView:(UIView*)view
{
    [UIView animateWithDuration:1.0f animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [view addSubview:self];
    }];
}

@end