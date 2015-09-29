//
//  GettingStart.h
//  IOS_Block
//
//  Created by tengfei li on 1/9/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//
//  一、格式：
//  返回值（^名字）（参数列表）=^（参数列表）{body}
//  You declare them using syntax similar to that you use to declare a pointer to a function, except that you use ^ instead of *.——就和函数指针一样一样的

//  二、TypeDef
//  typedef float (^MyBlockType)(float, float);
//  MyBlockType myFirstBlock = // ... ;
//  MyBlockType mySecondBlock = // ... ;

//  三、作为全局变量出现
//  #import <stdio.h>
//  int GlobalInt = 0;
//  int (^getGlobalInt)(void) = ^{ return GlobalInt; };

//  四、block中的几种变量
//  全局变量，包括静态的本地变量——读写
//  全局函数，（这个并不是技术上的变量）
//  本地变量，和同一个作用域的参数——看做常量
//  _block 读写


#import <Foundation/Foundation.h>

@interface GettingStart : NSObject

#pragma mark- Declaring and Using a Block
/**
 *  定义并且使用block
 *
 *  @param tmpNum 倍数
 */
-(void)blockBegin:(int)tmpNum;

#pragma mark- Using a Block Directly
/**
 *  直接使用block
 */
-(void)useABlockDirect;

#pragma mark- Block with Cocoa
/**
 *  Cocoa 中的block
 */
-(void)blockWithCocoa;

#pragma mark- __block Variables（_block 类型变量）
/**
 *  block的另一个强大的特性是可以修改同一词法范围的变量。你可以把一个block想修改的变量声明成_block类型
 */
-(void)blockVariable;


@end
