package com.bank.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.bank.beans.AccountType;
import com.bank.beans.Customer;
import com.bank.beans.Transaction;
import com.bank.beans.Users;
import com.bank.model.Account;

@Component
public class BankService {

	@Autowired
	Account account = new Account();

	public ArrayList<Customer> getAllCustomers() {
		ArrayList<Customer> list = (ArrayList<Customer>) account.getAllCustomer();
		return list;
	}

	public void insertCustomerDetails(Customer customer) {
		// credit check call api
		account.insertCustomerDetails(customer);
	}

	public ArrayList<AccountType> getAccountType() {
		ArrayList<AccountType> act_type_list = (ArrayList<AccountType>) account.getAccountType();
		return act_type_list;
	}

	public void makeTransaction(Transaction transaction) {
		account.makeTransaction(transaction);
	}

	public void processDeposit(Transaction transaction) {
		account.processDeposit(transaction);

	}

	public void processWithdrawal(Transaction transaction) {
		account.processWithdrawal(transaction);
	}

	public void processOtherAccountTransfer(Transaction transaction) {
		account.processOtherAccountTransfer(transaction);
	}

	public ArrayList<Transaction> getTransferDetails() {
		ArrayList<Transaction> transfer_list = (ArrayList<Transaction>) account.getTransferDetails();
		return transfer_list;
	}

	public void addNewUser(Users u) {
		account.addNewUser(u);
	}

	public ArrayList<Users> getAllUsers() {
		ArrayList<Users> user_list = (ArrayList<Users>) account.getAllUsers();
		return user_list;
	}

	public void modifyUser(Users u) {
		account.modifyUser(u);
	}

	public void addNewAccountType(AccountType a) {
		account.addNewAccountType(a);
	}

	public void modifyAccountType(AccountType a) {
		account.modifyAccountType(a);
	}
}
