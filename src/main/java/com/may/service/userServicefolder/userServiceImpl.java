package com.may.service.userServicefolder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.may.dao.AccountDAO;
import com.may.entity.Account;

@Service
public class userServiceImpl implements UserService {

	@Autowired
	AccountDAO accountDao;

	@Override
	public Account getUserById(String inputUserName, String inputPassword) {
		try {
			
			return accountDao.findByUsernameAndPassword(inputUserName, inputPassword);
			
		} catch (Exception e) {
			return null;
		}
	}
}
