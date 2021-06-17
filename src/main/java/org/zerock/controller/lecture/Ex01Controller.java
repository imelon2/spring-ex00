package org.zerock.controller.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ex01/*") // 여기 경로로 오면 @Controller 가 일을 함
@Log4j
public class Ex01Controller {
	@RequestMapping("/sub01")
	public void method01() {
		log.info("ex1, sub01, method01 실행");
//		System.out.println("ex1, sub01, method01 실행");
	}
	@RequestMapping("/sub02")
	public void mehtod02() {
		log.info("ex01, sub01, sub02");
	}
	
	@RequestMapping(value = "/sub03", method = RequestMethod.GET)
	public void mehtod03() {
		log.info("ex01, sun03, 실행");
	}
	@RequestMapping(value = "/sub03", method = RequestMethod.POST)
	private void method04() {
		log.info("ex01, sub03 post method");
	}
	
	@GetMapping("/sub05") //@RequestMapping(value = "/sub05", method = RequestMethod.GET) 와 같음
	private void method05() {
		log.info("ex01 , sub05 GetMapping");
	}
	
	@PostMapping("/sub06") // @RequestMapping(value = "/sub06", method = RequestMethod.POST) 와 같음
	private void method06() {
		log.info("ex01 , sub06 PostMapping");

	}
}
