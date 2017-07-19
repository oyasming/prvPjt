package com.prv.pjt.service;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.user.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private DataSource dataSource;

	@Value("${spring.queries.auth-query}")
	private String authQuery;

//	@Override
//	public boolean loginCheck(User user, HttpSession session) {
//		// TODO Auto-generated method stub
//		int result = user.getAuthority();
//		System.out.println(result);
//		return false;
//	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}
	
    @Override
    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        System.out.println("Encode pass : " + bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

}
