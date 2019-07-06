package com.bank.beans;

import org.springframework.stereotype.Component;

@Component
public class Transaction {

	private String fromAccount;
	private String toAccount;
	private String mode;
	private String date;
	private String amount;
	private String method;
	private String transferredBy;
	public String getFromAccount() {
		return fromAccount;
	}
	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}
	public String getToAccount() {
		return toAccount;
	}
	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getTransferredBy() {
		return transferredBy;
	}
	public void setTransferredBy(String transferredBy) {
		this.transferredBy = transferredBy;
	}
}
