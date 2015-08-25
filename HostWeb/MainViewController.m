//
//  ViewController.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "MainViewController.h"
#import "SUIActivityIndicatorView.h"
#import "IntroView.h"
#import "Constant.h"

@interface MainViewController ()<UIWebViewDelegate, IntroViewDelegate>
{
    UIWebView *webView;
    SUIActivityIndicatorView *activityView;
    IntroView *introView;
    
    BOOL canReturnBack;
    
    UIButton *backBtn;
}
@end

@implementation MainViewController


-(void) viewWillAppear:(BOOL)animated
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirst"]) {
        introView = [[IntroView alloc] initWithFrame:self.view.bounds];
        introView.delegate = self;
        [introView showinView:self.view];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    canReturnBack = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:247.0f/255.0f blue:254.0f/255.0f alpha:1.0f];
    
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
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
    
    //add back button
    float btn_width = 100.0f;
    float btn_height = 44.0f;
    
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_start.png"]
//                           forState:UIControlStateNormal];
    backBtn.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:0.88f];
    [backBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(50, SCREEN_HEIGHT - btn_height - 50, btn_width, btn_height);
    [backBtn addTarget:self action:@selector(onBackHome) forControlEvents:UIControlEventTouchUpInside];
    backBtn.hidden = YES;
    
    [self.view addSubview:backBtn];
}

-(void)onBackHome
{
    NSString *mainUrlString = @"http://zyet.cdxkkj.net/app/login/index_student.htm";
    NSURL *url = [NSURL URLWithString:mainUrlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0f];
    [webView loadRequest:request];
    
    webView.delegate = self;
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

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //request.mainDocumentURL.
    NSString *mapUrlString = @"http://zyet.cdxkkj.net/app/map/map.htm";
    NSString *payUrlString = @"http://120.26.200.126/fgfxcz/cz.html";
    
    if ([mapUrlString isEqualToString:[request URL].absoluteString]) {
        NSLog(@"==============");
        canReturnBack = YES;
    }
    
    if ([payUrlString isEqualToString:[request URL].absoluteString]) {
        NSLog(@"==============");
        canReturnBack = YES;
    }
    NSLog(@"=========%@",[request URL].absoluteString);
    
    
    NSString *mainUrlString = @"http://zyet.cdxkkj.net/app/login/index_student.htm";

    if ([[request URL].absoluteString hasPrefix:mainUrlString]) {
        NSLog(@"==============");
        canReturnBack = NO; //reset
    }
    
    if(canReturnBack)
    {
        backBtn.hidden = NO;
    }
    else
    {
        backBtn.hidden = YES;
    }
    
    return YES;
}

#pragma IntroViewDelegate #

-(void)onDoneButtonPressed
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirst"];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        introView.alpha = 0;
    } completion:^(BOOL finished) {
        [introView removeFromSuperview];
    }];
}


@end

#pragma UIWebView + JavaScriptAlert #

@interface UIWebView (JavaScriptAlert)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(id *)frame;

@end

@implementation UIWebView (JavaScriptAlert)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(id *)frame {
    
    
    UIAlertView* customAlert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [customAlert show];
    
}

@end
