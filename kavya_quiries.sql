SELECT * FROM Branch WHERE name="Bluedartudaipur"
SELECT * FROM Branch WHERE branchid="1"
SELECT branchID FROM Branch WHERE name = "BluedartDoon"

SELECT branchID FROM Branch_vehicle WHERE vehicleid="UK D 7879"
SELECT phonenumber FROM Branch_phonenumber WHERE branchid = "2" 
SELECT name FROM Branch WHERE email = "UDR@bluedart.com"

SELECT  zipcodeID  FROM Branch WHERE name="Bluedartudaipur" 

-- For email verification

DELIMITER //
CREATE TRIGGER EMAIL_VERIFICATION
BEFORE INSERT 
ON Customer
FOR EACH ROW
BEGIN 
    IF NEW.email NOT LIKE '%_@%_.__%' THEN
		SET MESSAGE ("email is not valid");
    END IF;
END;//


-- For valid phone number

DELIMITER //
CREATE TRIGGER VALID_PH
BEFORE INSERT 
ON Customer_phonenumber
FOR EACH ROW
BEGIN 
    IF LENGTH(NEW.phonenumber)<10 THEN
		SET MESSAGE("must be 10 digit no");
    END IF;
END;//


-- For valid name

DELIMITER //
CREATE TRIGGER VALID_NAME
BEFORE INSERT 
ON Customer
FOR EACH ROW
BEGIN 
    IF  ISNULL(NEW.name) THEN
		SET MESSAGE("enter valid name");
    END IF;
END;//

-- For checking if the Zipcode is valid

DELIMITER //
CREATE TRIGGER VALID_STATE
BEFORE INSERT 
ON Zipcode
FOR EACH ROW
BEGIN 
    IF  LENGTH(NEW.state) IS NOT 2 THEN
		SET MESSAGE("Invalid State");
    END IF;
END;//

-- To check for a valid date”
 
DELIMITER //
CREATE TRIGGER VALID_DATE
BEFORE INSERT 
ON Transfer
FOR EACH ROW
BEGIN 
    IF NOT ISDATE(NEW.date) THEN
		SET MESSAGE("Date is not valid");
    END IF;
END;//

