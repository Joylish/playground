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

        int response  = scan.nextInt();

        return response;
    }

    public static double doubleQuestion(String x) {
        System.out.print(x + "  :  ");
        Scanner scan = new Scanner(System.in);

        double response  = scan.nextDouble();

        return response;
    }


    public static String stringQuestion(String x) {
        System.out.print(x + "  :  ");

        Scanner scan = new Scanner(System.in);

        String response  = scan.nextLine();

        return response;
    }


    public static void printRecode(String x, int width) {
        System.out.printf("%-" + width + "s", x);
    }

    public static void printReturn() {
        System.out.printf("\n");
    }
}

