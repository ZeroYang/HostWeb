//
//  WebViewController.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "WebViewController.h"
#import "SUIActivityIndicatorView.h"

@interface WebViewController ()<UIWebViewDelegate>
{
    SUIActivityIndicatorView *activityView;
}
@end

@implementation WebViewController
@synthesize resoureUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    //NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:resoureUrl];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.delegate = self;
    
    activityView = [[SUIActivityIndicatorView alloc] init];
    [activityView showWaitingInViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"load start");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityView hideWaiting];
    NSLog(@"load finish");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityView hideWaiting];
    NSLog(@"webView load error:%@",[error description]);
}

@end
