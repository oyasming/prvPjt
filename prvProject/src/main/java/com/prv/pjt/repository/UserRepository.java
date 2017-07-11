package com.prv.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prv.pjt.user.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
