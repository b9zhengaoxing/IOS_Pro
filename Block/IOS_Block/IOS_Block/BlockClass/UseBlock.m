//
//  UseBlock.m
//  IOS_Block
//
//  Created by tengfei li on 1/9/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "UseBlock.h"

@implementation UseBlock

/**
 *  如果你声明一个block变量，你像使用一个函数一样使用它
 */
-(void)invokingaBlock
{
    int (^oneFrom)(int) = ^(int anInt) {
        return anInt - 1;
    };
    
    printf("1 from 10 is %d", oneFrom(10));
    // Prints "1 from 10 is 9"
    
    float (^distanceTraveled)(float, float, float) =
    ^(float startingSpeed, float acceleration, float time) {
        
        float distance = (startingSpeed * time) + (0.5 * acceleration * time * time);
        return distance;
    };
    
    float howFar = distanceTraveled(0.0, 9.8, 1.0);
    // howFar = 4.9
}

/**
 *  使用block作为函数参数
 */
-(void)usingBlockAsAFunctionArgument
{
    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    // Block implementation ends at "}"
    
    // myCharacters is now { "Charles Condomine", "George", "TomJohn" }
}

@end
