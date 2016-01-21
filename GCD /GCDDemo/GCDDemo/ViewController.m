//
//  ViewController.m
//  GCDDemo
//
//  Created by tengfei li on 21/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self serialQueue];
//    [self initConCurrent];
    
//    [GCDQueue executeInGlobalQueue:^{
//        // 子线程——业务逻辑
//        // 如果在这里写了UI，因为是串行，会卡界面
//        
//        
//        [GCDQueue executeInMainQueue:^{
//            // 主线程——更新UI
//        }];
//    }];
    NSLog(@"主线程执行");
    [self performSelector:@selector(threadEvent:)
               withObject:self
               afterDelay:2.0f];
    //Cancels perform requests previously registered with the performSelector:withObject:afterDelay: instance method.
    //All perform requests having the same target aTarget are canceled. This method removes perform requests only in the current run loop, not all run loops.

    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [GCDQueue executeInMainQueue:^{
        NSLog(@"GCD 执行");
    } afterDelaySecs:2.0f];
    
}

- (void)threadEvent:(id)sender
{
    NSLog(@"Thead 事件执行");
}

//串行队列
- (void)serialQueue
{
    // 创建队列
    GCDQueue *queue = [[GCDQueue alloc]initSerial];
    
    [queue execute:^{
        NSLog(@"1");
    }];
    
    [queue execute:^{
        NSLog(@"2");
    }];
    
    [queue execute:^{
        NSLog(@"3");
    }];
    
    [queue execute:^{
        NSLog(@"4");
    }];
    
    [queue execute:^{
        NSLog(@"5");
    }];
}

- (void)initConCurrent
{
    // 创建队列
    GCDQueue *queue = [[GCDQueue alloc]initConcurrent];
    
    [queue execute:^{
        NSLog(@"1");
    }];
    
    [queue execute:^{
        NSLog(@"2");
    }];
    
    [queue execute:^{
        NSLog(@"3");
    }];
    
    [queue execute:^{
        NSLog(@"4");
    }];
    
    [queue execute:^{
        NSLog(@"5");
    }];
}


@end
