package org.zerock.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.AddressVO;
import org.zerock.service.ReplyService;
import org.zerock.service.TestRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/subs/*")
@AllArgsConstructor
public class TestRestController {
	
	private TestRestService service;
	
	@PostMapping("/register")
	public void forward(@RequestBody AddressVO vo) {
		
		log.info(vo);
		service.register(vo);
	}
	
	
	
	

}
