USE [PRJ_Assignment]
GO
INSERT INTO [dbo].[Campus]([campusname])
     VALUES ('FU-Hoa Lac')
INSERT INTO [dbo].[Campus]([campusname])
     VALUES ('FU-Ho Chi Minh')
INSERT INTO [dbo].[Campus]([campusname])
     VALUES ('FU-Đa Nang')
INSERT INTO [dbo].[Campus]([campusname])
     VALUES ('FU-Can Tho')
INSERT INTO [dbo].[Campus]([campusname])
     VALUES ('FU-Quy Nhon')
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('tuannahe170268','TuanNAHE170268@fpt.edu.vn', '12345',1, 1)
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('sonnt5','sonnt5', '12345',0, 1)
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('tranglkhe176485','TrangLKHE176485@fpt.edu.vn', '12345',1, 1)
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('anhnh88','anhnh88', '12345',0, 1)
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('longdq','longdq', '12345',0,1)
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('canhddhe170000','canhdd', '12345',1, 1)
GO
INSERT INTO [dbo].[Account] ([accountName],[username],[password],[role],[campusid])
     VALUES ('dattthe170001','dattt', '12345',1, 1)
GO
INSERT INTO [dbo].[Course] ([ccode],[cname])
     VALUES ('MAS291','Statistics and Probability')
GO
INSERT INTO [dbo].[Course] ([ccode],[cname])
     VALUES ('JPD123','Elementary Japanese 1-A1.2')
GO
INSERT INTO [dbo].[Course] ([ccode],[cname])
     VALUES ('PRJ301','Java Web Application Development')
GO
INSERT INTO [dbo].[Course] ([ccode],[cname])
     VALUES ('CEA201','Computer Organization and Architecture')
GO
INSERT INTO [dbo].[Course] ([ccode],[cname])
     VALUES ('IOT102','Internet of Things')
GO
INSERT INTO [dbo].[Group] ([gname])
     VALUES ('SE1722')
GO
INSERT INTO [dbo].[Group] ([gname])
     VALUES ('SE1723')
GO
INSERT INTO [dbo].[Group] ([gname])
     VALUES ('SE1724')
GO
INSERT INTO [dbo].[Group] ([gname])
     VALUES ('SE1725')
GO
INSERT INTO [dbo].[Lecturer] ([lcode],[lname],[Img],[Email],[accountID])
     VALUES ('SonNT5','Ngo Tung Son','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','SonNT@fpt.edu.vn',2)
GO
INSERT INTO [dbo].[Lecturer] ([lcode],[lname],[Img],[Email],[accountID])
     VALUES ('AnhNH88','Nguyen Hoang Anh','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','AnhNH@fpt.edu.vn',4)
GO
INSERT INTO [dbo].[Lecturer] ([lcode],[lname],[Img],[Email],[accountID])
     VALUES ('LongDQ','Dang Quang Long','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','LongDQ@fpt.edu.vn',5)
GO
INSERT INTO [dbo].[Student] ([scode],[sname],[Img],[Email],[Contact],[Gender],[Dob],[accountID])
     VALUES ('HE170268','Nguyen Anh Tuan','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','TuanNAHE170268@fpt.edu.vn','0982730924',1,'2002/09/18',1)
GO
INSERT INTO [dbo].[Student] ([scode],[sname],[Img],[Email],[Contact],[Gender],[Dob],[accountID])
     VALUES ('HE176485','Lai Khanh Trang','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','TrangLKHE176485@fpt.edu.vn','0888530666',0,'2003/03/14',3)
GO
INSERT INTO [dbo].[Student] ([scode],[sname],[Img],[Email],[Contact],[Gender],[Dob],[accountID])
     VALUES ('HE170000','Dinh Dang Canh','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','CanhDDHE170000@fpt.edu.vn','0000000000',1,'2003/01/01',6)
GO
INSERT INTO [dbo].[Student] ([scode],[sname],[Img],[Email],[Contact],[Gender],[Dob],[accountID])
     VALUES ('HE170001','Trinh Tien Dat','https://fap.fpt.edu.vn/ImageHandler.ashx?rollNumber=re4SGIoAAjDwj4TVOXthhQ==&Campus=3','DatTTHE170001@fpt.edu.vn','0000000001',1,'2001/01/01',7)
GO
INSERT INTO [dbo].[TimeSlot] ([tid],[description])
     VALUES (1,'(7:30-9:50)')
GO
INSERT INTO [dbo].[TimeSlot] ([tid],[description])
     VALUES (2,'(10:00-12:20)')
GO
INSERT INTO [dbo].[TimeSlot] ([tid],[description])
     VALUES (3,'(12:50-15:10)')
GO
INSERT INTO [dbo].[TimeSlot] ([tid],[description])
     VALUES (4,'(15:20-17:40)')
GO
INSERT INTO [dbo].[Room] ([rname])
     VALUES ('BE-304')
GO
INSERT INTO [dbo].[Room] ([rname])
     VALUES ('DE-304')
GO
INSERT INTO [dbo].[Room] ([rname])
     VALUES ('AL-304')
GO
INSERT INTO [dbo].[Student_Group] ([sid],[gid])
     VALUES (1,1)
GO
INSERT INTO [dbo].[Student_Group] ([sid],[gid])
     VALUES (2,1)
GO
INSERT INTO [dbo].[Student_Group] ([sid],[gid])
     VALUES (3,1)
GO
INSERT INTO [dbo].[Student_Group] ([sid],[gid])
     VALUES (4,2)
GO
INSERT INTO [dbo].[Group_Course] ([cid],[gid])
     VALUES (1,1)
GO
INSERT INTO [dbo].[Group_Course] ([cid],[gid])
     VALUES (2,1)
GO
INSERT INTO [dbo].[Group_Course] ([cid],[gid])
     VALUES (3,1)
GO
INSERT INTO [dbo].[Group_Course] ([cid],[gid])
     VALUES (4,2)
GO
INSERT INTO [dbo].[Group_Course] ([cid],[gid])
     VALUES (5,3)
GO
INSERT INTO [dbo].[Session] ([gid],[cid],[tid],[rid],[lid],[date],[status]) 
     VALUES (1,3,2,1,1,'2023/03/13',0)
GO
INSERT INTO [dbo].[Session] ([gid],[cid],[tid],[rid],[lid],[date],[status]) 
     VALUES (1,1,1,1,3,'2023/03/15',0)
GO
INSERT INTO [dbo].[Session] ([gid],[cid],[tid],[rid],[lid],[date],[status]) 
     VALUES (1,2,2,1,2,'2023/03/15',0)
GO
INSERT INTO [dbo].[Session] ([gid],[cid],[tid],[rid],[lid],[date],[status]) 
     VALUES (1,3,2,1,1,'2023/03/16',0)
GO
INSERT INTO [dbo].[Session] ([gid],[cid],[tid],[rid],[lid],[date],[status]) 
     VALUES (1,2,1,1,2,'2023/03/17',0)
GO
INSERT INTO [dbo].[Session] ([gid],[cid],[tid],[rid],[lid],[date],[status]) 
     VALUES (1,1,2,1,3,'2023/03/17',0)
GO