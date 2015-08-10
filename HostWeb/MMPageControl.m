//
//  MMPageControl.m
//  HostWeb
//
//  Created by YTB on 15/8/10.
//  Copyright (c) 2015年 ZeroYang. All rights reserved.
//

#import "MMPageControl.h"

@interface MMPageControl ()

@end

@implementation MMPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)pageNumber
{
    if (_currentPage == pageNumber) {
		return ;
    }
    
    // determine if the page number is in the available range
	_currentPage = MIN(MAX(0, pageNumber), _numberOfPages - 1);
    
    // redraw
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)numOfPages
{
    // make sure the number of pages is positive
	_numberOfPages = MAX(0, numOfPages);
    
    // we then need to update the current page
	_currentPage = MIN(MAX(0, _currentPage), _numberOfPages - 1);
    
    // redraw
    [self setNeedsDisplay];
}

- (void)setDotGap:(NSInteger)dotGap
{
    _dotGap = dotGap;
    // redraw
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (_numberOfPages <= 0) {
        return;
    }
    
    // XXX: support image only
    if (!_activeImage || !_inactiveImage) {
        return;
    }

    float startX = (self.frame.size.width - _numberOfPages * _activeImage.size.width - _dotGap * (_numberOfPages - 1)) / 2;
    float startY = (self.frame.size.height - _activeImage.size.height) / 2;
    
    for (NSInteger i = 0; i < _numberOfPages; i++) {
        UIImage *toDraw = _inactiveImage;
        if (i == _currentPage) {
            toDraw = _activeImage;
        }
        
        [toDraw drawAtPoint:CGPointMake(startX + i * (_activeImage.size.width + _dotGap), startY)];
    }
}

@end
