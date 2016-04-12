//
//  main.m
//  InitWith
//
//  Created by tengfei li on 12/4/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
#import "B.h"
#import "C.h"
#import "D.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 根类 A
//        A *a = [[A alloc]init];
        
        // A子类 B
//        B *b = [[B alloc]init];
        
        // B 子类 C
//        C *c = [[C alloc]init];
        
        // C 子类 D
        // 没有造成死循环
        // 指定初始化不一样？
//        D *d = [[D alloc]init];
        
        // 死循环
        // d1 init（父类init）  ->
        // Self initWithC - > 这里self是 d1
        D *d1 = [[D alloc]initWithC:10];
        
    }
    return 0;
}
