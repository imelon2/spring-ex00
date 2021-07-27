use laundryService;
DESC user_review;
DESC user;

SELECT * FROM user_review;
SELECT * FROM user;
SELECT * FROM b2bIntroduce;

ALTER TABLE user_review
ADD 
FOREIGN KEY (re_writer)
REFERENCES user (userid);



DELETE FROM user_review;
DELETE FROM user_review_file;