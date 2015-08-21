//
//  IntroViewController.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "IntroViewController.h"
#import "Constant.h"
#import "MainViewController.h"
#import "MMPageControl.h"

#define TOTAL_PAGE (4)

@interface IntroViewController ()

@property (nonatomic,strong) UIScrollView *scroll;
@property (nonatomic,strong) MMPageControl *pageControl;

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    // Do any additional setup after loading the view from its nib.
    _scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scroll.bounces = NO;
    [_scroll setPagingEnabled:YES];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.delegate = self;
    [self.view addSubview:_scroll];
    

    for (int i = 0; i < TOTAL_PAGE; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"welcome%d.png", i + 1]]];
        imageView.frame = CGRectOffset(self.view.bounds, self.view.bounds.size.width * i, 0);

        [_scroll addSubview:imageView];
    }
    [_scroll setContentSize:CGSizeMake(TOTAL_PAGE * self.view.bounds.size.width,
                                      self.view.bounds.size.height)];

    //start
    float btn_width = 200.0f;
    float btn_height = 44.0f;
    float screen_width = self.view.bounds.size.width;
    float screen_height = self.view.bounds.size.height;
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startButton setBackgroundImage:[UIImage imageNamed:@"btn_start.png"]
                           forState:UIControlStateNormal];
    [startButton setTitle:@"立即体验" forState:UIControlStateNormal];
    startButton.frame = CGRectMake(screen_width * 3 + (screen_width - btn_width) / 2, screen_height - btn_height - 80, btn_width, btn_height);
    [startButton addTarget:self
                    action:@selector(startBtnClick:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [_scroll addSubview:startButton];

    //pageControl
    // Retina4
//    if (ISIPHONE5) {
//        _pageControl = [[MMPageControl alloc] initWithFrame:
//                       CGRectMake(0, 508, self.view.frame.size.width, 50)];
//    } else {
//        _pageControl = [[MMPageControl alloc] initWithFrame:
//                       CGRectMake(0, 420, self.view.frame.size.width, 50)];
//    }

    _pageControl = [[MMPageControl alloc] initWithFrame:
                    CGRectMake(0, screen_height - btn_height - 40, self.view.frame.size.width, 50)];
    _pageControl.activeImage = [UIImage imageNamed:@"img_dot_after.png"];
    _pageControl.inactiveImage = [UIImage imageNamed:@"img_dot_normal.png"];
    _pageControl.dotGap = 20;
    _pageControl.numberOfPages = TOTAL_PAGE;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
}

- (void)startBtnClick:(id)sender
{
    UIViewController *mainPage = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mainPage animated:NO];
}


@end
