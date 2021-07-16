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



CREATE table empuser(
    empuserid VARCHAR(50) PRIMARY KEY,
    userpw VARCHAR(500) not null,
    userName VARCHAR(50) not null,
    userAddress VARCHAR(100) not null,
    address VARCHAR(100) not null,
    birthDate DATE DEFAULT now(),
    userPhonenum int(50) not null,
    userEmail VARCHAR(50) not null,
    userSex int(5) not null,
    userNickname VARCHAR(50) not null,
    
    lat DECIMAL(12,7) not null,
    lag DECIMAL(12,7) not null
);


CREATE table user_auth(
   ano int PRIMARY KEY AUTO_INCREMENT,
    userid VARCHAR(50) not null,
    auth VARCHAR(255) not null,
   FOREIGN KEY (userid) REFERENCES user(userid),
   FOREIGN KEY (userid) REFERENCES b2buser(b2buserid),
   FOREIGN KEY (userid) REFERENCES empuser(empuserid)
);

drop TABLE user_auth;


