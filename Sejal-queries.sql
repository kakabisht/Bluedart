SELECT * from Employee where name= “Shyam”;
SELECT * from employee WHERE branchid = (SELECT branchid  FROM Branch WHERE address="Dholka");
SELECT * FROM Employee WHERE Address='Mahal' OR Address='Haryana';
SELECT * FROM Transfer WHERE parcelid = (SELECT parcelid  FROM Parcel WHERE weight=45);
SELECT * FROM Transfer WHERE employeeid = (SELECT employeeid  FROM employee WHERE address='Haryana');
SELECT * FROM Transfer WHERE Date='2020-08-06';
SELECT * FROM Tracking ORDER BY CurrentTransfer;
select * from employee e inner join transfer t on e.employeeid=t.employeeid where t.parcelid=4;
SELECT * from employee where name like 'S%' and exists (select * from Designation where DesignationType ='Driver');
select * from designation d inner join employee e on d.designationid=e.designationid where e.branchid=2;



delimiter $
create function totalemployees()
returns int
begin
declare employees int unsigned;
select count(*) into employees from employee;
return employees;
end$
delimiter ;
select totalemployees() as "Total Number of Employees";


delimiter $
create function totalparcel()
returns int
begin
declare parcels int unsigned;
select count(*) into parcels from parcel;
return parcels;
return parcels;
end$
delimiter ;
select totalparcel() as "Total Number of Parcel";


delimiter $
create function customers()
returns text
begin
declare customername text;
select name into customername
from customer
where name="Aisha";
return customername;
end$
delimiter ;
select customers() as " Name of Customer";


delimiter $
create function pickdrop()
returns text
begin
declare pd text;
select pickup_or_Drop into pd
from transfer
where date='2020-10-15';
return pd;
end$
delimiter ;
select pickdrop() as " PICKUP OR DROP";

 
delimiter $
create function weight()
returns int
begin
declare wt int;
select weight into wt
from parcel p where p.from_address="Doon";
return wt;
end$$
delimiter ;
select weight() as "Weight";
