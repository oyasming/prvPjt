package com.prv.pjt.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
        User userExists = userService.findByUsername(authentication.getName());

        ModelAndView modelAndView = new ModelAndView();
//        System.out.println("login.do username :" + authentication.getName());
        if (authentication.getName() != "anonymousUser" ) {
            modelAndView.addObject("username", userExists.getUsername());
            modelAndView.addObject("seq", userExists.getSeq());
            modelAndView.setViewName("logout");
        } else {
            modelAndView.setViewName("login");
        }
        
		return modelAndView;
	}
	
	@GetMapping("admin.do")
	public ModelAndView admin(@PageableDefault(sort = { "seq" }, direction = Direction.ASC, size = 10) Pageable pageable) {
		System.out.println("call admin");
		Page<User> list = (Page<User>) userRepository.findAll(pageable);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("list", list);
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
	
	@PostMapping("duplicateUsernameCheck.do")
	public @ResponseBody Map<String, Object> duplicateUsernameCheck(String username) {
		System.out.println("call duplicateUsernameCheck :: [" + username + "] " + (userRepository.findUserByUsername(username) != null));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userRepository.findUserByUsername(username) != null || username.length() < 6) {
			System.out.println("true");
			resultMap.put("result", "true");
		} else {
			System.out.println("false");
			resultMap.put("result", "false");
		}
		return resultMap;
	}
	
	@GetMapping("view.do/{seq}")
	public ModelAndView onlyViewUser(@PathVariable int seq) {
		System.out.println("call " + seq + "/viewEdit");
        ModelAndView modelAndView = new ModelAndView();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User userExists = userRepository.findUserBySeq(seq);
        
        if (userExists == null) {
        	//System.out.println("none");
            //modelAndView.addObject("errorMessage", "사용자를 찾을 수 없습니다.");
            modelAndView.setViewName("redirect:/logoutProcess.do");
        } else if (userExists != null && !checkAdminOrUserAuth(authentication, userExists)) {
            //modelAndView.addObject("errorMessage", "권한 없는 요청입니다.");
            modelAndView.setViewName("redirect:/logoutProcess.do");
        } else {
            modelAndView.addObject("user", userExists);
            modelAndView.setViewName("/userView");
        }
		return modelAndView;
	}

	@GetMapping("edit.do/{seq}")
	public ModelAndView viewUser(@PathVariable int seq) {
		System.out.println("call " + seq + "/viewEdit");
        ModelAndView modelAndView = new ModelAndView();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User userExists = userRepository.findUserBySeq(seq);
        
        if (userExists == null) {
        	//System.out.println("none");
            modelAndView.setViewName("redirect:/logoutProcess.do");
        } else if (userExists != null && !checkAdminOrUserAuth(authentication, userExists)) {
            modelAndView.setViewName("redirect:/logoutProcess.do");
        } else {
            modelAndView.addObject("user", userExists);
            modelAndView.setViewName("/edit");
        }
		return modelAndView;
	}
	
	@PostMapping("edit.do/{seq}")
	public ModelAndView editUser(@PathVariable int seq,@Valid User user,BindingResult bindingResult) {
		System.out.println("call " + seq + "/Edit");
        ModelAndView modelAndView = new ModelAndView();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User userExists = userService.findByUsername(user.getUsername());
        User userOrigin = userRepository.findUserBySeq(seq);
        
        if (checkAdminOrUserAuth(authentication, userOrigin)) {
            modelAndView.setViewName("redirect:/logoutProcess.do");
        }
        
        if (userExists != null && userOrigin.getSeq() != userExists.getSeq()) {
            bindingResult
                    .rejectValue("username", "error.user",
                            "There is already a user registered with the username provided");
        }
        if (bindingResult.hasErrors()) {
        	List<FieldError> list = bindingResult.getFieldErrors();
        	modelAndView.addObject("bindingError", list);
        	int errCnt = bindingResult.getErrorCount();
        	
        	/********************************//*
        	System.out.println("hasErrorPass : " + bindingResult.hasFieldErrors("password"));
        	Map<String, Object> map = bindingResult.getModel();
        	Set<String> keySet = map.keySet();
        	Iterator<String> iterator = keySet.iterator();
			while (iterator.hasNext()) {
				String key = iterator.next();
				Object value = map.get(key);
				System.out.printf("key : %s , value : %s %n", key, value);
			}*/
        	/********************************/
        	boolean passwordEmpty = false;
        	for (Iterator<FieldError> iiterator = list.iterator(); iiterator.hasNext();) {
				ObjectError objectError = (FieldError) iiterator.next();
				System.out.println("DefaultMessage : " + objectError.getDefaultMessage() + " :: code = " + objectError.getCode() + " :: object = " + objectError.getObjectName());
				//System.out.println(objectError.getCode().equals("NotEmpty"));
				//System.out.println(objectError.getDefaultMessage().equals("*Please provide an password"));
				errCnt++;
				if (objectError.getCode().equals("NotEmpty") && objectError.getDefaultMessage().equals("*Please provide an password")) {
					passwordEmpty = true;
				}
			}
        	if ((errCnt == 2 && passwordEmpty) || !passwordEmpty) {
				userService.editUser(user);
        	}
    		System.out.println("errCnt : " + errCnt + ", passwordEmpty : " + passwordEmpty);
    		
            modelAndView.setViewName(getAuthorityInAuthentication(authentication) == 2 ? "redirect:/login.do" : "redirect:/admin.do");
        } else {
    		userService.editUser(user);
            modelAndView.setViewName(getAuthorityInAuthentication(authentication) == 2 ? "redirect:/login.do" : "redirect:/admin.do");
        }
		return modelAndView;
	}
	
	private boolean checkAdminOrUserAuth(Authentication authentication, User user) {
		
        int auth = getAuthorityInAuthentication(authentication);
        
        if (auth > 1 && !authentication.getName().equals(user.getUsername())){
    		return false;
        } else {
        	return true;
        }
	}
	
	private int getAuthorityInAuthentication(Authentication authentication) {
		Iterator<GrantedAuthority> iter = (Iterator<GrantedAuthority>) authentication.getAuthorities().iterator();
        int auth = 2;
        while (iter.hasNext()) {
        	auth = Integer.parseInt(iter.next().toString());
		}
		return auth;
	}
}
