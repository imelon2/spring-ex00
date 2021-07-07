use spr1;

create table persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);

SELECT * FROM persistent_logins;
SELECT * FROM tbl_reply;
SELECT * FROM tbl_member;
SELECT * FROM tbl_board;

ALTER TABLE tbl_board
ADD FOREIGN KEY (writer) REFERENCES tbl_member (userid);

ALTER TABLE tbl_reply
ADD FOREIGN KEY (replyer) REFERENCES tbl_member(userid);



UPDATE tbl_board 
SET writer = 'member';

UPDATE tbl_reply
SET replyer = 'member';

