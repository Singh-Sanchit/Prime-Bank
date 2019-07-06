package com.bank.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bank.beans.AccountType;
import com.bank.beans.Users;
import com.bank.service.BankService;

@Controller
@RequestMapping("/cms")
public class CMSController {

	@Autowired
	Users users;
	@Autowired
	private BankService bankService;
	@Autowired
	private AccountType accountType;
	ArrayList<Users> user_list;
	ArrayList<AccountType> act_type_list;
	String msg;

	@RequestMapping("/Dashboard")
	public ModelAndView showDashboard(ModelAndView mav, HttpSession session) {
		user_list = bankService.getAllUsers();
		act_type_list = bankService.getAccountType();
		session.setAttribute("user_list", user_list);
		session.setAttribute("act_type_list", act_type_list);
		mav.setViewName("cms/dashboard");
		return mav;
	}

	@RequestMapping("/UserModification")
	public ModelAndView showUserModification(ModelAndView mav) {
		mav.addObject("users", users);
		mav.setViewName("cms/usermodification");
		return mav;
	}

	@RequestMapping("/AccountType")
	public ModelAndView showAccountType(ModelAndView mav) {
		mav.addObject("accountType", accountType);
		mav.setViewName("cms/accounttype");
		return mav;
	}

	@RequestMapping("/AddNewUser")
	public String addNewUser(ModelAndView mav, @ModelAttribute("users") Users u) {
		users = u;
		bankService.addNewUser(u);
		msg = "User Added Successfully";
		return "redirect:/cms/Homepage";
	}

	@RequestMapping("/ModifyUser")
	public String modifyUser(ModelAndView mav, @ModelAttribute("users") Users u) {
		users = u;
		bankService.modifyUser(users);
		msg = "User Modified Successfully";
		return "redirect:/cms/Homepage";
	}

	@RequestMapping("/AddNewAccountType")
	public String addNewAccountType(ModelAndView mav, @ModelAttribute("accountType") AccountType a) {
		accountType = a;
		bankService.addNewAccountType(a);
		msg = "Account Type Added Successfully";
		return "redirect:/cms/Homepage";
	}

	@RequestMapping("/ModifyAccountType")
	public String modifyAccountType(ModelAndView mav, @ModelAttribute("accountType") AccountType a) {
		accountType = a;
		bankService.modifyAccountType(a);
		msg = "Account Type Modified Successfully";
		return "redirect:/cms/Homepage";
	}

	@RequestMapping("/Homepage")
	public ModelAndView showHomepage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("cms/dashboard");
		return mav;
	}
}
