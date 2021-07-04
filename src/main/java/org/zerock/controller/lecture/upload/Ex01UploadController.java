package org.zerock.controller.lecture.upload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/upload/*")
@Log4j
public class Ex01UploadController {
// https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/home.html
	// 클라우드로 데이터 전송하는 방법
	
	
	@RequestMapping("/sub01")		// name="ufile"데이터를 받아옴	// file 형식 데이터 받을때
	public void method1(String fname,@RequestParam("ufile") MultipartFile file) {
		log.info(fname);
		log.info(file.getOriginalFilename());
		
		String name = "C:/myworkspace/tempFile/" + file.getOriginalFilename();
		
		try(
			// client -> controller
			InputStream is = file.getInputStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			
			// controller --> client
			FileOutputStream fos = new FileOutputStream(name);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			) {
			int len = 1024;
			byte[] b = new byte[len];
			
			int cnt = 0;
			while((cnt = bis.read(b, 0, len)) != -1) {
				bos.write(b, 0, cnt);
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 이거 써라 이거 파일 보낼때 
	@PostMapping("/sub02")
	public void method02(MultipartFile file) {
		log.info(file.getOriginalFilename());
		String localFilePath = "C:/myworkspace/tempFile/" + file.getOriginalFilename();
		
		
		File localFile = new File(localFilePath);
		
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}





















