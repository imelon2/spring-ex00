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
SELECT * FROM subsCancelList;

ALTER TABLE cancelSubsBoard ALTER COLUMN bno SET DEFAULT  + 1 ;

DELETE FROM cancelSubsBoard;

