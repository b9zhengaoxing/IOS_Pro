//
//  BlocksAndVariables.m
//  IOS_Block
//
//  Created by tengfei li on 1/9/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "BlocksAndVariables.h"

@implementation BlocksAndVariables

//以下规则适用于block中使用的变量：
//全局变量可以访问，包括作用域内的静态变量。（这里block有对全局变量的读写权限）
//传入block中的参数可以访问（就像函数中的参数）。
//作用域中的栈（自动内存管理）（非静态）变量，被当做常量来使用。  在程序中他们的值被block表达式调用。在嵌套block中，会使用最近的作用域中的变量。（笔者的理解是，嵌套的只能用最近的。PS：这一大段其实就几个字：block中普通变量是只读的）
//作用域中的_block变量提供的是引用，所以是可变的。   所有的变动都会反映在作用域中，包括同一个作用域内定义了其他的block。更具体的讨论：见The __block Storage Type。
//block中声明的局部变量，他们的行为很像函数中的局部变量。  block的每次调用都会给变量提供一份新的拷贝。这些在block作用域中的变量可以是常量，也可以做变量（引用的）。

/**
 *  非静态局部变量变量的使用——作为常量使用
 */
-(void)localNotStatic
{
    int x = 123;
    void (^printXAndY)(int) = ^(int y) {
        
        printf("%d %d\n", x, y);
    };
    
    printXAndY(456); // prints: 123 456
}

/**
 *  _block变量可以在block内修改，是引用类型。
 */
-(void)blockValueUse
{
    __block int x = 123; //  x lives in block storage
    
    void (^printXAndY)(int) = ^(int y) {
        
        x = x + y;
        printf("%d %d\n", x, y);
    };
    printXAndY(456); // prints: 579 456
    // x is now 579
}


//当一个block被拷贝了，他创建一个对block中使用的对象变量的强引用。如果你在块内实现了一个方法：
//如果你通过引用访问一个实例变量，就对self建立一个强引用。
//如果你通过值访问了一个实例变量，就对变量建立一个强引用

//        dispatch_async(queue, ^{
//            // instanceVariable is used by reference, a strong reference is made to self
//            doSomethingWithObject(instanceVariable);
//        });
//
//
//        id localVariable = instanceVariable;
//        dispatch_async(queue, ^{
//            /*
//             localVariable is used by value, a strong reference is made to localVariable
//             (and not to self).
//             */
//            doSomethingWithObject(localVariable);
//        });

@end
