package com.cg.mypaymentapp.controllers;

import java.math.BigDecimal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cg.mypaymentapp.beans.Customer;
import com.cg.mypaymentapp.beans.Transactions;
import com.cg.mypaymentapp.exception.CustomerDetailsNotFoundException;
import com.cg.mypaymentapp.exception.InsufficientBalanceException;
import com.cg.mypaymentapp.service.WalletService;

@Controller
public class CustomerActionController {

	@Autowired
	WalletService walletService;

	@RequestMapping(value="/registerCustomer")
	public ModelAndView registerCustomer(@Valid @ModelAttribute("customer")Customer customer,BindingResult result) {
		if(result.hasErrors())
			return new ModelAndView("registrationPage");
		customer=walletService.createAccount(customer);
		return new ModelAndView("registrationSuccessPage", "customer",customer);}

	@RequestMapping(value="/loginCustomer" ,method=RequestMethod.POST)
	public ModelAndView loginCustomer(@RequestParam("mobileNo") String mobileNo) {

		try {
			Customer customer=walletService.showBalance(mobileNo);
			return new ModelAndView("loginSuccessPage", "customer",customer);
		} catch (CustomerDetailsNotFoundException e) {
			return new ModelAndView("loginPage","errorMessage",e.getMessage());
		}
	}

	@RequestMapping(value="/fundTransferAction")
	public ModelAndView fundTransfer(@RequestParam("smobileNo")String smobileNo,@RequestParam("tmobileNo")String tmobileNo,@RequestParam("amount")BigDecimal amount) {	
		try {
			Customer customer1=walletService.fundTransfer(smobileNo,tmobileNo,amount);
			return new ModelAndView("currentbalance", "customer",customer1);
		} catch (InsufficientBalanceException e) {
			return new ModelAndView("fundTransfer","errorMessage",e.getMessage());
		}}

	@RequestMapping(value="/depositAmount")
	public ModelAndView depositBalance(@ModelAttribute("customer")Customer customer,@RequestParam("wallet.balance")BigDecimal amount) {
		Customer customer1=walletService.depositAmount(customer.getMobileNo(),amount);
		return new ModelAndView("currentbalance", "customer",customer1);}

	@RequestMapping(value="/withdrawAmount")
	public ModelAndView withdrawBalance(@RequestParam("mobileNo") String mobileNo,@RequestParam("wallet.balance")BigDecimal amount) {
		try {
			Customer customer1=walletService.withdrawAmount(mobileNo,amount);
			return new ModelAndView("currentbalance", "customer",customer1);
		} catch (InsufficientBalanceException e) {
			return new ModelAndView("withdraw", "errorMessage",e.getMessage());	
		}

	}

	@RequestMapping(value="/printAllCustomers")
	public ModelAndView PrintAll() {
		List<Customer> customer= walletService.getAllCustomers();
		return new ModelAndView("viewAll","customer",customer);}

	@RequestMapping(value="/printCustomers")
	public ModelAndView PrintCustomers() {
		List<Customer> customer= walletService.getCustomers();
		return new ModelAndView("viewSome","customer",customer);}

	@RequestMapping(value="/printTransaction")
	public ModelAndView printtrans(@RequestParam("mobileNo")String mobileNo) {
		List<Transactions> transaction=walletService.recentTransactions(mobileNo);
		return new ModelAndView("printTransaction","transactions",transaction);}}
