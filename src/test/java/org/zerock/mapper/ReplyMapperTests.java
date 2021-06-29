package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void test() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testInsert() {
		ReplyVO vo = new ReplyVO();
		vo.setReply("댓글");
		vo.setReplyer("user00");
		vo.setBno(33L);
	int cnt = mapper.insert(vo);
		
		assertEquals(1, cnt);
	}
	
	@Test
	public void TestRead() {
		ReplyVO vo = mapper.read(1L);
		
		assertEquals("댓글", vo.getReply());
	}
	
	@Test
	public void TestDelete() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(15L);
		vo.setReply("댓글~~");
		vo.setReplyer("user00");
		
		mapper.insertSelectKey(vo);
		//바로 지우기
		int cnt = mapper.delete(vo.getRno());
		
		assertEquals(1, cnt);
	}
	
	@Test
	public void TestUpdate() {
		ReplyVO vo = mapper.read(15L);
		
		String re = "수정된 댓글";
		vo.setReply(re);
		
		assertEquals(1, mapper.update(vo));
		
		vo = mapper.read(2L);
		assertEquals(re, vo.getReply());
	}
}
