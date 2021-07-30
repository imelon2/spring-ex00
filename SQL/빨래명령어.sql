use laundryService;
DESC user_review;
DESC user;
DESC user_auth;
DESC subscriber;
DESC b2bIntroduce;
DELETE FROM b2bIntroduce;

SELECT * FROM user_revivew;

SELECT * FROM user_auth;
SELECT * FROM b2bIntroduce;
SELECT * FROM storeinfo;


                        
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