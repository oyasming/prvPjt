package com.prv.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.prv.pjt.user.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	User findUserBySeq(int seq);
	User findUserByUsername(String username);
	
	@Query(value = "select ifnull(max(substring(concat(seq), 5, 4)), \'0000\') seq from users WHERE substring(concat(seq), 1, 4) =  year(curdate())", nativeQuery=true)
	String findCurYearMaxSeq();
}