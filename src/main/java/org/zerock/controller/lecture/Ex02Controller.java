package org.zerock.controller.lecture;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("ex02/*")
@Log4j
public class Ex02Controller {
	
	@RequestMapping("/sub01")
	private void method01(HttpServletRequest request) {
		log.info("ex02, sub01, method");
		log.info(request);

	}
	
	@RequestMapping("/sub02")
	private void method02(HttpServletRequest req) {
			log.info("ex02, sun02");
			log.info(req.getParameter("id"));
			log.info(req.getParameter("age"));
	}
	
	
	@RequestMapping("/sub03")
	private void method03(@RequestParam("id") String idparam) {   //	String idparam =req.getParameter("id");
		log.info(idparam);
	}
	
	@RequestMapping("/sub04")
	private void method04(@RequestParam("id") String idparam,
						  @RequestParam("age") String ageParam) {
		log.info("ex02 sub04 method04");
		log.info(idparam);
		log.info(ageParam);
	}
	
	@RequestMapping("/sub05")
	// 파라미터를 따로 지정하지 않으면,이름과 같은 파라미터를 넣어줌 
	private void method05(@RequestParam String id,@RequestParam String age) {
		log.info("ex02 sub05 method");
		log.info(age);
		log.info(id);
	}
	
	@RequestMapping("/sub06")
	//타입 형 변환까지 해줌
	private void method06(@RequestParam int age) {
//	int age = Integer.parseInt(request.getParameter("age"));
		log.info("ex02 sub 06 method");
		log.info(age);
	}
	
	@RequestMapping("/sub07")
	private void method07(@RequestParam String[] fav) {
		log.info("ex02 sub07 method");
		for (String f : fav) {
			log.info(f);
		}

	}
	@RequestMapping("/sub08")
	private void method08(@RequestParam List<String> fav) {
		log.info(fav);
		log.info("sun08");
	}
	

}
