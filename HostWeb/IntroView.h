#import <UIKit/UIKit.h>

@protocol IntroViewDelegate <NSObject>

@required
-(void)onDoneButtonPressed;

@end

@interface IntroView : UIView

@property id<IntroViewDelegate> delegate;

- (void)showinView:(UIView *)view;

@end