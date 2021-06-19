CREATE TABLE Accounts (
    Username varchar(50) NOT NULL,
    Password varchar(50) NOT NULL,
    Fullname varchar(50) NOT NULL,
    Email varchar(50) NOT NULL,
    Photo varchar(50) NOT NULL,
    Activated boolean NULL,
    Admin boolean NULL,
    CONSTRAINT PK_Customers PRIMARY KEY(Username)
);

CREATE TABLE Authorities
(
    Id       SERIAL      NOT NULL,
    Username varchar(50) NOT NULL,
    RoleId   varchar(10) NOT NULL,
    CONSTRAINT PK_UserRoles PRIMARY KEY (Id)
);

CREATE TABLE Categories
(
    Id   char(4)     NOT NULL,
    Name varchar(50) NOT NULL,
    CONSTRAINT PK_Categories PRIMARY KEY (Id)
);

CREATE TABLE OrderDetails
(
    Id        SERIAL NOT NULL,
    OrderId   bigint NOT NULL,
    ProductId int    NOT NULL,
    Price     float  NOT NULL
        CONSTRAINT DF_Order_Details_UnitPrice DEFAULT ((0)),
    Quantity  int    NOT NULL
        CONSTRAINT DF_Order_Details_Quantity  DEFAULT ((1)),
    CONSTRAINT PK_OrderDetails PRIMARY KEY (Id)
);

CREATE TABLE Orders
(
    Id         SERIAL       NOT NULL,
    Username   varchar(50)  NOT NULL,
    CreateDate date         NOT NULL,
    Address    varchar(100) NOT NULL,
    CONSTRAINT PK_Orders PRIMARY KEY (Id)
);

CREATE TABLE Products(
    Id SERIAL NOT NULL,
    Name varchar(50) NOT NULL,
    Image varchar(50) NOT NULL CONSTRAINT DF_Products_Image  DEFAULT (N'Product.gif'),
    Price float NOT NULL CONSTRAINT DF_Products_UnitPrice  DEFAULT ((0)),
    CreateDate date NOT NULL CONSTRAINT DF_Products_ProductDate  DEFAULT (now()),
    Available boolean NOT NULL CONSTRAINT DF_Products_Available  DEFAULT ((true)),
    CategoryId char(4) NOT NULL,
    CONSTRAINT PK_Products PRIMARY KEY (Id)
);

CREATE TABLE Roles
(
    Id   varchar(10) NOT NULL,
    Name varchar(50) NOT NULL,
    CONSTRAINT PK_Roles PRIMARY KEY (Id)
);

INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Activated, Admin) VALUES (N'may', N'may11', N'thaomay', N'thaomay01@gmail.com', N'user.png', true, true);
INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Activated, Admin) VALUES (N'maycute', N'cute33', N'maycutechetme', N'cloudcute@gmail.com', N'user.png', true, true);
INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Activated, Admin) VALUES (N'van', N'van22', N'thaovan', N'thaovan08@gmail.com', N'user.png', true, true);
INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Activated, Admin) VALUES (N'vancuteghe', N'cuteghe44', N'cloudep', N'arout@gmail.com', N'user.png', true, true);

INSERT INTO Categories (Id, Name) VALUES (N'1000', N'khẩu trang y tế');
INSERT INTO Categories (Id, Name) VALUES (N'1002', N'vogmask');
INSERT INTO Categories (Id, Name) VALUES (N'1003', N'3d mask');
INSERT INTO Categories (Id, Name) VALUES (N'1004', N'khẩu trang vải');
INSERT INTO Categories (Id, Name) VALUES (N'1005', N'khẩu trang trong suốt');
INSERT INTO Categories (Id, Name) VALUES (N'1006', N'khẩu trang ánh nhũ long lanh');

INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100021, 10255, 1002, 15.2, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100030, 10258, 1002, 15.2, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100042, 10262, 1007, 24, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100048, 10264, 1002, 15.2, 35);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100052, 10266, 1012, 30.4, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100066, 10273, 1010, 24.8, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100075, 10276, 1010, 24.8, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100076, 10276, 1013, 4.8, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100100, 10285, 1001, 14.4, 45);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100110, 10289, 1003, 8, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100116, 10291, 1013, 4.8, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100124, 10294, 1001, 14.4, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100135, 10298, 1002, 15.2, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100164, 10309, 1004, 17.6, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100165, 10309, 1006, 20, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100185, 10317, 1001, 14.4, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100202, 10325, 1006, 20, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100203, 10325, 1013, 4.8, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100207, 10326, 1004, 17.6, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100210, 10327, 1002, 15.2, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100232, 10335, 1002, 15.2, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100236, 10336, 1004, 17.6, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100244, 10339, 1004, 17.6, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100252, 10342, 1002, 15.2, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100259, 10344, 1004, 17.6, 35);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100260, 10344, 1008, 32, 70);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100261, 10345, 1008, 32, 70);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100270, 10348, 1001, 14.4, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100283, 10354, 1001, 14.4, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100290, 10357, 1010, 24.8, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100327, 10370, 1001, 14.4, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100358, 10383, 1013, 4.8, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100363, 10385, 1007, 24, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100375, 10389, 1010, 24.8, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100383, 10391, 1013, 4.8, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100385, 10393, 1002, 15.2, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100390, 10394, 1013, 4.8, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100420, 10405, 1003, 8, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100421, 10406, 1001, 14.4, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100440, 10413, 1001, 14.4, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100454, 10418, 1002, 15.2, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100460, 10420, 1009, 150, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100461, 10420, 1013, 4.8, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100494, 10435, 1002, 15.2, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100505, 10439, 1012, 30.4, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100509, 10440, 1002, 15.2, 45);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100534, 10449, 1010, 24.8, 14);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100537, 10450, 1010, 24.8, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100562, 10459, 1007, 24, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100570, 10462, 1013, 4.8, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100574, 10464, 1004, 17.6, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100589, 10469, 1002, 15.2, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100595, 10471, 1007, 24, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100610, 10477, 1001, 14.4, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100613, 10478, 1010, 24.8, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100628, 10485, 1002, 15.2, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100629, 10485, 1003, 8, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100673, 10504, 1002, 19, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100682, 10508, 1013, 6, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100687, 10511, 1004, 22, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100688, 10511, 1007, 30, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100689, 10511, 1008, 40, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100702, 10515, 1009, 150, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100716, 10519, 1010, 31, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100724, 10522, 1001, 18, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100725, 10522, 1008, 40, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100732, 10524, 1010, 31, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100738, 10526, 1001, 18, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100739, 10526, 1013, 6, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100741, 10527, 1004, 22, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100756, 10533, 1004, 22, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100766, 10536, 1012, 38, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100777, 10539, 1013, 6, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100781, 10540, 1003, 10, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100791, 10543, 1012, 38, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100796, 10546, 1007, 30, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100858, 10568, 1010, 31, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100880, 10576, 1001, 18, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100908, 10590, 1001, 18, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100910, 10591, 1003, 10, 14);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100911, 10591, 1007, 30, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100934, 10601, 1013, 6, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100945, 10606, 1004, 22, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100948, 10607, 1007, 30, 45);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100954, 10609, 1001, 18, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100955, 10609, 1010, 31, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100958, 10611, 1001, 18, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100959, 10611, 1002, 19, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100961, 10612, 1010, 31, 70);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100966, 10613, 1013, 6, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100977, 10618, 1006, 25, 70);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100988, 10622, 1002, 19, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101006, 10628, 1001, 18, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101012, 10632, 1002, 19, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101014, 10633, 1012, 38, 36);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101015, 10633, 1013, 6, 13);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101018, 10634, 1007, 30, 35);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101022, 10635, 1004, 22, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101025, 10636, 1004, 22, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101036, 10641, 1002, 19, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101048, 10646, 1001, 18, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101049, 10646, 1010, 31, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101067, 10654, 1004, 22, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101094, 10664, 1010, 31, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101125, 10676, 1010, 31, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101130, 10678, 1012, 38, 100);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101148, 10685, 1010, 31, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101153, 10687, 1009, 150, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101156, 10688, 1010, 31, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101159, 10689, 1001, 18, 35);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101162, 10691, 1001, 18, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101168, 10693, 1009, 150, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101172, 10694, 1007, 30, 90);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101175, 10695, 1008, 40, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101176, 10695, 1012, 38, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101190, 10700, 1001, 18, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101197, 10702, 1003, 10, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101199, 10703, 1002, 19, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101202, 10704, 1004, 22, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101215, 10709, 1008, 40, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101225, 10713, 1010, 31, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101229, 10714, 1002, 19, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101234, 10715, 1010, 31, 21);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101242, 10718, 1012, 38, 36);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101252, 10722, 1002, 19, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101257, 10724, 1010, 31, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101262, 10726, 1004, 22, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101271, 10729, 1001, 18, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101283, 10734, 1006, 25, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101290, 10737, 1013, 6, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101299, 10741, 1002, 19, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101300, 10742, 1003, 10, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101309, 10746, 1013, 6, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101330, 10752, 1001, 18, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101363, 10764, 1003, 10, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101366, 10766, 1002, 19, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101367, 10766, 1007, 30, 35);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101387, 10775, 1010, 31, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101408, 10785, 1010, 31, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101410, 10786, 1008, 40, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101413, 10787, 1002, 19, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101421, 10790, 1007, 30, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101425, 10792, 1002, 19, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101441, 10799, 1013, 6, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101456, 10804, 1010, 31, 36);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101461, 10806, 1002, 19, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101468, 10810, 1013, 6, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101477, 10813, 1002, 19, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101509, 10827, 1010, 31, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101513, 10829, 1002, 19, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101514, 10829, 1008, 40, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101515, 10829, 1013, 6, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101517, 10830, 1006, 25, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101525, 10832, 1013, 6, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101529, 10833, 1007, 30, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101541, 10837, 1013, 6, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101545, 10838, 1001, 18, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101552, 10841, 1010, 31, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101567, 10846, 1004, 22, 21);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101570, 10847, 1001, 18, 80);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101577, 10848, 1009, 150, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101578, 10849, 1003, 10, 49);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101583, 10851, 1002, 19, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101587, 10852, 1002, 19, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101591, 10854, 1010, 31, 100);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101592, 10854, 1013, 6, 65);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101597, 10856, 1002, 19, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101599, 10857, 1003, 10, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101602, 10858, 1007, 30, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101617, 10863, 1001, 18, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101623, 10866, 1002, 19, 21);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101630, 10869, 1001, 18, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101636, 10871, 1006, 25, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101645, 10874, 1010, 31, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101668, 10885, 1002, 19, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101672, 10886, 1010, 31, 70);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101676, 10888, 1002, 19, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101685, 10893, 1008, 40, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101690, 10894, 1013, 6, 28);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101701, 10898, 1013, 6, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101708, 10903, 1013, 6, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101713, 10905, 1001, 18, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101716, 10908, 1007, 30, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101718, 10909, 1007, 30, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101724, 10911, 1001, 18, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101729, 10913, 1004, 22, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101741, 10918, 1001, 18, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101754, 10924, 1010, 31, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101760, 10926, 1013, 6, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101775, 10931, 1013, 6, 42);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101783, 10934, 1006, 25, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101784, 10935, 1001, 18, 21);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101790, 10938, 1013, 6, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101794, 10939, 1002, 19, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101796, 10940, 1007, 30, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101797, 10940, 1013, 6, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101803, 10943, 1013, 6, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101809, 10945, 1013, 6, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101811, 10946, 1010, 31, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101818, 10949, 1006, 25, 12);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101819, 10949, 1010, 31, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101822, 10950, 1004, 22, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101826, 10952, 1006, 25, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101842, 10958, 1007, 30, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101849, 10962, 1007, 30, 45);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101850, 10962, 1013, 6, 77);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101864, 10968, 1012, 38, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101876, 10975, 1008, 40, 16);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101883, 10978, 1008, 40, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101887, 10979, 1007, 30, 18);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101888, 10979, 1012, 38, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101895, 10982, 1007, 30, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101897, 10983, 1013, 6, 84);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101909, 10987, 1007, 30, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101912, 10988, 1007, 30, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101914, 10989, 1006, 25, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101921, 10991, 1002, 19, 50);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101941, 11000, 1004, 22, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101944, 11001, 1007, 30, 60);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101948, 11002, 1013, 6, 56);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101952, 11003, 1001, 18, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101957, 11005, 1001, 18, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101959, 11006, 1001, 18, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101961, 11007, 1008, 40, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101970, 11010, 1007, 30, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101986, 11017, 1003, 10, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101989, 11018, 1012, 38, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101994, 11020, 1010, 31, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (101995, 11021, 1002, 19, 11);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102002, 11023, 1007, 30, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102008, 11025, 1001, 18, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102009, 11025, 1013, 6, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102018, 11030, 1002, 19, 100);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102022, 11031, 1001, 18, 45);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102023, 11031, 1013, 6, 80);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102035, 11035, 1001, 18, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102039, 11036, 1013, 6, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102050, 11041, 1002, 19, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102058, 11046, 1012, 38, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102061, 11047, 1001, 18, 25);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102064, 11049, 1002, 19, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102065, 11049, 1012, 38, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102079, 11056, 1007, 30, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102086, 11059, 1013, 6, 30);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102112, 11070, 1001, 18, 40);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102113, 11070, 1002, 19, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102116, 11071, 1007, 30, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102117, 11071, 1013, 6, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102118, 11072, 1002, 19, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102125, 11075, 1002, 19, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102128, 11076, 1006, 25, 20);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102131, 11077, 1002, 19, 24);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102132, 11077, 1003, 10, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102133, 11077, 1004, 22, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102134, 11077, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102135, 11077, 1007, 30, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102136, 11077, 1008, 40, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102137, 11077, 1010, 31, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102138, 11077, 1012, 38, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102139, 11077, 1013, 6, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102316, 10250, 1009, 150, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102507, 11209, 1005, 21.35, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102508, 11209, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102509, 11209, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102513, 11210, 1005, 21.35, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102514, 11210, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102515, 11210, 1006, 25, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102519, 11211, 1005, 21.35, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102520, 11211, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102521, 11211, 1006, 25, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102525, 11212, 1005, 21.35, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102526, 11212, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102527, 11212, 1006, 25, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102529, 11213, 1003, 10, 10);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102530, 11213, 1005, 21.35, 9);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102531, 11213, 1004, 22, 15);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102535, 11213, 1009, 97, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102542, 11213, 1010, 31, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (102543, 11213, 1013, 6, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112508, 21207, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112509, 21207, 1004, 22, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112510, 21207, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112511, 21208, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112516, 21209, 1012, 38, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112517, 21209, 1011, 21, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (112519, 21209, 1007, 30, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122505, 31205, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122506, 31205, 1004, 22, 19);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122507, 31205, 1001, 190, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122510, 31206, 1009, 97, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122511, 31207, 1013, 6, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122512, 31207, 1010, 31, 7);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122513, 31207, 1004, 22, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (122514, 31207, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (132510, 41208, 1007, 30, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (152505, 61205, 1002, 19, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (152506, 61205, 1001, 190, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (162509, 71206, 1002, 19, 9);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (162510, 71206, 1001, 190, 9);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172505, 81206, 1012, 38, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172510, 81207, 1005, 21.35, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172512, 81208, 1013, 6, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172514, 81208, 1002, 19, 8);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172515, 81209, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172516, 81209, 1004, 22, 4);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172520, 81211, 1007, 30, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172521, 81212, 1004, 22, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172522, 81212, 1003, 10, 6);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (172523, 81212, 1006, 25, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (192505, 101205, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (192506, 101205, 1004, 22, 5);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (192507, 101205, 1006, 25, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (202505, 111205, 1006, 25, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (202506, 111205, 1004, 22, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (202507, 111205, 1012, 38, 3);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (202508, 111205, 1011, 21, 2);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (202511, 111206, 1005, 21.35, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (212505, 121205, 1003, 10, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (212506, 121205, 1002, 19, 1);
INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (212507, 121205, 1001, 190, 1);

INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1001, N'Khẩu trang da lợn', N'pr1.jpg', 190, CAST(N'1980-03-29' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1002, N'Y tế xanh', N'pr2.jpg', 19, CAST(N'1982-12-18' AS Date), false, N'1000');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1003, N'3d mask', N'pr3.jpg', 10, CAST(N'1973-06-14' AS Date), true, N'1003');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1004, N'MLB Yankess', N'pr4.jpg', 22, CAST(N'1976-03-10' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1005, N'3d mask 2 lớp', N'pr5.jfif', 21.35, CAST(N'1978-12-06' AS Date), true, N'1003');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1006, N'y tế 2 lớp', N'pr6.png', 25, CAST(N'1981-09-03' AS Date), false, N'1000');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1007, N'3d loại1', N'pr7.jfif', 30, CAST(N'1983-03-13' AS Date), false, N'1003');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1008, N'Northwoods ', N'pr8.jpg', 40, CAST(N'1972-02-26' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1009, N'Mishi Kobe Niku', N'pr9.jpg', 97, CAST(N'1985-12-10' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1010, N'khau trang Việt Nam', N'pr10.jpg', 31, CAST(N'1994-03-23' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1011, N'Khẩu trang ánh nhũ', N'pr11.jpg', 21, CAST(N'1985-11-28' AS Date), false, N'1006');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1012, N'Queso Manchego La Pastora', N'pr12.jpg', 38, CAST(N'1988-08-27' AS Date), true, N'1002');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1013, N'ams', N'pr13.jpg', 5, CAST(N'2002-07-01' AS Date), false, N'1005');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1084, N'khẩu trang ánh kim', N'pr14.jpg', 300, CAST(N'2021-06-12' AS Date), true, N'1006');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1086, N'khẩu trang đinh đen', N'pr15.jpeg', 200, CAST(N'2021-05-17' AS Date), false, N'1006');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1087, N'vogmask', N'pr16.jfif', 120, CAST(N'2021-03-09' AS Date), false, N'1002');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1088, N'khẩu trang mạng nhện', N'c1.jfif', 200, CAST(N'2021-03-01' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1089, N'Y tế xanh 1 lớp', N'c2.jfif', 150, CAST(N'2020-02-01' AS Date), true, N'1000');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1090, N'vogmask đen', N'c3.jfif', 300, CAST(N'2020-03-01' AS Date), false, N'1002');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1091, N'vogmask kem', N'c4.jpg', 350, CAST(N'2021-02-01' AS Date), false, N'1002');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1092, N'y tế trắng', N'c5.jpg', 250, CAST(N'2020-01-06' AS Date), true, N'1000');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1095, N'khẩu trang vải', N'c6.jfif', 150, CAST(N'2020-03-02' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1096, N'y tế xám', N'c7.jfif', 230, CAST(N'2020-03-01' AS Date), false, N'1000');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1097, N'vogmask tím', N'c8.jfif', 700, CAST(N'2021-04-05' AS Date), true, N'1002');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1098, N'3d mask chính hãng', N'c9.jfif', 200, CAST(N'2021-05-02' AS Date), false, N'1003');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1099, N'vải thun giãn', N'c10.jfif', 300, CAST(N'2021-09-07' AS Date), false, N'1004');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1100, N'Y tế hoa', N'c11.jfif', 200, CAST(N'2023-05-07' AS Date), true, N'1000');
INSERT INTO Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1101, N'3d mask ', N'c12.jfif', 320, CAST(N'2021-04-08' AS Date), false, N'1003');

INSERT INTO Roles (Id, Name) VALUES (N'CUST', N'Customers');
INSERT INTO Roles (Id, Name) VALUES (N'DIRE', N'Directors');
INSERT INTO Roles (Id, Name) VALUES (N'STAF', N'Staffs');

ALTER TABLE Authorities ADD CONSTRAINT FK_UserRoles_Roles FOREIGN KEY(RoleId)
    REFERENCES Roles (Id)
    ON UPDATE CASCADE
       ON DELETE CASCADE;

ALTER TABLE Authorities ADD  CONSTRAINT FK_UserRoles_Users FOREIGN KEY(Username)
    REFERENCES Accounts (Username)
    ON UPDATE CASCADE
       ON DELETE CASCADE;

ALTER TABLE OrderDetails ADD  CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(ProductId)
    REFERENCES Products (Id)
    ON UPDATE CASCADE;

ALTER TABLE Orders ADD  CONSTRAINT FK_Orders_Customers FOREIGN KEY(Username)
    REFERENCES Accounts (Username)
    ON UPDATE CASCADE
       ON DELETE CASCADE;