//
//  BlocksAndVariables.h
//  IOS_Block
//
//  Created by tengfei li on 1/9/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlocksAndVariables : NSObject
//block对象中的代码中，变量会被五种方式区别对待。
//你可以参考三种标准变量，就像你在一个函数中那样：
//全局变量，包括静态的本地变量
//全局函数，（这个并不是技术上的变量）
//本地变量，和同一个作用域的参数

//block也支持其他两种类型的变量
//在函数级别的_block 变量。这些变量在block中是可变的，同时如果引用变量的block拷贝进堆堆，手动管理内存）内存就会保存 。
//常量

/**
 *  非静态局部变量变量的使用——作为常量使用
 */
-(void)localNotStatic;

/**
 *  _block变量可以在block内修改，是引用类型。
 */
-(void)blockValueUse;



@end
