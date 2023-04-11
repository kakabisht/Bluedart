USE Bluedart;

SELECT * FROM Customer WHERE email="HSB@gmail.com";
SELECT * FROM Customer WHERE zipcodeid=2;
SELECT * FROM Customer_phonenumber WHERE customerid=3;

SELECT COUNT(*) FROM Parcel;
SELECT * FROM Parcel WHERE weight >=40;
 

SELECT * FROM Payment WHERE paymenttypeid=1 and deliverytypeid=2;
SELECT * FROM Payment WHERE paymenttypeid=2 and deliverytypeid=2;


SELECT * FROM Company ORDER BY name;
SELECT * FROM Company_email WHERE companyid=1;
SELECT * FROM Company_phonenumber WHERE companyid=2;


DROP procedure IF EXISTS `display_customers`;

DELIMITER $$
USE `Bluedart`$$
CREATE PROCEDURE `display_customers` ()
BEGIN
	SELECT * FROM Customer ;
END$$

DELIMITER ;

USE `Bluedart`;
DROP procedure IF EXISTS `update_adress`;

DELIMITER $$

USE `Bluedart`$$
CREATE PROCEDURE update_adress (IN temp_customerid int, IN new_address char(20))
BEGIN
        UPDATE Customer SET address = new_address WHERE  customerid=temp_customerid;
END$$

DELIMITER ;


USE `Bluedart`;
DROP procedure IF EXISTS `weight_max`;

DELIMITER $$
USE `Bluedart`$$
CREATE PROCEDURE weight_max(OUT highestweight int)
BEGIN
		select max(weight) into highestweight from Parcel;				
END$$

DELIMITER ;

USE `Bluedart`;
DROP procedure IF EXISTS `disp_no_of_transfers`;

DELIMITER $$
USE `Bluedart`$$
CREATE PROCEDURE disp_no_of_transfers(INOUT no_of_transfer integer, IN temp_parcelid int)
BEGIN
		select COUNT(temp_parcelid)
			INTO no_of_transfer FROM Transfer where parcelid = temp_parcelid;   
END$$

DELIMITER ;

USE `Bluedart`;
DROP procedure IF EXISTS `payment_in_cash`;

DELIMITER $$
USE `Bluedart`$$
CREATE PROCEDURE payment_in_cash ()
BEGIN
	SELECT * FROM Payment where paymenttypeid=1 ;
END$$

DELIMITER ;




CALL `Bluedart`.`display_customers`();

CALL `Bluedart`.`update_adress`(1, "Rajpur road");

CALL `Bluedart`.`weight_max`(@M);
select @M; 

CALL `Bluedart`.`disp_no_of_transfers`(@M, 1);
select @M;

CALL `Bluedart`.`payment_in_cash`();





