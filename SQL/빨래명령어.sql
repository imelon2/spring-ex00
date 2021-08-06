use laundryService;
SET GLOBAL event_scheduler = ON;

DESC user_review;
DESC user_review_file;
DESC user_review_like;
DESC user;
DESC user_auth;
DESC subscriber;
DESC b2bIntroduce;

SELECT * FROM user;
SELECT * FROM user_review;
SELECT * FROM user_auth;
SELECT * FROM b2bIntroduce;
SELECT * FROM storeinfo;
SELECT * FROM subscriber;
SELECT * FROM cancelSubsBoard;

UPDATE subscriber
SET serviceStartDate = '2021.7.22'
WHERE subsId = 'subsuser3';
                        
SELECT
	s.id id,
	s.storeaddress storeaddress,
	s.storename storename,
	s.storePhonenum storePhonenum,
	b.storeinfo storeinfo,
	b.introduce introduce,
	b.fileName fileName
FROM storeinfo AS s  LEFT JOIN b2bIntroduce AS b ON b.id = 5
WHERE s.id = 5;

CREATE TABLE cancelSubsBoard (
bno INT PRIMARY KEY AUTO_INCREMENT,
subsid VARCHAR(50) NOT NULL,
title VARCHAR(50) NOT NULL,
content VARCHAR(1000) NOT NULL,
updatedate TIMESTAMP DEFAULT NOW()

);

ALTER TABLE cancelSubsBoard
ADD FOREIGN KEY (subsid) REFERENCES subscriber(subsId);

