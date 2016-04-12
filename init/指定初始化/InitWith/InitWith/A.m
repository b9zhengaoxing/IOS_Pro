//
//  A.m
//  InitWith
//
//  Created by tengfei li on 12/4/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "A.h"

@implementation A

- (id)init
{
    NSLog(@"类A  init");
    return [self initWithA:10];
}
- (id)initWithA:(int)a
{
    if (self = [super init]) {
        NSLog(@"类A initWithA");
    }
    return self;
}

@end
