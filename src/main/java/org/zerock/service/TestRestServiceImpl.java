package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AddressVO;
import org.zerock.mapper.AddressMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class TestRestServiceImpl implements TestRestService {

	@Setter(onMethod_ =@Autowired)
	private AddressMapper mapper;
	
	
	@Override
	public void register(AddressVO vo) {
		mapper.register(vo);
	}
	
	@Override
	public String getaddress() {
		return mapper.getaddress();
	}

	@Override
	public AddressVO getlatlag1() {

		return mapper.getlatlag1();
	}

	@Override
	public List<AddressVO> getlatlag2(AddressVO vo) {
		return mapper.getlatlag2(vo);
		
		
	}

}
