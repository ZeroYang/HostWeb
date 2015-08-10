//
//  SUIActivityIndicatorView.h
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUIActivityIndicatorView : NSObject

-(void)showWaitingInViewController:(UIViewController*)vc;
-(void)hideWaiting;

@end
