package sec03.exam01;

import java.util.Scanner;


public class Main {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		int a = scan.nextInt();
		int b = scan.nextInt();
		int c = scan.nextInt();
		int d = scan.nextInt();
		int e = scan.nextInt();
		
		int result = ((a*a) + (b*b) + (c*c) + (d*d) + (e*e))%10;
		System.out.println(result);
		
	}
}
