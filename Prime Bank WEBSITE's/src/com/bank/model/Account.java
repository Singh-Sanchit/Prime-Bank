package com.bank.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import com.bank.beans.AccountType;
import com.bank.beans.Customer;
import com.bank.beans.Transaction;
import com.bank.beans.Users;

@Component
public class Account {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<Customer> getAllCustomer() {
		return jdbc.query(
				"select * from customer,customer_has_account as chs,account_type "
						+ "where customer.id = chs.customer_id AND chs.account_id = account_type.id ",
				new RowMapper<Customer>() {

					@Override
					public Customer mapRow(ResultSet rs, int num) throws SQLException {
						Customer c = new Customer();
						AccountType a = new AccountType();
						c.setId(rs.getInt("id"));
						c.setFname(rs.getString("fname"));
						c.setMname(rs.getString("mname"));
						c.setLname(rs.getString("lname"));
						c.setContact(rs.getString("contact"));
						c.setEmail(rs.getString("email"));
						c.setAddress(rs.getString("address"));
						c.setPanNumber(rs.getString("panNumber"));
						c.setCity(rs.getString("city"));
						c.setCountry(rs.getString("country"));
						c.setPostalCode(rs.getString("postalCode"));
						c.setBalance(rs.getString("balance"));
						c.setAccountNumber(rs.getString("accountNumber"));
						c.setCreatedBy(rs.getString("createdBy"));
						a.setInterestRate(rs.getString("interestRate"));
						a.setType(rs.getString("type"));
						a.setMinBalance(rs.getString("minBalance"));
						a.setOverdraft(rs.getString("overdraft"));
						c.setAccountType(a);
						return c;
					}

				});
	}

	public void insertCustomerDetails(Customer customer) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("fname", customer.getFname());
		map.addValue("mname", customer.getMname());
		map.addValue("lname", customer.getLname());
		map.addValue("contact", customer.getContact());
		map.addValue("email", customer.getEmail());
		map.addValue("address", customer.getAddress());
		map.addValue("panNumber", customer.getPanNumber());
		map.addValue("city", customer.getCity());
		map.addValue("country", customer.getCountry());
		map.addValue("postalCode", customer.getPostalCode());
		map.addValue("balance", customer.getAccountType().getMinBalance());
		map.addValue("accountNumber", customer.getAccountNumber());
		map.addValue("createdBy", customer.getCreatedBy());
		jdbc.update(
				"insert into customer(fname,mname,lname,contact,email,address,panNumber,city,country,postalCode,balance,accountNumber,createdBy) "
						+ "values (:fname,:mname,:lname,:contact,:email,:address,:panNumber,:city,:country,:postalCode,:balance,:accountNumber,:createdBy)",
				map);

	}

	public List<AccountType> getAccountType() {
		return jdbc.query("select * from account_type ", new RowMapper<AccountType>() {

			@Override
			public AccountType mapRow(ResultSet rs, int num) throws SQLException {
				AccountType a = new AccountType();
				a.setType(rs.getString("type"));
				a.setMinBalance(rs.getString("minBalance"));
				a.setInterestRate(rs.getString("interestRate"));
				a.setOverdraft(rs.getString("overdraft"));
				return a;
			}
		});
	}

	public void makeTransaction(Transaction transaction) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("fromAccount", transaction.getFromAccount());
		map.addValue("toAccount", transaction.getToAccount());
		map.addValue("mode", transaction.getMode());
		map.addValue("method", transaction.getMethod());
		map.addValue("date", transaction.getDate());
		map.addValue("amount", transaction.getAmount());
		map.addValue("transferredBy", transaction.getTransferredBy());
		jdbc.update("insert into transaction(fromAccount,toAccount,mode,method,date,amount,transferredBy) "
				+ "values (:fromAccount,:toAccount,:mode,:method,:date,:amount,:transferredBy)", map);
	}

	public void processDeposit(Transaction transaction) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("accountno", transaction.getFromAccount());
		map.addValue("newamount", transaction.getAmount());
		jdbc.update("update customer set balance = balance + :newamount where accountNumber = :accountno", map);
	}

	public void processWithdrawal(Transaction transaction) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("accountno", transaction.getFromAccount());
		map.addValue("newamount", transaction.getAmount());
		jdbc.update("update customer set balance = balance - :newamount where accountNumber = :accountno", map);
	}

	public void processOtherAccountTransfer(Transaction transaction) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("fromaccountno", transaction.getFromAccount());
		map.addValue("newamount", transaction.getAmount());
		map.addValue("toaccountno", transaction.getToAccount());
		jdbc.update("update customer set balance = balance - :newamount where accountNumber = :fromaccountno", map);
		jdbc.update("update customer set balance = balance + :newamount where accountNumber = :toaccountno", map);
	}

	public List<Transaction> getTransferDetails() {
		return jdbc.query("select * from transaction ", new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int num) throws SQLException {
				Transaction t = new Transaction();
				t.setFromAccount(rs.getString("fromAccount"));
				t.setToAccount(rs.getString("toAccount"));
				t.setMode(rs.getString("mode"));
				t.setMethod(rs.getString("method"));
				t.setDate(rs.getString("date"));
				t.setAmount(rs.getString("amount"));
				t.setTransferredBy(rs.getString("transferredBy"));
				return t;
			}
		});
	}

	public void addNewUser(Users u) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("name", u.getName());
		map.addValue("username", u.getUsername());
		map.addValue("password", u.getPassword());
		map.addValue("enabled", u.getEnabled());
		jdbc.update("insert into users(name,username,password,enabled) " + "values (:name,:username,:password,:enabled)",
				map);
	}

	public List<Users> getAllUsers() {
		return jdbc.query("select * from users ", new RowMapper<Users>() {

			@Override
			public Users mapRow(ResultSet rs, int num) throws SQLException {
				Users u = new Users();
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setEnabled(rs.getString("enabled"));
				return u;
			}
		});
	}

	public void modifyUser(Users u) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("username", u.getUsername());
		map.addValue("password", u.getPassword());
		map.addValue("enabled", u.getEnabled());
		jdbc.update("update users set password = :password where username = :username", map);
		jdbc.update("update users set enabled = :enabled where username = :username", map);
	}

	public void addNewAccountType(AccountType a) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("type", a.getType());
		map.addValue("minBalance", a.getMinBalance());
		map.addValue("interestRate", a.getInterestRate());
		map.addValue("overdraft", a.getOverdraft());
		jdbc.update("insert into account_type(type,minBalance,interestRate,overdraft) " + "values (:type,:minBalance,:interestRate,:overdraft)",
				map);
	}

	public void modifyAccountType(AccountType a) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("type", a.getType());
		map.addValue("minBalance", a.getMinBalance());
		map.addValue("interestRate", a.getInterestRate());
		map.addValue("overdraft", a.getOverdraft());
		jdbc.update("update account_type set minBalance = :minBalance where type = :type", map);
		jdbc.update("update account_type set interestRate = :interestRate where type = :type", map);
		jdbc.update("update account_type set overdraft = :overdraft where type = :type", map);
	}
}
