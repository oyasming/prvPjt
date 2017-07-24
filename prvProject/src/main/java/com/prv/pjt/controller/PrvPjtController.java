package com.prv.pjt.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.service.UserService;
//import com.prv.pjt.repository.UserRepository;
import com.prv.pjt.user.User;

@Controller
@RequestMapping("/")
public class PrvPjtController {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserService userService;

	@GetMapping(path= {"/", "index.do"})
	public ModelAndView index(HttpSession session) {
		System.out.println("call index");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userRepository.findUserByUsername(authentication.getName());

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
		User user = userRepository.findUserByUsername(authentication.getName());

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
        System.out.println("login.do username :" + authentication.getName());
        if (authentication.getName() != "anonymousUser" ) {
            modelAndView.addObject("username", authentication.getName());
            modelAndView.setViewName("logout");
        } else {
            modelAndView.setViewName("login");
        }
        
		return modelAndView;
	}
	
	@GetMapping("admin.do")
	public ModelAndView admin(Model model) {
		System.out.println("call admin");
		List<User> list = (List<User>) userRepository.findAll();
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
	public ModelAndView joinUser(@Valid User user, BindingResult bindingResult) {
		System.out.println("call joinUser");
        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findByUsername(user.getUsername());
        if (userExists != null) {
            bindingResult
                    .rejectValue("username", "error.user",
                            "There is already a user registered with the username provided");
        }
        if (bindingResult.hasErrors()) {
        	List<ObjectError> list = bindingResult.getAllErrors();
        	modelAndView.addObject("bindingError", list);
        	for (Iterator<ObjectError> iterator = list.iterator(); iterator.hasNext();) {
				ObjectError objectError = (ObjectError) iterator.next();
				System.out.println(objectError.getDefaultMessage() + " :: " + objectError.getObjectName());
			}
            modelAndView.setViewName("/admin/join");
        } else {
    		userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("redirect:/admin.do");

        }
		return modelAndView;
	}
	
	// TODO ajax 아이디 중복 체크 구현 필요. 될려나
	@PostMapping("duplicateUsernameCheck.do")
	public @ResponseBody Map<String, Object> duplicateUsernameCheck(String username) {
		System.out.println("call duplicateUsernameCheck");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userRepository.findUserByUsername(username) != null) {
			System.out.println("true");
			resultMap.put("result", "true");
		} else {
			System.out.println("false");
			resultMap.put("result", "false");
		}
		return resultMap;
	}

}
