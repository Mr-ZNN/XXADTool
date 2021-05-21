//
//  ViewController.m
//  AD
//
//  Created by Davetech on 2021/5/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CGFloat Screen_Width = [UIScreen mainScreen].bounds.size.width;
    CGFloat Screen_Height = [UIScreen mainScreen].bounds.size.height;
    
    if (@available(iOS 14.0, *)) {
        UIColorWell *colorWell =  [[UIColorWell alloc] initWithFrame:(CGRectMake(0, 150, 44, 44))];
        [self.view addSubview:colorWell];
        UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, Screen_Width, Screen_Height))];
        [[UIApplication sharedApplication].keyWindow addSubview:view];
        view.alpha = 0.6;
        view.userInteractionEnabled = NO;
        NSTimer *timer11 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            view.backgroundColor = colorWell.selectedColor;
        }];
    } else {
        // Fallback on earlier versions
    }

    
}


@end
