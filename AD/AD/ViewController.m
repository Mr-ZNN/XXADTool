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
    
//    if (@available(iOS 14.0, *)) {
//        UIColorWell *colorWell =  [[UIColorWell alloc] initWithFrame:(CGRectMake(0, 150, 44, 44))];
//        [self.view addSubview:colorWell];
//        UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, Screen_Width, Screen_Height))];
//        [[UIApplication sharedApplication].keyWindow addSubview:view];
//        view.alpha = 0.6;
//        view.userInteractionEnabled = NO;
//        NSTimer *timer11 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            view.backgroundColor = colorWell.selectedColor;
//        }];
//    } else {
//        // Fallback on earlier versions
//    }
    // 创建一个串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("com.example.serialQueue", DISPATCH_QUEUE_SERIAL);

    // 创建一个 dispatch group
    dispatch_group_t group = dispatch_group_create();

    for (int i = 0; i < 10; i++) {
        // 进入 dispatch group
        dispatch_group_enter(group);
        
        // 异步任务，加入到串行队列中执行
        dispatch_async(serialQueue, ^{
            // 模拟异步操作，例如网络请求或耗时任务
            [self performAsyncTaskWithIndex:i completion:^{
                // 异步操作完成后调用
                NSLog(@"Task %d completed", i);
                
                // 退出 dispatch group
                dispatch_group_leave(group);
            }];
        });
    }

    // 当所有任务完成后执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"All tasks completed in order.");
    });

    

    
}
// 异步任务示例
- (void)performAsyncTaskWithIndex:(int)index completion:(void (^)(void))completion {
    // 模拟异步延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 在这里处理你的任务逻辑
        if (completion) {
            completion();
        }
    });
}

@end
