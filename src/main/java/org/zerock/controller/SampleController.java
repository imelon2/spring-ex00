package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.ToDoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@RequestMapping("/basic01")
	private void basic() {
		log.info("basic........................");

	}

	@RequestMapping(value = "/basic", method = { RequestMethod.GET, RequestMethod.POST })
	private void basicGet1() {
		log.info("basic......GET.............");
	}

	@GetMapping("/basic03")
	private void basicGet2() {
		log.info("basic GET ONLY get................");

	}

	@RequestMapping({ "/basic3", "/basic4" })
	private void basic3() {
		log.info("basic3, basic4...............");
	}

	// 131쪽
	@GetMapping("/ex02")
	private void ex02(@RequestParam("name") String name, @RequestParam("age") int age) {

		log.info("name: " + name);
		log.info("age: " + age);

		log.info("ex02");
	}

	// 132쪽
	@GetMapping("/ex02List")
	private void ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info(ids);
		log.info("ex02List");
	}

	// 133쪽
	@GetMapping("/ex02Array")
	private void ex02Array(@RequestParam("ids") String[] ids) {
		log.info(ids);
		log.info("ex02Array");

	}

	// 130쪽 -->SampleDTO 129p 참고
	@GetMapping("/ex01")
	private void ex01(SampleDTO dto) {
		log.info("" + dto);
		log.info("ex01");

	}

	// 136쪽 --> ToDoDTO
	@GetMapping("/ex03")
	private void ex03(ToDoDTO todo) {
		log.info("todo : " + todo);
		log.info("ex03");
	}
	
	@InitBinder
	private void InitBinder(WebDataBinder binder) {
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false);
	}
}
