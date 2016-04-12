//
//  C.m
//  InitWith
//
//  Created by tengfei li on 12/4/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "C.h"

@implementation C

- (id)init
{
    NSLog(@"类C  init");
    return [self initWithC:10];
}
- (id)initWithC:(int)a
{
    if (self = [super initWithB:a]) {
        NSLog(@"类C initWithC");
    }
    return self;
}
@end
