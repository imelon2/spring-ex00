package org.zerock.controller.lecture.rest;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.controller.lecture.domain.User;

@RequestMapping("/rest02")
//@Controller
//@ResponseBody // 모든 메소드에 붙인 것과 같음
@RestController //위에 두개오 같음
public class Ex02RestController {
	
	@RequestMapping("/sub01")
	public String method01() {
		return "response body1";
	}
	@RequestMapping("/sub02")
	public User mehtod02() {
		User user = new User();
		user.setId("Korea");
		user.setAge(1);
		
		return user;
	}

	@RequestMapping("/sub03")
	public List<String> method03() {
		List<String> list = new ArrayList<>();
		list.add("java");
		list.add("script");
		list.add("SQL");
		
		return list;
	}
	
	@RequestMapping("/sub04")
	public List<User> method04() {
		List<User> list = new ArrayList<User>();
		User user = new User();
		user.setAge(3);
		user.setId("seoul");
		
		list.add(user);
		
		
		
		return list;
		
	}
	
	@RequestMapping("/sun06")
	public Map<String, String> method06() {
		Map<String, String> map = new HashMap<>();
		map.put("k1","v1");
		map.put("k2","v2");
		
		return map;
	}
	
	@RequestMapping("/sub07")
	public Map<String, User> method07() {
		Map<String, User> map = new HashMap<String, User>();
		
		User user = new User();
		user.setId("korea");
		user.setAge(99);
		//     key    value
		map.put("u1", user);
		map.put("u2", user);
		map.put("u3", user);
		
		return map;
		
		
		
	}
}























