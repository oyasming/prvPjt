package com.prv.pjt.service;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.user.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public User findByUsername(String username) {
		return userRepository.findUserByUsername(username);
	}
	
    @Override
    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        Calendar cal = Calendar.getInstance();
        int year = cal.get ( Calendar.YEAR );
        String maxSeq = userRepository.findCurYearMaxSeq();
    	String temp = year + String.format("%04d", (Integer.parseInt(maxSeq) + 1));
    	user.setSeq(Integer.parseInt(temp));
        
        userRepository.save(user);
    }

	@Override
	public void editUser(User user) {
		User originUser;
		if (user.getPassword() == null || "".equals(user.getPassword())) {
			originUser = findByUsername(user.getUsername());
			user.setPassword(originUser.getPassword());
		} else {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		
		userRepository.save(user);
	}
}
