use spr1;

CREATE TABLE tbl_address (
postcode int,
address VARCHAR(30),
detailAddress VARCHAR(30),
extraAddress VARCHAR(30),
lat DECIMAL(12, 7),
lag decimal(12, 7)
);

SELECT * FROM tbl_address;

CREATE TABLE tbl_member (
id int AUTO_INCREMENT
userid VARCHAR(50) PRIMARY KEY,
userpw VARCHAR(100) NOT NULL,
username VARCHAR(100) NOT NULL,
regdate TIMESTAMP DEFAULT now(),
updateDate TIMESTAMP DEFAULT now(),
enabled TINYINT(1) DEFAULT 1
);

CREATE TABLE tbl_member_auth(
id INT PRIMARY KEY AUTO_INCREMENT,
userid VARCHAR(50) NOT NULL,
auth VARCHAR(50) NOT NULL,
FOREIGN KEY (userid) REFERENCES tbl_member(userid)
);

select * FROM tbl_member;
select * FROM tbl_member_auth;

SELECT
		m.userid userid,
		m.userpw userpw,
		m.username username,
		m.enabled enabled,
		m.regdate regdate,
		m.updateDate updateDate,
		a.auth auth
	FROM
		tbl_member m LEFT JOIN tbl_member_auth a ON m.userid= a.userid
	WHERE
		m.userid= 'admin';
        use spr1;
        
SELECT * FROM tbl_board;
SELECT * FROM tbl_tx_test1;

CREATE TABLE tbl_address (
postcode int,
address VARCHAR(30),
detailAddress VARCHAR(30),
extraAddress VARCHAR(30)
);

SELECT * FROM tbl_address;

SELECT address, lat, lag FROM tbl_address
WHERE (127.1262416 - 0.005 < lat < 127.1262416 + 0.005) AND (37.3653948 - 0.005 < 'lag' < 37.3653948 + 0.005);

SELECT address, lat, lag
FROM tbl_address
WHERE address = "경기 성남시 분당구 수내동 95-13";

