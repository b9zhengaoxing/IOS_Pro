//
//  SemphoreViewController.m
//  GCDDemo
//
//  Created by tengfei li on 29/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "SemphoreViewController.h"
#import "GCD.h"

@interface SemphoreViewController ()

@end

@implementation SemphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showSemaphore];
}

- (void)showSemaphore
{
    GCDSemaphore *semaphore = [[GCDSemaphore alloc]init];
    
    //线程1 异步
    [GCDQueue executeInGlobalQueue:^{
        NSLog(@"线程 1");
        
        [semaphore signal];
    }];
    //线程2 异步
    [GCDQueue executeInGlobalQueue:^{
        
        [semaphore wait];
        
        NSLog(@"线程 2");
    }];

    
}


@end
