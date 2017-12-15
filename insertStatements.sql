USE ISQS6338_Group_09

--Person table data
INSERT INTO person VALUES (1001,'I','Rex','McRobb','218-256-8978','rexmcrobb@yahoo.com','1 Laurel Terrace','Apt 3358','Lubbock','TX','79415'),(1002,'I','Ailee','Baudi','314-547-8523','aileebaudi@aol.com','60906 Holmberg Hill',NULL,'Lubbock','TX','79401'),(1003,'I','Shandra','Angeli','512-678-9851','shandra@gmail.com','2271 Foster Circle',NULL,'Lubbock','TX','79403'),(2004,'E','Wilfrid','Lampitt','608-879-9845','wilfrid.lampitt@carrental.com','365 Huxley Drive',NULL,'Lubbock','TX','79405'),(2005,'E','Nevsa','Sircomb','214-806-2586','nevsa.sircomb@carrental.com','369 Indiana Avenue',NULL,'Lubbock','TX','79409'),(2006,'E','Orelle','Vankeev','325-456-7894','orelle.vankeev@carrental.com','458 Frankford Avenue','Apt 658','Lubbock','TX','79415'),(3007,'C','Abeu','Ravilus','806-321-5467','abeu.ravilus@ttu.edu','3005 Boston Avenue',NULL,'Lubbock','TX','79401'),(3008,'C','Natasha','Taedu','806-987-5641','natasha.taedu@covenant.org','1001 Hangover Drive','Apt 36','Lubbock','TX','79410');

--Store Table data
INSERT INTO store VALUES (1,'University Avenue Store'),(2,'Airport Store');

--JobTitle table data
INSERT INTO jobtitle VALUES (1,'Sales Associate'),(2,'Store Manager');

--Company Table data
INSERT INTO company VALUES (1,'Texas Tech University'),(2,'Covenant Health Systems');

--Customer table data
INSERT INTO customer VALUES (1001,2,'36521',1,NULL),(1002,1,'78521',1,NULL),(1003,1,'56985',2,NULL),(3007,2,'58971',2,1),(3008,1,'60214',2,2);

--Employee tables data
INSERT INTO employee VALUES (2004,'Single',1,'2015-10-20',36000.0000,'0','8',1,'98000',2),(2005,'Single',1,'2016-12-30',25000.0000,'0','8',1,'56000',1),(2006,'Married',2,'2015-10-20',68000.0000,'40','16',0,'256000',1);

--Make table data
INSERT INTO make VALUES (1,'Toyota'),(2,'Honda'),(3,'Ford');

--VehicleType Table data
INSERT INTO vehicletype VALUES (501,'Compact'),(502,'Mid-Sized'),(503,'Premium');

-- CarInvenory Table data
INSERT INTO carinventory VALUES (1,'Camry LE','WER-1234',1,'2015',502,9.99),(2,'Corolla LE','XDS-2536',1,'2016',501,9.99),(3,'Accord Sport','YWD-5871',2,'2015',502,9.99),(4,'Civic','CDF-7894',2,'2017',501,9.99),(5,'Element','VXY-5454',2,'2017',502,9.99),(6,'Focus','WPO-5478',3,'2017',501,9.99),(7,'Mustang GT','CYY-1237',3,'2017',503,9.99);

--VehicleFeature table data
INSERT INTO vehiclefeature VALUES (10,'Moon Roof'),(11,'Satellite Radio'),(12,'GPS Navigation System'),(13,'Leather Seats');

--CarInventory_VehicleFeature table data
INSERT INTO carinventory_vehiclefeature VALUES (1,10),(1,11),(1,12),(1,13),(2,12),(2,13),(3,10),(4,11),(5,12),(6,12),(6,13),(7,10),(7,12),(7,13);

--SpecialOffer table data
INSERT INTO specialoffer VALUES (3007,'Texas Tech Employee Discount','2015-01-01','2030-12-31',8.50),(3008,'Covenent Health System Employee Discount','2016-01-01','2031-12-31',9.99);

--Insurance table data
INSERT INTO insurance VALUES (501,'State Farm Insurance','35-TX-56-6V'),(502,'GEICO Insurance','58-68-C-TX-69'),(503,'AllState Insurance','102-586-6698'),(504,'Goosehead Insurance','25-A-203-98-TX'),(505,'General Insurance','58-69-41-TX-A');

--CreditCard Table data
INSERT INTO creditcard VALUES (1001,'VISA','2937-8162-9273-9723',1,2020,'2017-11-18'),(1002,'VISA','4428-1234-5678-9012',2,2022,NULL),(1003,'MASTERCARD','5466-1601-2345-6789',3,2022,NULL),(3007,'MASTERCARD','5425-1234-5678-8888',4,2020,'2017-11-18'),(3008,'AMEX','3579-876543-21001',5,2021,NULL);

--RentOrder Table data
INSERT INTO rentorder VALUES (1,'2015-07-05','2015-07-06','Returned','123-456-25','110','8.8','118.8',1001,NULL,2004,501,1001,2005),(2,'2016-09-20','2016-09-22','Returned','123-456-26','120','9.6','129.6',1001,NULL,2005,501,1001,2004),(3,'2015-05-26','2015-05-28','Returned','123-456-27','240','19.2','259.2',1002,NULL,2005,502,1002,2004),(4,'2017-06-01','2017-06-02','Returned','123-456-29','80','6.4','86.4',1003,NULL,2004,503,1003,2005),(5,'2016-08-20','2016-08-27','Returned','123-456-30','360','28.8','388.8',3007,3007,2006,504,3007,2006),(6,'2017-12-05',NULL,'Rented','123-456-31',NULL,NULL,NULL,3007,3007,2006,504,3007,NULL),(7,'2017-12-05',NULL,'Rented','123-456-32',NULL,NULL,NULL,3008,3008,2004,505,3008,NULL);

--RentOrder_CarInventory table value
INSERT INTO rentorder_carinventory VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,5),(7,7);



