USE ISQS6338_Group_09
CREATE TABLE Person (
  ID int NOT NULL,
  Persontype char(1) DEFAULT NULL,
  Firstname char(45) NOT NULL,
  Lastname char(45) NOT NULL,
  PhoneNumber char(12) DEFAULT NULL,
  EmailAddress char(100) DEFAULT NULL,
  Address1 char(70) DEFAULT NULL,
  Address2 char(50) DEFAULT NULL,
  City char(45) DEFAULT NULL,
  State char(2) DEFAULT NULL,
  ZipCode char(5) DEFAULT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE Store (
  ID int NOT NULL,
  Storename char(45) NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE JobTitle (
  ID int NOT NULL,
  TitleName char(50) NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE company (
  ID int NOT NULL,
  Name char(45) DEFAULT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE Customer (
  Person_ID int NOT NULL,
  TimesRented int DEFAULT NULL,
  DrivingLicenceNumber char(50) NOT NULL,
  Store_ID int NOT NULL,
  Company_ID int DEFAULT NULL, 
  PRIMARY KEY (Person_ID),
  CONSTRAINT fk_Customer_Person1 FOREIGN KEY (Person_ID) REFERENCES Person (ID),
  CONSTRAINT fk_Customer_Store1 FOREIGN KEY (Store_ID) REFERENCES Store (ID),
  CONSTRAINT fk_Customer_Company1 FOREIGN KEY (Company_ID) REFERENCES Company(ID)
)

CREATE TABLE Employee (
  Person_ID int NOT NULL,
  MaritalStatus char(45) DEFAULT NULL,
  JobTitle_ID int NOT NULL,
  HireDate date NOT NULL,
  Salary decimal(19,4) NOT NULL,
  VacationHours float DEFAULT NULL,
  SickLeaveHours float DEFAULT NULL,
  SalesPerson BIT DEFAULT NULL,
  SalesYTD char(45) DEFAULT NULL,
  Store_ID int NOT NULL,
  PRIMARY KEY (Person_ID),
  CONSTRAINT fk_Employee_JobTitle1 FOREIGN KEY (JobTitle_ID) REFERENCES JobTitle (ID),
  CONSTRAINT fk_Employee_Person1 FOREIGN KEY (Person_ID) REFERENCES Person (ID),
  CONSTRAINT fk_Employee_Store FOREIGN KEY (Store_ID) REFERENCES Store (ID)
)

CREATE TABLE Make (
  ID int NOT NULL,
  Description char(50) NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE VehicleType (
  ID int NOT NULL,
  Description char(50) NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE CarInventory (
  ID int NOT NULL,
  VehicleModel char(45) NULL,
  LicensePlateNumber char(12) NULL,
  Make_ID int NULL,
  PurchasedYear CHAR(4) NULL,
  VehicleType_ID int NULL,
  RentalChargePerDay FLOAT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT fk_CarInventory_Make1 FOREIGN KEY (Make_ID) REFERENCES Make (ID),
  CONSTRAINT fk_CarInventory_VehicleType1 FOREIGN KEY (VehicleType_ID) REFERENCES VehicleType (ID)
)

CREATE TABLE vehiclefeature (
  ID int NOT NULL,
  Feature varchar(45) NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE carinventory_vehiclefeature (
  CarInventory_ID int NOT NULL,
  VehicleFeatures_ID int NOT NULL,
  PRIMARY KEY (CarInventory_ID,VehicleFeatures_ID),
  CONSTRAINT fk_CarInventory_has_VehicleFeatures_CarInventory1 FOREIGN KEY (CarInventory_ID) REFERENCES carinventory (ID),
  CONSTRAINT fk_CarInventory_has_VehicleFeatures_VehicleFeatures1 FOREIGN KEY (VehicleFeatures_ID) REFERENCES vehiclefeature (ID)
)

CREATE TABLE SpecialOffer (
  ID int NOT NULL,
  OfferName char(50) NOT NULL,
  OfferStartDate date DEFAULT NULL,
  OfferEndDate date DEFAULT NULL,
  DiscountPercent decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE insurance (
  ID int NOT NULL,
  CompanyName char(45) NOT NULL,
  PolicyNumber char(45) NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE creditcard (
  ID int NOT NULL,
  CardType char(45) NOT NULL,
  CardNumber char(20) NOT NULL,
  ExpMonth int NOT NULL,
  ExpYear int NOT NULL,
  DateModified date DEFAULT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE RentOrder (
  ID int NOT NULL,
  RentalDate date DEFAULT NULL,
  ReturnDate date DEFAULT NULL,
  RentalStatus char(45) DEFAULT NULL,
  AccountNumber char(45) DEFAULT NULL,
  SubTotal Float DEFAULT NULL,
  TaxAmt Float DEFAULT NULL,
  TotalDue Float DEFAULT NULL,
  Person_ID int NOT NULL,
  SpecialOffer_ID int DEFAULT NULL,
  Deliver_Person_ID int NOT NULL,
  Insurance_ID int NOT NULL,
  CreditCard_ID int NOT NULL,
  Postrental_Person_ID int DEFAULT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT fk_Order_SpecialOffer1 FOREIGN KEY (SpecialOffer_ID) REFERENCES SpecialOffer (ID),
  CONSTRAINT fk_RentOrder_Employee1 FOREIGN KEY (Deliver_Person_ID) REFERENCES employee (Person_ID),
  CONSTRAINT fk_RentOrder_Employee2 FOREIGN KEY (Postrental_Person_ID) REFERENCES employee (Person_ID),
  CONSTRAINT fk_RentalOrder_Customer1 FOREIGN KEY (Person_ID) REFERENCES Customer (Person_ID),
  CONSTRAINT fk_RentOrder_CreditCard1 FOREIGN KEY (CreditCard_ID) REFERENCES creditcard (ID) ,
  CONSTRAINT fk_RentOrder_Insurance1 FOREIGN KEY (Insurance_ID) REFERENCES insurance (ID) 
)

CREATE TABLE RentOrder_CarInventory (
  RentOrder_ID int NOT NULL,
  CarInventory_ID int NOT NULL,
  PRIMARY KEY (RentOrder_ID,CarInventory_ID),
  CONSTRAINT fk_RentOrder_has_CarInventory_CarInventory1 FOREIGN KEY (CarInventory_ID) REFERENCES CarInventory (ID),
  CONSTRAINT fk_RentOrder_has_CarInventory_RentOrder1 FOREIGN KEY (RentOrder_ID) REFERENCES RentOrder (ID)
)