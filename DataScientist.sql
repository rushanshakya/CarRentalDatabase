select * from CarInventory

select LicensePlateNumber, RentalDate, count(*) as TimesRented from CarInventory CI
inner join RentOrder_CarInventory RC on CI.ID = RC.CarInventory_ID
inner join RentOrder R on RC.RentOrder_ID = R.ID
Group By LicensePlateNumber,RentalDate

Select VehicleModel, LicensePlateNumber from CarInventory CI
left join RentOrder_CarInventory RC on CI.ID = RC.CarInventory_ID
join RentOrder R on RC.RentOrder_ID = R.ID
where RentalStatus NOT IN ('Rented')


select Feature, VehicleModel, count(*) as TimesRented  from vehiclefeature VF
inner join carinventory_vehiclefeature  CV on VF.ID = CV.VehicleFeatures_ID
inner join CarInventory C on CV.CarInventory_ID = C.ID
inner join RentOrder_CarInventory RC on RC.CarInventory_ID = C.ID
inner join RentOrder R on R.ID = RC.RentOrder_ID
Group By Feature, VehicleModel

select rtrim(FirstName) + ' ' + rtrim(LastName) as CustName, VehicleModel, count(*) as TimesRented  
from vehiclefeature VF
inner join carinventory_vehiclefeature  CV on VF.ID = CV.VehicleFeatures_ID
inner join CarInventory C on CV.CarInventory_ID = C.ID
inner join RentOrder_CarInventory RC on RC.CarInventory_ID = C.ID
inner join RentOrder R on R.ID = RC.RentOrder_ID
inner join Customer Cust on Cust.Person_ID = R.Person_ID
inner join Person P on Cust.Person_ID = P.ID
Group By rtrim(FirstName) + ' ' + rtrim(LastName), VehicleModel

select RentalDate, count(*) as NumberRented from CarInventory CI
inner join RentOrder_CarInventory RC on CI.ID = RC.CarInventory_ID
inner join RentOrder R on RC.RentOrder_ID = R.ID
Group By RentalDate

select CI.LicensePlateNumber, C.DrivingLicenceNumber, R.RentalStatus,
RTRIM(Firstname) + ' ' + RTRIM(LastName) as DeliveryEmpName, 
(select RTRIM(Firstname) + ' ' + RTRIM(LastName) from Person
inner join Employee on Person.ID = Employee.Person_ID
right outer join RentOrder on Employee.Person_ID = RentOrder.Postrental_Person_ID
where RentOrder.ID = R.ID) As InspectorEmpName
from Person P
inner join Employee E on P.ID = E.Person_ID
inner join RentOrder R on E.Person_ID = R.Deliver_Person_ID
inner join Customer C on C.Person_ID = R.Person_ID
inner join RentOrder_CarInventory RC on R.ID = RC.RentOrder_ID
inner join CarInventory CI on CI.ID = RC.CarInventory_ID
