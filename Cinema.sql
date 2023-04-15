CREATE DATABASE Cinema

USE Cinema


CREATE TABLE Movies(
	Id int primary key identity,
	Name varchar(255) UNIQUE NOT NULL,
	Price decimal CHECK(Price BETWEEN 20 AND 150)
)

CREATE TABLE Places(
	Id int primary key identity,
	Name varchar(255) NOT NULL,
	StartDate datetime2 NOT NULL,
	EndDate datetime2 NOT NULL,
	MovieId int foreign key references Movies(Id)
)

CREATE TABLE Users(
	Id int primary key identity,
	FullName varchar(255) NOT NULL,
	Age int CHECK(Age >= 16) NOT NULL,
	PlaceId int foreign key references Places(Id)
)

CREATE VIEW AllData 
AS
Select U.FullName, U.Age, P.Name 'Sector', P.StartDate, P.EndDate, M.Name 'Movie', M.Price FROM Users U
JOIN Places P
ON U.PlaceId=P.Id
JOIN Movies M
ON P.MovieId=M.Id

