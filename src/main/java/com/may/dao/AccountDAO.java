package com.may.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.may.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {

}
