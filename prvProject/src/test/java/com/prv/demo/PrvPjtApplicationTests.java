package com.prv.demo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.prv.pjt.config.WebMvcConfig;

@RunWith(SpringRunner.class)
@SpringBootTest(value="WebMvcConfig.class")
public class PrvPjtApplicationTests {

    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Test
	public void contextLoads() {
		System.out.println(bCryptPasswordEncoder.encode("1q2w3e4r!"));
	}

}
