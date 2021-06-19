package com.may.service.userServicefolder;

import com.may.entity.Account;

public interface UserService {
	Account getUserById(String inputUserName, String inputPassword);
}
