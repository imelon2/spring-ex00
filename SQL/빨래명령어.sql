use laundryService;
DESC user_review;
DESC user;

ALTER TABLE user_review
ADD FOREIGN KEY (re_writer)
REFERENCES user (userid);

SELECT * FROM b2bIntroduce;

SELECT * FROM storeinfo;

SELECT
	storename storename,
	storeaddress storeaddress,
	storePhonenum storePhonenum, 
	storelat storelat,
	storelag storelag
FROM storeinfo AS s JOIN b2bIntroduce AS b ON s.id = b.id 

WHERE
	  storelat > 127.1261697 - 0.01 AND storelat < 127.1261697 + 0.01 AND
	  storelag > 37.3653048 - 0.01 AND storelag < 37.3653048 + 0.01;