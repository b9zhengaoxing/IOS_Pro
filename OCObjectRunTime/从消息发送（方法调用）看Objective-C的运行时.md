# 从消息发送（方法调用）看Objective-C的运行时

1. Objective-C是一门动态语言，运行时决定调用，甚至增加、替换方法的具体实现，
2. 而这些都归功于Objective-C的运行时（runtime）系统。
3. 从消息发送的角度来看下Objective-C的运行时。

## 决定方法调用的动态性 —— Runtime —— 多态VS动态调用

####多态：override + 父类引用子类对象

1. 面向对象的一个基本特征就是**多态**。
2. 同名方法（override）
3. 父类引用+子类对象
3. 调用父类引用的方法（或者说发送某个消息），
	3. 那么如果这个方法在父类和子类中的实现逻辑不同，哪种实现会被执行呢？
	3. 子类的实现逻辑被调用执行。这是面向对象语言的基本特性之一。

#### C基础上OC，实现多态

**示例代码**

```
void funcA()
{
   printf("hello world!\n");
}
 
void funcB()
{
   printf("world hello!\n");
}
 
 // 调用哪个方法，是个问题
void receiveMessage()
{
   void (*function)();
   if ( shouldFunctionAorB )
   {
      function = &funcA;
   }
   else
   {
      function = &funcB;
   }
   (*function)();
}

```

## 1. SEL和IMP

## 2. objc_msgSend
## 3. Method swizzling
## 4. 消息转发



# 参考文章

1. [从消息发送（方法调用）看Objective-C的运行时](http://www.molotang.com/articles/1905.html)
1. [objective C中的@class, SEL , IMP等灵活机制（五）](http://blog.csdn.net/holydancer/article/details/7347399)