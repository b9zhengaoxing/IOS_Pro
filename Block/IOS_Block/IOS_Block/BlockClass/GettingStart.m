//
//  GettingStart.m
//  IOS_Block
//
//  Created by tengfei li on 1/9/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "GettingStart.h"

@implementation GettingStart

#pragma mark- Declaring and Using a Block
/**
 *  定义并且使用block
 *
 *  @param tmpNum 倍数
 */
-(void)blockBegin:(int)tmpNum
{
    int multiplier = 7;
    int (^myBlock)(int) = ^(int num) {
        return num * multiplier;
    };
    NSLog(@"blockBegin:%d",myBlock(tmpNum));
}

#pragma mark- Using a Block Directly
/**
 *  直接使用block作为参数
 */
-(void)useABlockDirect
{
    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    
    // myCharacters is now { "Charles Condomine", "George", "TomJohn" }

}

#pragma mark- Block with Cocoa
/**
 *  Cocoa 中的block
 */
-(void)blockWithCocoa
{
    
    NSArray *stringsArray = @[ @"string 1",
                               @"String 21",
                               @"string 12",
                               @"String 11",
                               @"String 02" ];
    
    static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch |
    NSWidthInsensitiveSearch | NSForcedOrderingSearch;
    NSLocale *currentLocale = [NSLocale currentLocale];
    
    NSComparator finderSortBlock = ^(id string1, id string2) {
        
        NSRange string1Range = NSMakeRange(0, [string1 length]);
        return [string1 compare:string2 options:comparisonOptions range:string1Range locale:currentLocale];
    };
    
    NSArray *finderSortArray = [stringsArray sortedArrayUsingComparator:finderSortBlock];
    NSLog(@"finderSortArray: %@", finderSortArray);
    
    /*
     Output:
     finderSortArray: (
     "string 1",
     "String 02",
     "String 11",
     "string 12",
     "String 21"
     )
     */
}

#pragma mark- __block Variables（_block 类型变量）
/**
 *  block的另一个强大的特性是可以修改同一词法范围的变量。你可以把一个block想修改的变量声明成_block类型
 */
-(void)blockVariable
{
    NSArray *stringsArray = @[ @"string 1",
                               @"String 21", // <-
                               @"string 12",
                               @"String 11",
                               @"Strîng 21", // <-
                               @"Striñg 21", // <-
                               @"String 02" ];
    
    NSLocale *currentLocale = [NSLocale currentLocale];
    __block NSUInteger orderedSameCount = 0;
    
    NSArray *diacriticInsensitiveSortArray = [stringsArray sortedArrayUsingComparator:^(id string1, id string2) {
        
        NSRange string1Range = NSMakeRange(0, [string1 length]);
        NSComparisonResult comparisonResult = [string1 compare:string2 options:NSDiacriticInsensitiveSearch range:string1Range locale:currentLocale];
        
        if (comparisonResult == NSOrderedSame) {
            orderedSameCount++;
        }
        return comparisonResult;
    }];
    
    NSLog(@"diacriticInsensitiveSortArray: %@", diacriticInsensitiveSortArray);
    NSLog(@"orderedSameCount: %lu", (unsigned long)orderedSameCount);
    
    /*
     Output:
     
     diacriticInsensitiveSortArray: (
     "String 02",
     "string 1",
     "String 11",
     "string 12",
     "String 21",
     "Str\U00eeng 21",
     "Stri\U00f1g 21"
     )
     orderedSameCount: 2
     */
}


@end
