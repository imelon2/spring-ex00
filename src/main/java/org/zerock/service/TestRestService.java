package org.zerock.service;

import java.util.List;

import org.zerock.domain.AddressVO;

public interface TestRestService {

	public void register(AddressVO vo);

	public String getaddress();
	
	public AddressVO getlatlag1();

	public List<AddressVO> getlatlag2(AddressVO vo);

}
