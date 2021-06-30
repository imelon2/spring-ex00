package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies/*")
@AllArgsConstructor
public class ReplyController {

	
	private ReplyService service;
	
	
	
	@PostMapping("/new")
									  // 요청받은 내용을 vo로 전달 역할
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		
		// 등록이 되면 값이 1로 리턴됨
		int cnt = service.register(vo);
		
		if (cnt ==1) {
			return new ResponseEntity<String> ("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String> (HttpStatus.INTERNAL_SERVER_ERROR);	
		}	
	}

	@GetMapping("/pages/{bno}") //경로에서 오는 데이터를 파라미터로 넣으려면 @PathVariable
	public List<ReplyVO> getList(@PathVariable("bno") Long bno) {
		
		return service.getList(bno);
	}
	
	@GetMapping("/{rno}")
	public ReplyVO get(@PathVariable("rno") Long rno) {
		return service.get(rno);
	}
	
//	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	@DeleteMapping("/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		int cnt = service.remove(rno);
		
		if(cnt ==1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
											// 여러개를 사용할 때 {Request.Method.PUT, Request.PATCH)
	@RequestMapping(value="/{rno}", method = RequestMethod.PUT)
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable Long rno) {
		int cnt = service.modify(vo);
		if(cnt ==1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
} 














