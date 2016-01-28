//
//  TimerViewController.m
//  GCDDemo
//
//  Created by tengfei li on 28/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self runGCDTimer];
    [self runNSTimer];
}


- (void)runGCDTimer{
    // 初始化定时器
    self.gcdTimer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    
    // 指定时间间隔，要执行的操作
    [self.gcdTimer event:^{
        NSLog(@"GCD 定时器");
    } timeInterval:NSEC_PER_SEC];
    
    [self.gcdTimer start];
    
}

-(void)runNSTimer{
    self.normalTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                        target:self
                                                      selector:@selector(timeEvent)
                                                      userInfo:nil
                                                       repeats:YES];
}

- (void)timeEvent
{
    NSLog(@"NSTimer 定时器");
}

@end
