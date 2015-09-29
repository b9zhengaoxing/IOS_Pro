//
//  Download.h
//  day3 - BlockDemo2
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Download : NSObject

//设置下载开始的回调和下载结束的回调
@property (nonatomic,copy)void (^beginBlock)(void);
@property (nonatomic,copy)void (^finished)(NSString *dataString);

//下载数据
- (void)downloadDataBegin:(void (^)(void))beginBlock finished:(void (^)(NSString *dataString))finished;


@end
