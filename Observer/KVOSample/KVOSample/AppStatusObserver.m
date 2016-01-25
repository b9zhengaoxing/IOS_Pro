//
//  AppStatusObserver.m
//  KVOSample
//
//  Created by tengfei li on 25/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "AppStatusObserver.h"

@implementation AppStatusObserver

//针对Map接口的编程，很有意思
- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object
                        change:(NSDictionary*)change context:(void*)context
{
    NSLog(@"%@ - %@", keyPath, (NSString*)change[NSKeyValueChangeNewKey]);
}

@end
