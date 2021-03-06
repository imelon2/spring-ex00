package org.zerock.controller;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.coolsms.Coolsms;
import org.zerock.domain.AddressVO;
import org.zerock.domain.Test2VO;
import org.zerock.domain.TestVO;
import org.zerock.domain.smsVO;
import org.zerock.service.TestRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;

@Controller
@RequestMapping("/test/*")
@AllArgsConstructor
@Log4j
public class TestController {

	private TestRestService service;
	
	 @GetMapping("/test6") 
	 public void test6() {
	 
	 }
	
	
	@PostMapping("/test6")
	@ResponseBody
	public Test2VO test6(Long bno) {

		Test2VO vo = service.getBnoInfo(bno);

		
		return vo;

		
	
		
	}
	
	@RequestMapping("/test7/{bno}")
	public String test7(@PathVariable("bno") Long bno,RedirectAttributes rttr) {
		service.getBnoInfo(bno);
		Test2VO vo = service.getBnoInfo(bno);
		log.info(vo);
		rttr.addFlashAttribute("bno", vo.getBno());
		rttr.addFlashAttribute("title",vo.getTitle());
		rttr.addFlashAttribute("content", vo.getContent());
		return "redirect:/test/test7";
	}
	
	@GetMapping("/test7") 
	 public void test7() {
	 
	 }
	
	
	@RequestMapping("/test")
	public void test() {

	}

	@GetMapping("/test1")
	public void test1() {

	}

	@PostMapping(value = "/test1", produces = { "text/plain; charset=utf-8" })
	@ResponseBody
	public ResponseEntity<String> test1(Model model) {
		String address = service.getaddress();
		/* log.info(address); */

		return new ResponseEntity<String>(address, HttpStatus.OK);
	}

	@GetMapping("/test2")
	public void test2() {

	}

	@PostMapping(value = "/test2", produces = { "application/json; charset=utf-8" })
	@ResponseBody
	public ResponseEntity<AddressVO> test2(Model model) {
		AddressVO vo = service.getlatlag1();
		log.info(vo);

		return new ResponseEntity<AddressVO>(vo, HttpStatus.OK);

	}

	@PostMapping(value = "/test3", produces = { "application/json; charset=utf-8" })
	@ResponseBody
	public List<AddressVO> test3(@RequestBody AddressVO vo) {
		List<AddressVO> list = service.getlatlag2(vo);
		/* log.info(list); */
		return list;
	}

	@GetMapping("/test3")
	public void test3() {

	}

	@GetMapping("/test4")
	public void test4() {

	}

	@PostMapping(value = "/registrerImg", produces = { "application/json; charset=utf-8" })
	@ResponseBody
	public void registrerImg(TestVO vo, @RequestParam("file1") MultipartFile file) {
		log.info(vo);

		service.registrerImg(file);
	}

	@RequestMapping("/testsms")
	public void test5() {

	}

	@PostMapping(value = "/sendSms.do", produces = { "application/json; charset=utf-8" })
	@ResponseBody
	public String sendSms(smsVO vo) throws Exception {
		log.info(vo);
		String api_key = "NCSMBWEGADMZITWJ";
		String api_secret = "9MDPLWJRA5UJBHFOKDR9HJB022B35Z5Q";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();

		set.put("to", vo.getTo()); // ?????? ??????
		set.put("from", "01037278235"); // ????????????
		set.put("text", "??????????????? ??????????????? [" + vo.getText() + "]?????????"); // ????????????
		set.put("type", "sms"); // ?????? ??????
		

		JSONObject result = coolsms.send(set); // ?????????&??????????????????

		if ((boolean) result.get("status") == true) {
			// ????????? ????????? ?????? ??? ???????????? ??????
			System.out.println("??????");
			System.out.println(result.get("group_id")); // ???????????????
			System.out.println(result.get("result_code")); // ????????????
			System.out.println(result.get("result_message")); // ?????? ?????????
			System.out.println(result.get("success_count")); // ??????????????????
			System.out.println(result.get("error_count")); // ????????? ????????? ????????? ????????? ???
		} else {
			// ????????? ????????? ??????
			System.out.println("??????");
			System.out.println(result.get("code")); // REST API ????????????
			System.out.println(result.get("message")); // ???????????????

		}
		return "suc";

	}
	
	@RequestMapping("/test8")
	public void googleAPI() {
		
	}

}
