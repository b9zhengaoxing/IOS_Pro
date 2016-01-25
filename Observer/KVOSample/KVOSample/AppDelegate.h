//
//  AppDelegate.h
//  KVOSample
//
//  Created by tengfei li on 25/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStatusObserver.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *appStatus;
@property (strong, nonatomic) AppStatusObserver *observer;


@end

