package com.bank.beans;

import org.springframework.stereotype.Component;

@Component
public class AccountType {

	private String type;
	private String minBalance;
	private String interestRate;
	private String overdraft;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMinBalance() {
		return minBalance;
	}

	public void setMinBalance(String minBalance) {
		this.minBalance = minBalance;
	}

	public String getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}

	public String getOverdraft() {
		return overdraft;
	}

	public void setOverdraft(String overdraft) {
		this.overdraft = overdraft;
	}

	public String getAccountNo(String pan) {
		assert pan != null;
		int num = pan.hashCode();
		if (num < 0) {
			num = num * -1;
		}
		String act = "AC" + num;

		if (act.length() < 12) {
			do {
				act = act + "0";
			} while (act.length() != 12);
		}
		act = act + "L";
		return act;
	}
}
