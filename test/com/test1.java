package com;

import java.util.Arrays;
import java.util.TreeSet;
import java.lang.Integer;
import java.util.Date;
public class test1 {
/*
面向对象的三个主要特征
    封装性：对外部不可见，对内部不能直接操作。
    继承性：在已有结构的基础上继续进行功能扩充。
    多态性：在继承的基础上扩充，类型上的转换处理。

    OOA 面向对象分析
    OOD 面向对象设计
    OOP 面向对象编程

    类和对象：类是对某一类事务的共性的抽象概念，而对象藐视的是一个具体的产物






 */

    static class test extends Thread{
        test(String name)
        {
            super(name);
        }
        public void run()
        {
            for (int x=0;x<10 ;x++ )
            {
                System.out.println((Thread.currentThread()==this)+"-----"+this.getName()+"----"+x);
            }
        }

    }



    public static void main(String[] args) {
        test a1 = new test("ONE");
        test a2 = new test("TWO");
        a1.start();
        a2.start();

        for (int x=0 ; x<10 ;x++ )
            System.out.println("hahah------"+x);


        int s = 2147483647;
        s +=2l;
        System.out.println(s);

    }
}
