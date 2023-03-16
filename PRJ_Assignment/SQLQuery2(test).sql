CREATE TABLE Campus(
    campusid int identity NOT NULL PRIMARY KEY,
	campusname varchar(30) NOT NULL
)

CREATE TABLE Account (
    accountID int IDENTITY NOT NULL PRIMARY KEY,
	accountName varchar(30) NOT NULL,
    username varchar(30) NOT NULL,
	[password] varchar(30) NOT NULL,
	[role] bit NOT NULL,
	campusid int  NOT NULL,
	FOREIGN KEY (campusid) REFERENCES Campus (campusid)
)

CREATE TABLE Course (
    cid int identity NOT NULL PRIMARY KEY,
    ccode varchar(30) NOT NULL UNIQUE,
    cname varchar(50) NOT NULL,
);

CREATE TABLE Lecturer (
    lid int IDENTITY PRIMARY KEY,
	lcode varchar(30) NOT NULL,
	lname varchar(30) NOT NULL,
	Img text NOT NULL,
	Email varchar(255) NOT NULL,
	accountID int NOT NULL,
    FOREIGN KEY (accountID) REFERENCES Account (accountID),
)

CREATE TABLE [Group] (
     gid int IDENTITY NOT NULL PRIMARY KEY,
     gname varchar(30) UNIQUE NOT NULL ,
)

CREATE TABLE Student (
    [sid] int IDENTITY NOT NULL PRIMARY KEY,
    scode varchar(30) NOT NULL UNIQUE,
    sname varchar(30) NOT NULL,
    Img text NOT NULL,
    Email varchar(255) NOT NULL,
    Contact int NOT NULL,
	Gender bit NOT NULL,
	Dob Date NOT NULL,
	accountID int NOT NULL,
    FOREIGN KEY (accountID) REFERENCES Account (accountID),
);

CREATE TABLE Student_Group (
    [sid] int NOT NULL,
	gid int NOT NULL,
    FOREIGN KEY ([sid]) REFERENCES Student ([sid]),
    FOREIGN KEY (gid) REFERENCES [Group] (gid),
	PRIMARY KEY ([sid], gid)
)

CREATE TABLE Group_Course ( 
   cid int NOT NULL,
   gid int NOT NULL,
   FOREIGN KEY (cid) REFERENCES Course (cid),
   FOREIGN KEY (gid) REFERENCES [Group] (gid),
   PRIMARY KEY (cid, gid)
)

CREATE TABLE Room (
    rid int IDENTITY NOT NULL PRIMARY KEY,
    rname varchar(30) NOT NULL,
)

CREATE TABLE TimeSlot (
    tid int NOT NULL PRIMARY KEY,
	[description] varchar(30), 
)

CREATE TABLE [Session] (
    sessionid int IDENTITY NOT NULL PRIMARY KEY,
	gid int NOT NULL,
	cid int NOT NULL,
    tid int NOT NULL,
	rid int NOT NULL,
	lid int NOT NULL,
	[date] Date NOT NULL,
	[status] bit NOT NULL, 
	FOREIGN KEY (lid) REFERENCES Lecturer (lid),
	FOREIGN KEY (gid) REFERENCES [Group] (gid),
	FOREIGN KEY (cid) REFERENCES Course (cid),
    FOREIGN KEY (tid) REFERENCES TimeSlot (tid),
	FOREIGN KEY (rid) REFERENCES Room (rid),
)

CREATE TABLE Attendance(
    aid int IDENTITY NOT NULL PRIMARY KEY,
	[sid] int NOT NULL,
	[sessionid] int NOT NULL,
	astatus bit NOT NULL,
	[description] varchar(150) NULL,
	FOREIGN KEY ([sid]) REFERENCES Student ([sid]),
	FOREIGN KEY ([sessionid]) REFERENCES [Session] ([sessionid]),
)




