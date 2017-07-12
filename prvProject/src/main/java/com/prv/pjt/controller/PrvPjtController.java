package com.prv.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prv.pjt.repository.UserRepository;
//import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.user.User;

@Controller
@RequestMapping("/")
public class PrvPjtController {
	
	@Autowired
	private UserRepository userDao;

	@GetMapping(path= {"/", "index.do"})
	public String index(Model model) {
		System.out.println("call index");
		return "index";
	}
	
	@GetMapping("customer.do")
	public String customer(Model model) {
		System.out.println("call customer");
		return "customer";
	}
	
	@GetMapping("login.do")
	public String login(Model model) {
		System.out.println("call login");
		return "login";
	}
	
	@GetMapping("admin.do")
	public String admin(Model model) {
		System.out.println("call admin");
		
		List<User> list = (List<User>) userDao.findAll();
		model.addAttribute("list", list);
		
		return "admin";
	}
	
	@GetMapping("join.do")
	public String joinView(Model model) {
		System.out.println("call joinView");
				
		return "join";
	}
	
	@GetMapping(path="joinUser.do")
	public String joinUser(User user) {
		System.out.println("call joinUser");
		System.out.println(user.toString());

		userDao.save(user);
		return "redirect:admin";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public List<User> list(){

		List<User> memberList = (List<User>) userDao.findAll();

		return memberList;

	}
	
	@RequestMapping("/add")
	@ResponseBody
	public User add(User user){

		User userData = userDao.save(user);
		return userData;
	}	

	@RequestMapping("/view/{id}")
	@ResponseBody
	public User view(@PathVariable String id){
		
		User userData = userDao.findOne(id);
		return userData;
	}

}
