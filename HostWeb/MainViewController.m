//
//  ViewController.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "MainViewController.h"
#import "WebViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *startWeb = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:startWeb];
    [startWeb setTitle:@"startWeb" forState:UIControlStateNormal];
    [startWeb addTarget:self action:@selector(startWeb:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startWeb:(id)sender
{
    WebViewController* a =  [[WebViewController alloc] init];
    a.resoureUrl = @"http://www.baidu.com";
    
    [self presentViewController:a animated:YES completion:nil];
}

@end
