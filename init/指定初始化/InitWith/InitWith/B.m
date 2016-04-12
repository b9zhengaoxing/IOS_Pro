//
//  B.m
//  InitWith
//
//  Created by tengfei li on 12/4/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "B.h"

@implementation B
- (id)init
{
    NSLog(@"类B  init");
    return [self initWithB:10];
}
- (id)initWithB:(int)a
{
    if (self = [super initWithA:a]) {
        NSLog(@"类B initWithB");
    }
    return self;
}
@end
