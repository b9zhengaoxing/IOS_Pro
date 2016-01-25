//
//  AppDelegate.m
//  KVOSample
//
//  Created by tengfei li on 25/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.observer = [AppStatusObserver new];
    [self addObserver:self.observer forKeyPath:@"appStatus"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"Pass Context"];
    
    self.appStatus = @"launch";
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    
    self.appStatus = @"inactive";
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    self.appStatus = @"background";
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    self.appStatus = @"inactive";
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    self.appStatus = @"active";
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    self.appStatus = @"terminate";
}

@end
