//
//  TimerViewController.h
//  GCDDemo
//
//  Created by tengfei li on 28/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCD.h"

@interface TimerViewController : UIViewController
@property (nonatomic,strong) GCDTimer *gcdTimer;
@property (nonatomic,strong) NSTimer *normalTimer;

@end
