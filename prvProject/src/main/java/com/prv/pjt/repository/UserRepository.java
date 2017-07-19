package com.prv.pjt.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.prv.pjt.user.User;

@Repository
public interface UserRepository extends CrudRepository<User, String> {
	User findByUsername(String username);
}