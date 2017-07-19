package com.prv.pjt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.service.UserService;
//import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.user.User;

@Controller
@RequestMapping("/")
public class PrvPjtController {
	
	@Autowired
	private UserRepository userDao;
	@Autowired
	private UserService userService;

	@GetMapping(path= {"/", "index.do"})
	public ModelAndView index(HttpSession session) {
		System.out.println("call index");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userDao.findByUsername(authentication.getName());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        if ( user != null)
        	modelAndView.addObject("name", user.getName());

		return modelAndView;
	}
	
	@GetMapping("customer.do")
	public ModelAndView customer(Model model) {
		System.out.println("call customer");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userDao.findByUsername(authentication.getName());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("customer");
        if ( user != null)
        	modelAndView.addObject("name", user.getName());

		return modelAndView;
	}

	@GetMapping("login.do")
	public ModelAndView login(User user, HttpSession session) {
		System.out.println("call login");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        session.setAttribute("username", authentication.getName());
        modelAndView.addObject("username", authentication.getName());
        
		return modelAndView;
	}
	
	@GetMapping("admin.do")
	public ModelAndView admin(Model model) {
		System.out.println("call admin");
		List<User> list = (List<User>) userDao.findAll();
		model.addAttribute("list", list);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/main");

		return modelAndView;
	}
	
	@GetMapping("join.do")
	public String joinView(Model model) {
		System.out.println("call joinView");
				
		return "/admin/join";
	}
	
	@PostMapping(path="joinUser.do")
	public String joinUser(User user) {
		System.out.println("call joinUser");
		System.out.println(user.toString());

		userService.saveUser(user);
		return "redirect:admin.do";
	}

}
