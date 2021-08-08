use spr1;
SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;


SELECT * FROM TestTime1;

CREATE TABLE TestTime1 (
id int  PRIMARY KEY AUTO_INCREMENT,
dat date 
);

INSERT INTO TestTime1(id, dat)
VALUES(2, date("21-7-20"));

SELECT date_ADD(curdate(), INTERVAL -15 day);

SELECT date_ADD(curdate(), INTERVAL -6 month);

SELECT (TIMESTAMP(CURRENT_DATE) + INTERVAL 9 HOUR);


DELIMITER $$
CREATE PROCEDURE autoDel()
BEGIN
DELETE FROM TestTime1 WHERE dat = date_ADD(curdate(), INTERVAL -15 day);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE autoAdd()
BEGIN
UPDATE TestTime1 SET count = count + 1 WHERE dat = date_ADD(curdate(), INTERVAL -15 day);
UPDATE TestTime1 SET dat = date_add(dat,INTERVAL 15 day) WHERE dat = date_ADD(curdate(), INTERVAL -15 day);
END $$
DELIMITER ;

CREATE EVENT autoAdd
ON SCHEDULE
EVERY 1 DAY
STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 1 HOUR)
DO
CALL autoAdd();

DELIMITER $$
CREATE PROCEDURE autoDel()
BEGIN
DELETE FROM subsCancelList WHERE serviceCancelDate = date_ADD(curdate(), INTERVAL -6 month);
END $$
DELIMITER ;

CREATE EVENT autoDel
ON SCHEDULE
EVERY 1 DAY
STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 1 HOUR)
DO
CALL autoDel();



SHOW CREATE EVENT `autoAdd` ;
DROP event `autoAdd` ;
DROP PROCEDURE `autoAdd`;




