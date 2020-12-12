DROP DATABASE IF EXISTS Bluedart;
CREATE DATABASE Bluedart;
USE Bluedart;

-- Company, email and phone number 

DROP TABLE IF EXISTS `Company`;

CREATE TABLE IF NOT EXISTS `Company`
(
 `companyid` int NOT NULL AUTO_INCREMENT ,
 `name`      char NOT NULL ,
 `address`   char NOT NULL ,

PRIMARY KEY (`companyid`)
);


DROP TABLE IF EXISTS `Company_email`;

CREATE TABLE IF NOT EXISTS `Company_email`
(
 `email`     char NOT NULL ,
 `companyid` int NOT NULL ,

PRIMARY KEY (`email`),
KEY `fkIdx_19` (`companyid`),
CONSTRAINT `FK_19` FOREIGN KEY `fkIdx_19` (`companyid`) REFERENCES `Company` (`companyid`)
);


DROP TABLE IF EXISTS `Company_phonenumber`;

CREATE TABLE IF NOT EXISTS `Company_phonenumber`
(
 `companyid`    int NOT NULL ,
 `phone_number` varchar(45) NOT NULL ,

PRIMARY KEY (`phone_number`),
KEY `fkIdx_23` (`companyid`),
CONSTRAINT `FK_23` FOREIGN KEY `fkIdx_23` (`companyid`) REFERENCES `Company` (`companyid`)
);


-- Zipcode

DROP TABLE IF EXISTS `Zipcode`;

CREATE TABLE IF NOT EXISTS `Zipcode`
(
 `zipcodeid` bigint NOT NULL ,
 `state`     char NOT NULL ,
 `city`      char NOT NULL ,

PRIMARY KEY (`zipcodeid`)
);


-- Customer and phonenumber

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE IF NOT EXISTS `Customer`
(
 `customerid` int NOT NULL AUTO_INCREMENT ,
 `name`       char NOT NULL ,
 `address`    char NOT NULL ,
 `email`      char NOT NULL ,
 `zipcodeid`  bigint NOT NULL ,

PRIMARY KEY (`customerid`),
KEY `fkIdx_40` (`zipcodeid`),
CONSTRAINT `FK_40` FOREIGN KEY `fkIdx_40` (`zipcodeid`) REFERENCES `Zipcode` (`zipcodeid`)
);


DROP TABLE IF EXISTS `Customer_phonenumber`;

CREATE TABLE IF NOT EXISTS `Customer_phonenumber`
(
 `phonenumber` varchar(45) NOT NULL ,
 `customerid`  int NOT NULL ,

PRIMARY KEY (`phonenumber`),
KEY `fkIdx_46` (`customerid`),
CONSTRAINT `FK_46` FOREIGN KEY `fkIdx_46` (`customerid`) REFERENCES `Customer` (`customerid`)
);


-- Parcel

DROP TABLE IF EXISTS `Parcel`;

CREATE TABLE IF NOT EXISTS `Parcel`
(
 `parcelid`     int NOT NULL AUTO_INCREMENT ,
 `weight`       int NOT NULL ,
 `from_address` char NOT NULL ,
 `to_address`   char NOT NULL ,

PRIMARY KEY (`parcelid`)
);


-- Branch, phonenumber and vehicle

DROP TABLE IF EXISTS `Branch`;

CREATE TABLE IF NOT EXISTS `Branch`
(
 `branchid`  int NOT NULL AUTO_INCREMENT ,
 `name`      char NOT NULL ,
 `address`   char NOT NULL ,
 `email`     char NOT NULL ,
 `zipcodeid` bigint NOT NULL ,
 `companyid` int NOT NULL ,

PRIMARY KEY (`branchid`),
KEY `fkIdx_113` (`zipcodeid`),
CONSTRAINT `FK_113` FOREIGN KEY `fkIdx_113` (`zipcodeid`) REFERENCES `Zipcode` (`zipcodeid`),
KEY `fkIdx_167` (`companyid`),
CONSTRAINT `FK_167` FOREIGN KEY `fkIdx_167` (`companyid`) REFERENCES `Company` (`companyid`)
);


DROP TABLE IF EXISTS `Branch_phonenumber`;

CREATE TABLE IF NOT EXISTS `Branch_phonenumber`
(
 `phonenumber` varchar(45) NOT NULL ,
 `branchid`    int NOT NULL ,

PRIMARY KEY (`phonenumber`),
KEY `fkIdx_119` (`branchid`),
CONSTRAINT `FK_119` FOREIGN KEY `fkIdx_119` (`branchid`) REFERENCES `Branch` (`branchid`)
);


DROP TABLE IF EXISTS `Branch_vehicle`;

CREATE TABLE IF NOT EXISTS `Branch_vehicle`
(
 `vehicleid` varchar(45) NOT NULL ,
 `branchid`  int NOT NULL ,

PRIMARY KEY (`vehicleid`),
KEY `fkIdx_125` (`branchid`),
CONSTRAINT `FK_125` FOREIGN KEY `fkIdx_125` (`branchid`) REFERENCES `Branch` (`branchid`)
);


-- Designation

DROP TABLE IF EXISTS `Designation`;

CREATE TABLE IF NOT EXISTS `Designation`
(
 `designationid`   int NOT NULL ,
 `designationtype` varchar(45) NOT NULL ,

PRIMARY KEY (`designationid`)
);


