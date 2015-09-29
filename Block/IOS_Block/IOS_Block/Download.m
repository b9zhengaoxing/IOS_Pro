//
//  Download.m
//  day3 - BlockDemo2
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "Download.h"

@implementation Download


//下载数据
- (void)downloadDataBegin:(void (^)(void))beginBlock finished:(void (^)(NSString *))finished
{
    self.beginBlock = beginBlock;
    self.finished = finished;
    
    if (self.beginBlock) {
        self.beginBlock();
        //回调告诉使用当前类的对象，下载开始
    }
    
    int i = 0;
    while (i++ < 10) {
        sleep(1);
        NSLog(@"下到数据");
    }
    
    
    //假设下载到的数据是
    NSString *str = @"我是下载到的数据";
    
    if (self.finished) {
        self.finished(str);
        //回调，下载完成的block，传入字符串数据
    }
}

@end
