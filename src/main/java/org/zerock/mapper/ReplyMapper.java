package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	// key 값을 갔고 오는
	public int insertSelectKey(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getList(Long bno);
	
	public Integer getCountByBno(Long bno);
	
	public int deleteByBno(Long bno);
	
	public void removeByUserid(MemberVO vo);
}
