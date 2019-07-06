package com.bank.beans;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LogicExecutor {
	@Autowired
	private Customer c2;
	public Customer getCustomerInfo(Customer c,ArrayList<Customer> list) {
		
		for( Customer c1:list) {
			if(c1.getAccountNumber().equals(c.getAccountNumber())) {
				c2=c1;
			}
		}
		return c2;
	}
	
	@SuppressWarnings("unchecked")
	public boolean processBalance(Object o, String amount,String accountNumber) {
		ArrayList<Customer> list = (ArrayList<Customer>)o;
		for(Customer c : list) {
			if( c.getAccountNumber().equals(accountNumber)) {
				if((Integer.parseInt(c.getBalance()) - Integer.parseInt(
						c.getAccountType().getMinBalance())) < Integer.parseInt(amount))
					return false;
			return true;	
			}
		}
		return false;
	}
}
