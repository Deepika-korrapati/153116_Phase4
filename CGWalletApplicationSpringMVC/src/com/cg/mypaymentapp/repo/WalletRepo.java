
//WalletRepo Interface

package com.cg.mypaymentapp.repo;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cg.mypaymentapp.beans.Customer;
import com.cg.mypaymentapp.beans.Transactions;

public interface WalletRepo extends JpaRepository<Customer, String>
{
	@Query("select cust from Customer cust where cust.wallet.balance <?1")

	List<Customer> findCustomer(BigDecimal amount);


}
