package helloworld.main;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int n = scan.nextInt();
		double a = 0, b = 0, avg = 0.0;
		int count = 0;

		for (int i = 0; i < n; i++) {
			int n1 = scan.nextInt();
			int sum = 0;

			int[] arr = new int[n1];

			for (int j = 0; j < n1; j++) {
				int input = scan.nextInt();
				arr[j] = input;
				sum += arr[j];
			}
			avg = (double) sum / n1;
			for (int k = 0; i < n1; i++) {
				if(arr[k]>avg) {
					count++;
				}
			}
			System.out.printf("%.3f%\n",(double)count/n1);
			count = 0;
			
		}
	}
}