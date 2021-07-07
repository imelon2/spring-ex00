Use spr1;
DESC tbl_board_file;

CREATE TABLE tbl_board_file (
	id int PRIMARY KEY AUTO_INCREMENT,
	bno INT REFERENCES tbl_board(bno),
	fileName VARCHAR(200) not NULL
    );


SELECT * FROM tbl_board_file;

DELETE FROM tbl_board_file;

ALTER TABLE tbl_board_file
add FOREIGN KEY (bno) REFERENCES tbl_board(bno);

