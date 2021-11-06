/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.p4;

/**
 *
 * @author Emilio
 */
public class ticker implements Runnable {
        Framep4 f4;
        Thread TickerThread;
	String s,sub;
	int sleepTime;
	char c;

	public ticker(String s, int sleep, Framep4 f42){
                f4 = f42;
		this.s=s;
		sleepTime=sleep;
		TickerThread=new Thread(this);
		TickerThread.start();
}
        public void run(){

		System.out.println(s);
		while(true){
			c = s.charAt(0);
			sub = s.substring(1,s.length());
			s = sub + c;
			f4.jLabel1.setText(sub + c);
			try{
				Thread.sleep(sleepTime);
			} catch (Exception e) {
				return;
			}
		}
	}

	public static void main(String args[]){
        ticker ticker = new ticker(" Instituto Politecnico Nacional", 50,new Framep4());
	}
}