package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.service.TestRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/tegsTest/*")
@AllArgsConstructor
@Log4j
public class TestTagsController {

	private TestRestService service;
	

	@PostMapping("/teg1")
	public String tagsTest(String userid) {
		log.info(userid);

		String id = service.getuserid(userid);
		log.info(id);
		return service.getuserid(userid);
	}
}
