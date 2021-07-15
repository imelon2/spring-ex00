package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.AddressVO;
import org.zerock.service.TestRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test/*")
@AllArgsConstructor
@Log4j
public class TestController {

	private TestRestService service;
	
	@RequestMapping("/test")
	public void test() {
		
	}
	
	@GetMapping("/test1") 
	public void test1() {
		
	}
	
	@PostMapping(value = "/test1", produces = {"text/plain; charset=utf-8"})
	@ResponseBody
	public ResponseEntity<String> test1(Model model) {
		String address = service.getaddress();
		/* log.info(address); */
		
		
		
		
		return new ResponseEntity<String> (address, HttpStatus.OK);
	}
	
	@GetMapping("/test2") 
	public void test2() {
		
	}
	
	@PostMapping(value = "/test2", produces = {"application/json; charset=utf-8"})
	@ResponseBody
	public ResponseEntity<AddressVO> test2(Model model) {
			AddressVO vo =service.getlatlag1();
			/* log.info(vo); */
			
			return new ResponseEntity<AddressVO> (vo, HttpStatus.OK);
		

	}
	
	@PostMapping(value = "/test3", produces = {"application/json; charset=utf-8"})
	@ResponseBody
	public List<AddressVO> test3(@RequestBody AddressVO vo) {
		List<AddressVO> list = service.getlatlag2(vo);
		/* log.info(list); */
		return list;
	}
	
	@GetMapping("/test3")
	public void test3() {
		
	}
}
