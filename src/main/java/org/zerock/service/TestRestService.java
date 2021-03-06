package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.domain.AddressVO;
import org.zerock.domain.Test2VO;

public interface TestRestService {

	public void register(AddressVO vo);

	public String getaddress();
	
	public AddressVO getlatlag1();

	public List<AddressVO> getlatlag2(AddressVO vo);

	public void registrerImg(MultipartFile file);

	public String getuserid(String userid);

	public Test2VO getBnoInfo(Long bno);


}
