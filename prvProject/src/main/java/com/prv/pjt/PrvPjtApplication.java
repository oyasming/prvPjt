package com.prv.pjt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.prv.pjt.controller.PrvPjtController;

@SpringBootApplication
@ComponentScan(basePackageClasses = PrvPjtController.class)
public class PrvPjtApplication {

	public static void main(String[] args) {
		SpringApplication.run(PrvPjtApplication.class, args);
	}
}
