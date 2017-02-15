-------------CREATING DATABASE----------------
create database HarkhjotTravels
use HarkhjotTravels
------------------------------------------------CREATING TABLES-------------------------------------
--------------Bus Table---------------------
Create table Bus(
BusNumber varchar(10) primary key,
StartPoint varchar(30),
Destination varchar(30),
capacity int,
DepartureTime varchar(15),
ArrivalTime varchar(15),
CompanyName varchar(30),
BusType varchar(30)
)
-----------------PickupPoint Table---------------------
create table PickupPoint(
ID int,
pp_id varchar(20) primary key,
pp_station varchar(30)
)
---------------- Destination table--------------
create table Destination(
ID int,
d_id varchar(20) primary key,
d_station varchar(30)
)
----------------- BusPickupPoint Table ------------
create table BusPickupPoint(
BusNumber varchar(10) foreign key references Bus(BusNumber),
pp_id varchar(20) foreign key references PickupPoint(pp_id),
primary key(BusNumber,pp_id)
)
----------------- BusDestination Table ------------
create table BusDestination(
BusNumber varchar(10) foreign key references Bus(BusNumber),
d_id varchar(20) foreign key references Destination(d_id),
primary key(BusNumber,d_id)
)
------------------Fare Table------------------------
create table Fare(
BusNumber varchar(10) foreign key references Bus(BusNumber),
Start_id varchar(20) foreign key references Destination(d_id),
From_depTime varchar(15),
Destination_id varchar(20) foreign key references Destination(d_id),
To_depTime varchar(15),
Fare money
)
-------------------------------------------------------------------------------------------------------------------
