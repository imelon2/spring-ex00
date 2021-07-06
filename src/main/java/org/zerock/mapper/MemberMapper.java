package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public int insert(MemberVO vo);
	
	public int insertAuth(AuthVO v0);
	
	public MemberVO read(String userid);
}
