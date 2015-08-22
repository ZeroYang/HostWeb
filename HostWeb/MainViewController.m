//
//  ViewController.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "MainViewController.h"
#import "SUIActivityIndicatorView.h"
#import "IntroViewController.h"

@interface MainViewController ()<UIWebViewDelegate>
{
    SUIActivityIndicatorView *activityView;
}
@end

@implementation MainViewController


-(void) viewWillAppear:(BOOL)animated
{
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirst"]) {
//        IntroViewController *intro = [[IntroViewController alloc] init];
//        [self presentViewController:intro animated:NO completion:nil];
//    }
    
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:247.0f/255.0f blue:254.0f/255.0f alpha:1.0f];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    //NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    //NSString *resoureUrl = @"http://125.64.24.34:85/app/Login/login.htm";
    NSString *resoureUrl = @"http://zyet.cdxkkj.net/app/login/login.htm";
    NSURL *url = [NSURL URLWithString:resoureUrl];
    //NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSURLRequest *request =[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0f];
    [webView loadRequest:request];
    
    webView.delegate = self;
    
    activityView = [[SUIActivityIndicatorView alloc] init];
    [activityView showWaitingInViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UIWebViewDelegate #

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"load start");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"load finish");
    [activityView hideWaiting];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webView load error:%@",[error description]);
    [activityView hideWaiting];
}

@end
