Use Bluedart;

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
    IF NEW.email NOT LIKE '%@%.__%' THEN
        SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:Customer] - email column is not valid';
    END IF;
END;//

insert into Customer values(7,"Demo","SIT","Demogmail",1);

-- For valid phone number

DELIMITER //

CREATE TRIGGER VALID_PH
    BEFORE INSERT
    ON Customer_phonenumber
    FOR EACH ROW
BEGIN
    IF LENGTH(NEW.phonenumber)<10 THEN
        SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:Customer_phonenumber] - PHONE NO. column is not valid';
    END IF;
END;//

insert into Customer_phonenumber values ("555",3);


-- For valid name

DELIMITER //
CREATE TRIGGER VALID_NAME
BEFORE INSERT
ON Customer
FOR EACH ROW
BEGIN
     IF  ISNULL(NEW.name) THEN
        SIGNAL SQLSTATE VALUE '45000'
         SET MESSAGE_TEXT = '[table:Customer] - NAME column is not valid';
     END IF;
END;//

insert into Customer values(8,NULL,"Pune","demo1@gmail.com",5);

-- For checking if the Zipcode is valid

DELIMITER //
CREATE TRIGGER VALID_Zipcode
BEFORE INSERT
ON Zipcode
FOR EACH ROW
BEGIN
    IF NOT LENGTH(NEW.zipcodeid)=10 THEN
        SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:Zipcode] - zipcode is not valid';
    END IF;
END;//

INSERT INTO Zipcode (zipcodeid,state,city) values(7,"maharashtra","Pune");


-- To check for a valid date”
 
DELIMITER //
CREATE TRIGGER VALID_DATE
    BEFORE INSERT
    ON Transfer
    FOR EACH ROW
BEGIN
        IF NOT ISDATE(NEW.date) THEN
        SIGNAL SQLSTATE VALUE '45000'
         SET MESSAGE_TEXT = '[table:Tranfer] - Date is not valid';
    END IF;
END;//
insert into Transfer values (6,"a",'404',"Pickup","RJ 7879",3,4,4,3);
