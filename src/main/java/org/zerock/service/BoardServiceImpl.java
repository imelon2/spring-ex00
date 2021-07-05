package org.zerock.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.FileVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.FileMapper;
import org.zerock.mapper.ReplyMapper;


import lombok.Setter;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;


@Service
public class BoardServiceImpl implements BoardService {

	
	private String bucketName;
	private String profileName;
	private S3Client s3;
	
	@Setter (onMethod_ =@Autowired)
	private BoardMapper mapper;
	@Setter (onMethod_ =@Autowired)
	private ReplyMapper replyMapper;
	@Setter (onMethod_ =@Autowired)
	private FileMapper fileMapper;

	
	public BoardServiceImpl() {
		// upload 될 위치
		this.bucketName = "choongang-choi";
		// credentials 에서 지정한 이름
		this.profileName = "spring1";
		this.s3 = S3Client.builder()
				 .credentialsProvider(ProfileCredentialsProvider.create(profileName))
				 .build();
	}
	
	
	
//	@Autowired
//	public BoardServiceImpl(BoardMapper mapper) {
//		this.mapper = mapper;
//	}
	
	
	@Override
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
	}
	
	@Override
	@Transactional
	public void register(BoardVO board, MultipartFile file) {
		// 게시물 등록
		register(board);
		
		// 파일과 함께 게시물 등록
		if(file != null && file.getSize() > 0) {
		upload(board, file);
			
		
		FileVO vo = new FileVO();
		vo.setBno(board.getBno());
		vo.setFileName(file.getOriginalFilename());
		
		fileMapper.insert(vo);
		}
	}
	
	private void upload(BoardVO board, MultipartFile file) {
			try (InputStream is = file.getInputStream()){
					
					// aws로 Upload 시켜주는 역할 
					PutObjectRequest objectRequest = PutObjectRequest.builder()
									.bucket(bucketName)
									// 번호별 폴더 안에 파일을 저장시켜서 중복되는걸 막음 : file의 key값에 board.Bno 값을 넣어 key를 바꿔줌 
									// key: 파일이 저장될 위치
									.key(board.getBno() + "/" + file.getOriginalFilename())
									.contentType(file.getContentType())
									.acl(ObjectCannedACL.PUBLIC_READ)
									.build();
					
					s3.putObject(objectRequest, RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}
	
	@Override
	@Transactional
	public boolean modify(BoardVO board, MultipartFile file) {
		if (file != null & file.getSize() > 0) {
			//s3는 삭제 후 재업로드
				// 옜 정보 갖고와서
				BoardVO oldBoard = mapper.read(board.getBno());
				// 지우고
				removeFile(oldBoard);
				// 새로운 내용 재업로드
				upload(board, file);
			//tbl_board_file는 삭제 후  insert
				//삭제 후 
				fileMapper.deleteByBno(board.getBno());
				
				// 새로운 값을 넣어 
				FileVO vo = new FileVO();
				vo.setBno(board.getBno());
				vo.setFileName(file.getOriginalFilename());
				// 재업로드
				fileMapper.insert(vo);
			
		}
		
		return modify(board);
	}

	@Override
	// 두가지 이상의 일을 메소드에 넣었을 때, 
	// 첫번째가 실행되고 두번째부터 에러가 나면 첫번째 실행을 롤백 시켜줌
	@Transactional
	public boolean remove(Long bno) {		
		// 댓글 삭제
		replyMapper.deleteByBno(bno);
				
		//파일 삭제(s3)
		BoardVO vo = mapper.read(bno);
		removeFile(vo);
		
		//파일 삭제 (db)
		fileMapper.deleteByBno(bno);

		// 게시글 삭제
		return mapper.delete(bno) == 1;
	}
	
	private void removeFile(BoardVO vo) {

		
		String key = vo.getBno() + "/" + vo.getFileName();
		
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(key)
                .build();
        
        s3.deleteObject(deleteObjectRequest);
		
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}


	
}







