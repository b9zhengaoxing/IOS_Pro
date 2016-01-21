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
    
    [GCDQueue executeInGlobalQueue:^{
        // 子线程——业务逻辑
        // 如果在这里写了UI，因为是串行，会卡界面
        
        
        [GCDQueue executeInMainQueue:^{
            // 主线程——更新UI
        }];
    }];
    
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
