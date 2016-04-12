//
//  D.m
//  InitWith
//
//  Created by tengfei li on 12/4/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "D.h"

@implementation D
- (id)init
{
    return [self initWithD:10];
}
- (id)initWithD:(int)a
{
    if (self = [super init]) {
        NSLog(@"类D initWithD");
    }
    return self;
}

- (id)initWithC:(int)a
{
    if (self = [super init]) {
        NSLog(@"类D initWithC");
    }
    return self;
}
@end
