//
//  SUIActivityIndicatorView.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "SUIActivityIndicatorView.h"

@interface SUIActivityIndicatorView()
{
    UIActivityIndicatorView *activityIndicator;
}
@end

@implementation SUIActivityIndicatorView

-(void)showWaitingInViewController:(UIViewController*)vc
{
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicator setCenter:vc.view.center];
    activityIndicator.backgroundColor = [UIColor grayColor];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator startAnimating];
    [vc.view addSubview:activityIndicator];
}

-(void)hideWaiting
{
    [activityIndicator stopAnimating];
    [activityIndicator removeFromSuperview];
}

@end
