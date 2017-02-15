use HarkhjotTravels

--------------------------------------ADD NEW BUSES----------STORED PROCEDURE--------------------------------------
create procedure proc_addBus(
@BusNumber varchar(10),
@StartPoint varchar(30),
@Destination varchar(30),
@capacity int,
@DepartureTime varchar(15),
@ArrivalTime varchar(15),
@CompanyName varchar(30),
@BusType varchar(30)
)
as begin 
insert into Bus values(
@BusNumber,
@StartPoint,
@Destination,
@capacity,
@DepartureTime,
@ArrivalTime,
@CompanyName,
@BusType
)
end

-----------------------------------VIEW BUS ADMIN--------------------------------------------------------
create procedure proc_viewBusDetailsAdmin
as begin
select * from Bus
end

-----------------------------------DELETE BUS-------------------------------
create procedure proc_deleteBus(
@BusNumber varchar(10)
)
as begin
delete from Bus where BusNumber = @BusNumber
end

---------------------------------EDIT BUS DETAILS-----------------------------------
create procedure proc_editBus(
@BusNumber varchar(10),
@StartPoint varchar(30),
@Destination varchar(30),
@capacity int,
@DepartureTime varchar(15),
@ArrivalTime varchar(15),
@CompanyName varchar(30),
@BusType varchar(30)
)
as begin 
update Bus set
BusNumber = @BusNumber,
StartPoint = @StartPoint, 
Destination = @Destination,
capacity = @capacity,
DepartureTime = @DepartureTime,
ArrivalTime = @ArrivalTime,
CompanyName = @CompanyName,
BusType = @BusType
where BusNumber = @BusNumber
end


--------------------------------------------AUTO_GENERATE PICKUP ID'S-----------------------------
create procedure proc_autoGenPickupIDs
as begin
select MAX(pp_id) from PickupPoint
end

------------------------------------------ADD PICKUP INFO----------------------------------
create procedure proc_addBusPickupInfo(
@pp_id varchar(20),
@pp_station varchar(30)
)
as begin 
insert into PickupPoint values(@pp_id,@pp_station)
end

--------------------------------------VIEW PICKUP POINTS INFO--------------------------------
create procedure proc_viewPickupPointsInfo
as begin
select * from PickupPoint
end
--------------------------------------DELETE PICKUP POINT------------------------------------
create procedure proc_deletePickupPoint(
@pp_id varchar(20)
)
as begin
delete from PickupPoint where pp_id = @pp_id
end

--------------------------------------BUS INFO TO ADD PICKUP POINT FOR SPECIFIC BUS------------
create procedure proc_BusNumToAndFromPlace
as begin
select BusNumber,StartPoint,Destination from Bus
end 

-------------------------------------- ADD BUS SPECIFIC PICKUP POINT--------------------------------------
create procedure proc_addBusSpecificPickupPoint(
@BusNumber varchar(10),
@pp_id varchar(20)
)
as begin 
insert into BusPickupPoint values(@BusNumber,@pp_id)
end

--------------------------------------AUTO_GENERATE DESTINATION ID'S-----------------------------
create procedure proc_autoGenDestinationIDs
as begin
select MAX(d_id) from Destination
end

----------------------------------------ADD DESTINATION INFO----------------------------------
create procedure proc_addBusDestinationInfo(
@d_id varchar(20),
@d_station varchar(30)
)
as begin 
insert into Destination values(@d_id,@d_station)
end
--------------------------------------VIEW DESTINATION POINTS INFO--------------------------------
create procedure proc_viewDestinationPointsInfo
as begin
select * from Destination
end
--------------------------------------DELETE DESTINATION POINT------------------------------------
create procedure proc_deleteDestinationPoint(
@d_id varchar(20)
)
as begin
delete from Destination where d_id = @d_id
end
--------------------------------------UPDATE DESTINATION POINTS-----------------------------------
create procedure proc_updateDestinationPoints(
@d_id varchar(20),
@d_station varchar(30)
)
as begin
update Destination set d_station = @d_station where d_id = @d_id
end
-------------------------------------- ADD BUS SPECIFIC PICKUP POINT--------------------------------------
create procedure proc_addBusSpecificDestinationPoints(
@BusNumber varchar(10),
@d_id varchar(20)
)
as begin 
insert into BusDestination values(@BusNumber,@d_id)
end
-----------------------BIND DESTINATION POINTS BASED ON BUS-NUMBER FOR FARE----------
create procedure proc_getDestinationPointsBasedOnBusNumber(
@BusNumber varchar(10)
)
as begin
select DEST.d_id,dest.d_station from Destination DEST inner join
BusDestination BDEST on DEST.d_id = BDEST.d_id inner join 
Bus BUS on BDEST.BusNumber = BUS.BusNumber 
where BUS.BusNumber = @BusNumber
end
-------------------------------------ADD FARE-----------------------------------------
create procedure proc_addFare(
@BusNumber varchar(10),
@Start_id varchar(20),
@From_depTime varchar(15),
@Destination_id varchar(20),
@To_depTime varchar(15),
@Fare money
)
as begin 
insert into Fare values(
@BusNumber,
@Start_id,
@From_depTime,
@Destination_id,
@To_depTime,
@Fare
)
end
------------------------------------
