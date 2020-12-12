USE Bluedart;

-- Zipcode
alter table Zipcode modify column state char(20);
alter table Zipcode modify column city char(20);
INSERT INTO Zipcode (zipcodeid,state,city) values(1,"Uttrakhand","Doon"), (2,"karnataka","Bangalore");
INSERT INTO Zipcode (zipcodeid,state,city) values(3,"Rajasthan","Udaipur"), (4,"Madhya Pradesh","Indore");
INSERT INTO Zipcode (zipcodeid,state,city) values(5,"Gujrat","Ahmedabad"), (6,"Maharashtra","Nagpur");


-- Company, email and phone number
alter table Company modify column name char(20);
alter table Company modify column address char(20);
alter table Company_email modify column email char(20);

INSERT INTO Company (companyid,name,address)values(1,"Bluedart","Maharashtra");
INSERT INTO Company_email(email,companyid) values("ceo@bluedart.com",1), ("cto@bluedart.com",1);
INSERT INTO Company_phonenumber(companyid,phone_number) values (1,"11"), (1,"111");

insert into Company_email(email,companyid) values("manager@bluedart.com",1), ("admin@bluedart.com",1);
insert into Company_phonenumber(companyid,phone_number) values (1,"913478211"), (1,"27349209");

insert into Company_email(email,companyid) values("adasd@gmail.com",1), ("gfssde@gmail.com",1);
insert into Company_phonenumber(companyid,phone_number) values (1,"2323453232"), (1,"233215534");

 
-- Branch, email and phone number
alter table Branch modify column name char(30);
alter table Branch modify column address char(30);
alter table Branch modify column email char(30);

INSERT INTO Branch (branchid, name, address, email, zipcodeid, companyid) values(1,"BluedartDoon","EC road","Doon@bluedart.com",1,1), (2,"BluedartBangalore","Hal road","Bangalore@bluedart.com",2,1);
INSERT INTO Branch_phonenumber (phonenumber,branchid) values ("101",1), ("102",1), ("103",2);
INSERT INTO Branch_vehicle (vehicleid,branchid) values ("UK D 7879",1), ("KN B 8798",2);

insert into Branch values(3,"Bluedartudaipur","DN road","UDR@bluedart.com",1,1), (4,"BluedartHyderabad","Queen circle","hyderabad@bluedart.com",2,1);
insert into Branch_phonenumber values ("123445",1), ("345678",1), ("6522345",2);
insert into Branch_vehicle values ("RJ 14 CR 7879",3), ("AP GT 8798",4);
                                                                                                                                    
insert into Branch values(5,"BluedartAhmedabad","Dholka","Ahmedabad@bluedart.com",5,1), (6,"BluedartNagpur","Mahal","Nagpur@bluedart.com",6,1);
insert into Branch_phonenumber values ("98233987229",5), ("33525133434",5), ("6535345335",6);
insert into Branch_vehicle values ("MH A 7689",5), ("BA S 6675",5);


-- Customer and phone number
alter table Customer modify column name char(20);
alter table Customer modify column address char(20);
alter table Customer modify column email char(20);

insert into Customer values(1,"KB","Vasant vihar","KB@gmail.com",1), (2,"HSB", "HAL road","HSB@gmail.com",2);
insert into Customer_phonenumber values ("201",1), ("202",1), ("203",2);

insert into Customer values(3,"harry","sector 14","harryop@gmail.com",1), (4,"hermioeni", "patodi villa","hermioni@gmail.com",2);
insert into Customer_phonenumber values ("775645",3), ("7766",4), ("33445",3);

insert into Customer values(5,"Tina","Itwari","tina@gmail.com",5), (6,"Aisha","Chaoni","aisha@gmail.com",5);
insert into Customer_phonenumber values ("4534653432",5), ("54232564522",5), ("54334367676",6);


-- Parcel
alter table Parcel modify column from_address char(20);
alter table Parcel modify column to_address char(20);

insert into Parcel values(1,20,"Doon","Bangalore"),(2,30,"Bangalore"," Doon");

insert into Parcel values(3,24,"UDR","hyderabad"),(4,31,"Bangalore","Indore");

insert into Parcel values(5,45,"Bandra","Andheri"),(6,34,"Chaoni"," Juhu");
 
 
--  Tracking  
alter table Tracking modify column currenttransfer char(20);

insert into Tracking values(1,'2020-10-11','2020-08-20',"Flight",1,2,3), (2,'2020-08-11','2020-06-15',"Train",2,1,4);

insert into Tracking values(3,'2020-10-12','2020-08-25',"Travel bus",1,1,5), (4,'2020-06-16','2020-07-18',"Train",2,2,6);

insert into Tracking values(5,'2020-08-11','2020-08-20',"Road",3,4,2), (6,'2020-06-08','2020-06-15',"Road",6,5,2);
 
 
-- Designation
insert into Designation values(1,"Manager"), (2,"Accountant");

insert into Designation values(3,"Packer"), (4,"Receiptionist");

insert into Designation values(5,"Driver"), (6,"Delivery Boy");


-- Employee and phone enumber
alter table Employee modify column name char(20);
alter table Employee modify column email char(20);
alter table Employee modify column address char(20);

insert into Employee values(1,"Raju","raju@gmail.com","Doon",1,2), (2,"Kaju","kaju@gmail.com","Bangalore",2,1);
insert into Employee_phonenumber values ("300",1), ("301",1), ("302",2);

insert into Employee values(3,"guddu","guddu@gmail.com","UDR",1,2), (4,"Bablu","Bablu@gmail.com","Hyderabad",2,1);
insert into Employee_phonenumber values ("88776",3), ("33445",4), ("34543",3);

insert into Employee values(5,"Ramesh","ramesh@gmail.com","Haryana",5,6), (6,"Shyam","shyam@gmail.com","Pune",6,5);
insert into Employee_phonenumber values ("4542456767",5), ("545453464",5), ("4545654544",6);


-- Transfer
alter table Transfer modify column signature char(20);
alter table Transfer modify column pickup_or_Drop char(20);

insert into Transfer values (1,"a",'2020-10-06',"Pickup","UK D 7879",1,1,2,1),(2,"b",'2020-12-04',"Drop","KN B 8798",2,2,1,1);

insert into Transfer values (3,"a",'2020-10-15',"Pickup","RJ 14 D 7879",3,4,4,3),(4,"b",'2020-12-04',"Drop","AP SE 8798",4,3,3,4);

insert into Transfer values (5,"a",'2020-08-06',"Pickup","MH A 7689",5,5,6,5),(6,"b",'2020-02-04',"Drop","BA S 6675",6,6,5,5);


-- Payment, type and delivery type


insert into Paymenttype values(1,"Cash"), (2,"Card");
insert into Paymenttype values(3,"Paytm"), (4,"Google Pay");
insert into Paymenttype values(5,"UPI"),(6,"BlueDart Coins");

insert into Deliverytype values(1,"Base"), (2,"Prime");
insert into Deliverytype values(3,"Drone"), (4,"Underground");
insert into Deliverytype  values(5,"Speed Post"),(6,"SIT");


insert into Payment values(1,0,"Yes",1,2,2), (2,10,"Yes",2,1,1);
insert into Payment values(3,4,"Yes",4,4,4), (4,3,"Yes",4,3,3);
insert into Payment values(5,10,"Yes",5,6,6), (6,5,"Yes",5,5,5);


