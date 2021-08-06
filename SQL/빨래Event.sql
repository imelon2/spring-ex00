use laundryService;

SELECT * FROM user;
SELECT * FROM user_revivew;
SELECT * FROM user_auth;
SELECT * FROM b2bIntroduce;
SELECT * FROM storeinfo;
SELECT * FROM subscriber;

SELECT date_add('2021-07-22', INTERVAL 15 day);

DELIMITER $$
CREATE PROCEDURE autoAdd()
BEGIN
UPDATE subscriber SET payCount = payCount + 1 WHERE serviceStartDate = date_ADD(curdate(), INTERVAL -15 day);
UPDATE subscriber SET serviceStartDate = date_add(serviceStartDate,INTERVAL 15 day) WHERE serviceStartDate = date_ADD(curdate(), INTERVAL -15 day);
END $$
DELIMITER ;

CREATE EVENT autoAdd
ON SCHEDULE
EVERY 1 DAY
STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 9 HOUR)
DO
CALL autoAdd();
