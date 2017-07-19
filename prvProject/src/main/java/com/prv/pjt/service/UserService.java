package com.prv.pjt.service;

import javax.servlet.http.HttpSession;

import com.prv.pjt.user.User;

public interface UserService {

//	public boolean loginCheck(User user, HttpSession session);
	
	public User findByUsername(String username);
	
	public void saveUser(User user);
}
