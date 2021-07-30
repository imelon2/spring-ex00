package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AddressVO;
import org.zerock.domain.Test2VO;

public interface AddressMapper {
	
	public int register(AddressVO vo);
	
	public String getaddress();

	public AddressVO getlatlag1();

	public List<AddressVO> getlatlag2(AddressVO vo);

	public String getuserid(String userid);

	public Test2VO getBnoInfo(Long bno);
}
