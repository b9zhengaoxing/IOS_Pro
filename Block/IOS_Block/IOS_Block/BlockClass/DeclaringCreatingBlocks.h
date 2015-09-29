//
//  DeclaringCreatingBlocks.h
//  IOS_Block
//
//  Created by tengfei li on 1/9/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

//在文件层面，你可以把block作为全局变量。
int GlobalInt = 0;
int (^getGlobalInt)(void) = ^{ return GlobalInt; };

@interface DeclaringCreatingBlocks : NSObject
//block变量维持了一个对block的引用。你声明block使用了和声明函数指针相同的语法，除了你使用“^”代替了“*”之外。block类型可以和全部C类型系统相互操作。下列都是block变量的声明：
{
    void (^blockReturningVoidWithVoidArgument)(void);
    int (^blockReturningIntWithIntAndCharArguments)(int, char);
    void (^arrayOfTenBlocksReturningVoidWithIntArgument[10])(int);
}

    //    你也可以创建block作为类型，当你要在多个地方使用同一block签名的block的时候，这是通常情况下最好的方法。
    typedef float (^MyBlockType)(float, float);

    //    MyBlockType myFirstBlock = // ... ;
    //    MyBlockType mySecondBlock = // ... ;


@end
