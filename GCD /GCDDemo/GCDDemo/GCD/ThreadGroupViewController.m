//
//  ThreadGroupViewController.m
//  GCDDemo
//
//  Created by tengfei li on 24/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "ThreadGroupViewController.h"
#import "GCD.h"

@interface ThreadGroupViewController ()

@end

@implementation ThreadGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化线程组
    GCDGroup *group = [[GCDGroup alloc]init];
    
    //初始化线程
    GCDQueue *queue = [[GCDQueue alloc]initConcurrent];
    
    [queue execute:^{
        sleep(1);
        NSLog(@"线程1 执行完毕");
    } inGroup:group];
    
    
    [queue execute:^{
        sleep(2);
        NSLog(@"线程2 执行完毕");
    } inGroup:group];
    
    
    [queue notify:^{
        NSLog(@"线程3 执行完毕");
    } inGroup:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
