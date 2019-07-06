package com.bank.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bank.beans.AccountType;
import com.bank.beans.Customer;
import com.bank.beans.LogicExecutor;
import com.bank.beans.Transaction;
import com.bank.service.BankService;

@Controller
public class AdminController implements Comparator<Customer> {
	@Autowired
	private Customer customer;
	@Autowired
	private AccountType accountType;
	@Autowired
	private BankService bankService;
	@Autowired
	private LogicExecutor logicExecutor;
	@Autowired
	private Transaction transaction;
	ArrayList<Customer> list;
	ArrayList<AccountType> act_type_list;
	ArrayList<Customer> sortedlist;
	ArrayList<Transaction> transfer_list;

	@RequestMapping("/")
	public ModelAndView showIndex(ModelAndView mav, HttpSession session, Principal principal) {
		list = bankService.getAllCustomers();
		act_type_list = bankService.getAccountType();
		transfer_list = bankService.getTransferDetails();
		session.setAttribute("list", list);
		session.setAttribute("act_type_list", act_type_list);
		session.setAttribute("transfer_list", transfer_list);
		try {
			session.setAttribute("username", principal.getName());
		} catch (Exception e) {
			session.setAttribute("username", "georgenoah40231@gmail.com");
		}
		sortedlist = list;
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/AccountCreation")
	public ModelAndView showAccountCreation(ModelAndView mav) {
		mav.addObject("status", "false");
		mav.addObject("customer", customer);
		mav.setViewName("accountcreation");
		return mav;
	}

	@RequestMapping("/LoanProcess")
	public ModelAndView showLoanProcess(ModelAndView mav) {
		mav.setViewName("loanprocess");
		return mav;
	}

	@RequestMapping("/CustomerSearch")
	public ModelAndView showCustomerSearch(ModelAndView mav) {
		customer.setAccountNumber("");
		mav.addObject("customer", customer);
		mav.setViewName("customersearch");
		return mav;
	}

	@RequestMapping("/Transaction")
	public ModelAndView showTransaction(ModelAndView mav) {
		mav.addObject("transaction", transaction);
		mav.setViewName("transaction");
		return mav;
	}

	@RequestMapping("/login")
	public ModelAndView showLogin(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping("/LoginFailed")
	public ModelAndView showLoginFailed(ModelAndView mav) {
		mav.setViewName("loginfailed");
		return mav;
	}

	@RequestMapping("/logoutpage")
	public ModelAndView showLogout(ModelAndView mav) {
		mav.setViewName("logout");
		return mav;
	}

	@RequestMapping("/Statement")
	public ModelAndView showStatement(ModelAndView mav) {
		transaction.setFromAccount("");
		mav.addObject("transaction", transaction);
		mav.setViewName("statement");
		return mav;
	}

	@RequestMapping("/Report")
	public ModelAndView showReport(ModelAndView mav) {
		customer.setReport("");
		mav.addObject("customer", customer);
		mav.setViewName("report");
		return mav;
	}

	@RequestMapping("/CustomerCreation")
	public ModelAndView selectAccountType(ModelAndView mav, @ModelAttribute("customer") Customer c) {
		customer = c;
		mav.addObject("status", "true");
		mav.addObject("customer", customer);
		mav.addObject("accountType", accountType);
		mav.setViewName("accountcreation");
		return mav;
	}

	@RequestMapping("/FinalizeAccount")
	public ModelAndView welcomeUser(ModelAndView mav, @ModelAttribute("accountType") AccountType a,
			HttpSession session) {
		accountType = a;
		for (AccountType x : act_type_list) {
			if (x.getType().equals(a.getType())) {
				a.setInterestRate(x.getInterestRate());
				a.setMinBalance(x.getMinBalance());
				a.setOverdraft(x.getOverdraft());
				customer.setAccountType(a);
				break;
			}
		}
		customer.setCreatedBy(String.valueOf(session.getAttribute("username")));
		customer.setAccountNumber(accountType.getAccountNo(customer.getPanNumber()));
		bankService.insertCustomerDetails(customer);
		mav.addObject("customer", customer);
		mav.setViewName("welcome");
		return mav;
	}

	@RequestMapping("/SearchByAccountNumber")
	public ModelAndView searchUser(ModelAndView mav, @ModelAttribute("customer") Customer c) {
		customer = logicExecutor.getCustomerInfo(c, list);
		mav.addObject("customer", customer);
		mav.setViewName("customersearch");
		return mav;
	}

	@RequestMapping("/GenerateReport")
	public ModelAndView generateReport(ModelAndView mav, @ModelAttribute("customer") Customer c) {
		if (c.getReport().equals("fname")) {
			Collections.sort(sortedlist, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					return o1.getFname().compareTo(o2.getFname());
				}
			});
		}
		if (c.getReport().equals("mname")) {
			Collections.sort(sortedlist, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					return o1.getMname().compareTo(o2.getMname());
				}
			});
		}
		if (c.getReport().equals("lname")) {
			Collections.sort(sortedlist, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					return o1.getLname().compareTo(o2.getLname());
				}
			});
		}
		if (c.getReport().equals("balance")) {
			Collections.sort(sortedlist, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					return Integer.parseInt(o1.getBalance()) - Integer.parseInt(o2.getBalance());
				}
			});
		}
		mav.setViewName("report");
		return mav;
	}

	@RequestMapping("/MakeTransaction")
	public ModelAndView makeTransaction(ModelAndView mav, @ModelAttribute("transaction") Transaction t,
			HttpSession session) {
		transaction = t;
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		if (transaction.getMethod().equals("Deposit")) {
			transaction.setToAccount("self");
			transaction.setDate(String.valueOf(dtf.format(now)));
			bankService.makeTransaction(transaction);
			bankService.processDeposit(transaction);
			mav.addObject("msg", "Transaction Made Successfully");
		}
		if (transaction.getMethod().equals("Withdraw")) {
			boolean status = logicExecutor.processBalance(list, transaction.getAmount(), transaction.getFromAccount());
			if (status) {
				transaction.setToAccount("self");
				transaction.setDate(String.valueOf(dtf.format(now)));
				bankService.makeTransaction(transaction);
				bankService.processWithdrawal(transaction);
				mav.addObject("msg", "Transaction Made Successfully");
			} else {
				mav.addObject("msg",
						"Withdrawal UnSucessfull - Amount should be less than balance and Minimum Balance criteria");
			}
		}
		if (transaction.getMethod().equals("Other Bank Account")) {
			boolean status = logicExecutor.processBalance(list, transaction.getAmount(), transaction.getFromAccount());
			if (status) {
				transaction.setDate(String.valueOf(dtf.format(now)));
				bankService.makeTransaction(transaction);
				bankService.processOtherAccountTransfer(transaction);
				mav.addObject("msg", "Transaction Made Successfully");
			} else {
				mav.addObject("msg",
						"Transfer UnSucessfull - Amount should be less than balance and Minimum Balance criteria");
			}
		}
		mav.setViewName("transaction");
		return mav;
	}

	@RequestMapping("/ProcessStatement")
	public ModelAndView processStatement(ModelAndView mav, @RequestParam("acno") String accountno) {
		transaction.setFromAccount(accountno);
		mav.addObject("transaction", transaction);
		mav.setViewName("statement");
		return mav;
	}

	// Total control - setup a model and return the view name yourself. Or
	// consider subclassing ExceptionHandlerExceptionResolver (see below).
	@RequestMapping("/error")
	@ExceptionHandler(Exception.class)
	public ModelAndView handleError(HttpServletRequest req, Exception ex) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", ex);
		mav.addObject("url", req.getRequestURL());
		mav.setViewName("error");
		return mav;
	}

	@Override
	public int compare(Customer o1, Customer o2) {
		// TODO Auto-generated method stub
		return 0;
	}
}
