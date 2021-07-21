package org.zerock.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.domain.AddressVO;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.AddressMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.profiles.ProfileFile;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class TestRestServiceImpl implements TestRestService {
	
	private String bucketName;
	private String profileName;
	private S3Client s3;
	
	public TestRestServiceImpl() {
		// upload 될 위치
		this.bucketName = "choongang-choi";
		// credentials 에서 지정한 이름
		this.profileName = "spring1";
		/*  
		 * create
		 *  /home/tomcat/.aws/credentials
		 */
		
		Path contentLocation = new File(System.getProperty("user.home") + "/.aws/credentials").toPath();
		ProfileFile pf = ProfileFile.builder()
				.content(contentLocation)
				.type(ProfileFile.Type.CREDENTIALS)
				.build();
		ProfileCredentialsProvider pcp = ProfileCredentialsProvider.builder()
				.profileFile(pf)
				.profileName(profileName)
				.build();
		
		this.s3 = S3Client.builder()
				.credentialsProvider(pcp)
				.build();
	}
	

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

	@Override
	public void registrerImg(MultipartFile file) {
		
			upload(file);
		
		
	}
	private void upload(MultipartFile file) {
		try (InputStream is = file.getInputStream()){
				
				// aws로 Upload 시켜주는 역할 
				PutObjectRequest objectRequest = PutObjectRequest.builder()
								.bucket(bucketName)
								// 번호별 폴더 안에 파일을 저장시켜서 중복되는걸 막음 : file의 key값에 board.Bno 값을 넣어 key를 바꿔줌 
								// key: 파일이 저장될 위치
								.key("test"+"/" + (file).getOriginalFilename())
								.contentType(file.getContentType())
								.acl(ObjectCannedACL.PUBLIC_READ)
								.build();
				
				s3.putObject(objectRequest, RequestBody.fromInputStream(file.getInputStream(), ((MultipartFile) file).getSize()));
	} catch (Exception e) {
		throw new RuntimeException(e);
	}
}
}
