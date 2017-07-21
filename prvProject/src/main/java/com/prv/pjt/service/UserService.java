package com.prv.pjt.service;

import com.prv.pjt.user.User;

public interface UserService {

	public User findByUsername(String username);
	
	public void saveUser(User user);
}