-- Employee and phone number

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE IF NOT EXISTS `Employee`
(
 `employeeid`    int NOT NULL AUTO_INCREMENT ,
 `name`          char NOT NULL ,
 `email`         char NOT NULL ,
 `address`       char NOT NULL ,
 `branchid`      int NOT NULL ,
 `designationid` int NOT NULL ,

PRIMARY KEY (`employeeid`),
KEY `fkIdx_128` (`branchid`),
CONSTRAINT `FK_128` FOREIGN KEY `fkIdx_128` (`branchid`) REFERENCES `Branch` (`branchid`),
KEY `fkIdx_137` (`designationid`),
CONSTRAINT `FK_137` FOREIGN KEY `fkIdx_137` (`designationid`) REFERENCES `Designation` (`designationid`)
);

DROP TABLE IF EXISTS `Employee_phonenumber`;

CREATE TABLE IF NOT EXISTS `Employee_phonenumber`
(
 `phonenumber` varchar(45) NOT NULL ,
 `employeeid`  int NOT NULL ,

PRIMARY KEY (`phonenumber`),
KEY `fkIdx_143` (`employeeid`),
CONSTRAINT `FK_143` FOREIGN KEY `fkIdx_143` (`employeeid`) REFERENCES `Employee` (`employeeid`)
);


-- Transfer  

DROP TABLE IF EXISTS `Transfer`;

CREATE TABLE IF NOT EXISTS `Transfer`
(
 `transferid`     int NOT NULL AUTO_INCREMENT ,
 `signature`      char NOT NULL ,
 `date`           date NOT NULL ,
 `pickup_or_drop` char NOT NULL ,
 `vehiclenumber`  varchar(45) NOT NULL ,
 `parcelid`       int NOT NULL ,
 `customerid`     int NOT NULL ,
 `employeeid`     int NOT NULL ,
 `branchid`       int NOT NULL ,

PRIMARY KEY (`transferid`),
KEY `fkIdx_149` (`employeeid`),
CONSTRAINT `FK_149` FOREIGN KEY `fkIdx_149` (`employeeid`) REFERENCES `Employee` (`employeeid`),
KEY `fkIdx_161` (`branchid`),
CONSTRAINT `FK_161` FOREIGN KEY `fkIdx_161` (`branchid`) REFERENCES `Branch` (`branchid`),
KEY `fkIdx_44` (`parcelid`),
CONSTRAINT `FK_44` FOREIGN KEY `fkIdx_44` (`parcelid`) REFERENCES `Parcel` (`parcelid`),
KEY `fkIdx_98` (`customerid`),
CONSTRAINT `FK_98` FOREIGN KEY `fkIdx_98` (`customerid`) REFERENCES `Customer` (`customerid`)
);


-- Payment, type of payment and type of delivery

DROP TABLE IF EXISTS `Payment`;

CREATE TABLE IF NOT EXISTS `Payment`
(
 `paymentid`           int NOT NULL ,
 `discount`            int NOT NULL ,
 `payment_verfication` varchar(45) NOT NULL ,
 `transferid`          int NOT NULL ,
 `paymenttypeid`       int NOT NULL ,
 `deliverytypeid`      int NOT NULL ,

PRIMARY KEY (`paymentid`),
KEY `fkIdx_101` (`transferid`),
CONSTRAINT `FK_101` FOREIGN KEY `fkIdx_101` (`transferid`) REFERENCES `Transfer` (`transferid`),
KEY `fkIdx_170` (`paymenttypeid`),
CONSTRAINT `FK_170` FOREIGN KEY `fkIdx_170` (`paymenttypeid`) REFERENCES `Paymenttype` (`paymenttypeid`),
KEY `fkIdx_173` (`deliverytypeid`),
CONSTRAINT `FK_173` FOREIGN KEY `fkIdx_173` (`deliverytypeid`) REFERENCES `Deliverytype` (`deliverytypeid`)
);


DROP TABLE IF EXISTS `Paymenttype`;

CREATE TABLE IF NOT EXISTS `Paymenttype`
(
 `paymenttypeid` int NOT NULL ,
 `mode_payment`  varchar(45) NOT NULL ,

PRIMARY KEY (`paymenttypeid`)
);


DROP TABLE IF EXISTS `Deliverytype`;

CREATE TABLE IF NOT EXISTS `Deliverytype`
(
 `deliverytypeid` int NOT NULL ,
 `type_delivery`  varchar(45) NOT NULL ,

PRIMARY KEY (`deliverytypeid`)
);


-- Tracking

DROP TABLE IF EXISTS `Tracking`;

CREATE TABLE IF NOT EXISTS `Tracking`
(
 `trackingid`      int NOT NULL AUTO_INCREMENT ,
 `date_sent`       date NOT NULL ,
 `date_received`   date NOT NULL ,
 `currenttransfer` char NOT NULL ,
 `parcelid`        int NOT NULL ,
 `frombranchid`    int NOT NULL ,
 `tobranchid`      int NOT NULL ,

PRIMARY KEY (`trackingid`),
KEY `fkIdx_152` (`parcelid`),
CONSTRAINT `FK_152` FOREIGN KEY `fkIdx_152` (`parcelid`) REFERENCES `Parcel` (`parcelid`),
KEY `fkIdx_200` (`frombranchid`),
CONSTRAINT `FK_200` FOREIGN KEY `fkIdx_200` (`frombranchid`) REFERENCES `Branch` (`branchid`),
KEY `fkIdx_203` (`tobranchid`),
CONSTRAINT `FK_203` FOREIGN KEY `fkIdx_203` (`tobranchid`) REFERENCES `Branch` (`branchid`)
);






 












 







 


 









































