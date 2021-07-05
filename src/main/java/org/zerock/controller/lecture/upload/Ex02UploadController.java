package org.zerock.controller.lecture.upload;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.awscore.exception.AwsServiceException;
import software.amazon.awssdk.core.exception.SdkClientException;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectAclRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;

@Controller
@RequestMapping("/uploadex02")
@Log4j
public class Ex02UploadController {

	@PostMapping("/sub01")
	public void method01(MultipartFile file) throws Exception {
		
		log.info(file.getOriginalFilename());
		
		// upload 될 위치
		String bucketName = "choongang-choi";
		// credentials 에서 지정한 이름
		String profileName = "spring1";
		S3Client s3 = S3Client.builder()
							 .credentialsProvider(ProfileCredentialsProvider.create(profileName))
							 .build();
		
		
		// aws로 Upload 시켜주는 역할 
		PutObjectRequest objectRequest = PutObjectRequest.builder()
						.bucket(bucketName)
						.key(file.getOriginalFilename())
						.contentType(file.getContentType())
						.acl(ObjectCannedACL.PUBLIC_READ)
						.build();
		
		s3.putObject(objectRequest, RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
	}
}
