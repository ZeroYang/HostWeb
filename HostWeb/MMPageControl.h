//
//  MMPageControl.h
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMPageControl : UIControl

// 暂时只支持设置图片方式，后可扩展支持设置颜色或图片
@property (nonatomic, strong) UIImage *activeImage;
@property (nonatomic, strong) UIImage *inactiveImage;
@property (nonatomic ,assign) NSInteger numberOfPages;
@property (nonatomic ,assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger dotGap;

@end
