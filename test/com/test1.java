package com;

import java.util.Arrays;
import java.util.TreeSet;
import java.lang.Integer;
import java.util.Date;
public class test1 {
/*
��������������Ҫ����
    ��װ�ԣ����ⲿ���ɼ������ڲ�����ֱ�Ӳ�����
    �̳��ԣ������нṹ�Ļ����ϼ������й������䡣
    ��̬�ԣ��ڼ̳еĻ��������䣬�����ϵ�ת������

    OOA ����������
    OOD ����������
    OOP ���������

    ��Ͷ������Ƕ�ĳһ������Ĺ��Եĳ��������������ӵ���һ������Ĳ���






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
