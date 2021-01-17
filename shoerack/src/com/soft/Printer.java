package com.soft;

import java.util.Scanner;

public class Printer {
    public static void println(String x) {
        System.out.println(x);
    }

    public static void printDivider() {
        System.out.println("---------------------------------------");
    }

    public static int intQuestion(String x) {
        System.out.print(x + "  :  ");
        Scanner scan = new Scanner(System.in);
        int response  =  Integer.parseInt(scan.nextLine());
        return response;
    }

    public static String stringQuestion(String x) {
        System.out.print(x + "  :  ");
        Scanner scan = new Scanner(System.in);
        String response  =  scan.nextLine();
        return response;
    }
    public static void printReturn() {
        System.out.printf("\n");
    }
}

