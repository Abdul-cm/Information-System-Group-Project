DROP TABLE ORDER_LANE cascade constraints;
DROP TABLE STOCK cascade constraints;
DROP TABLE MAINTENANCE cascade constraints;
DROP TABLE RENTAL cascade constraints;
DROP TABLE BOAT cascade constraints;
DROP TABLE CLASS_SIZE cascade constraints;
DROP TABLE STOCK_ORDERS cascade constraints;
DROP TABLE DEALERS cascade constraints;
DROP TABLE MANUFACTURERS cascade constraints;
DROP TABLE CUSTOMERS cascade constraints;

CREATE TABLE CUSTOMERS(
CustomerID Number(8) PRIMARY KEY,
CustomerName Varchar(50),
CustomerTelNo Number(11),
CustomerAddress Varchar(50),
CustomerEmail Varchar2(50));

CREATE TABLE MANUFACTURERS(
ManufacturerID Number(8) PRIMARY KEY,
ManufName Varchar2(50),
ManufTelNo Number(11),
ManufAddress Varchar2(50),
ManufEmail Varchar2(50));

CREATE TABLE DEALERS(
DealerID Number(8) PRIMARY KEY,
DealName Varchar(50),
DealTelNo Number(11),
DealAddress Varchar(50),
DealEmail Varchar2(50));

CREATE TABLE STOCK_ORDERS(
OrderID Number(8) PRIMARY KEY,
OrderDate DATE);

CREATE TABLE CLASS_SIZE(
ClassSizeID Number(8) PRIMARY KEY ,
FullDayPrice Number(6),
HalfDayPrice Number(6));

CREATE TABLE BOAT(
BoatID  NUMBER(8) PRIMARY KEY,
BoatModel VARCHAR2(50),
SalePrice Number(10),
DealerID Number(8),
ManufacturerID Number(8),
ClassSizeID Number(8),
SaleDate DATE,
PurchasePrice Number(10),
PurchaseDate DATE);

 ALTER TABLE BOAT
ADD CONSTRAINT fk_Boat_dealerid FOREIGN KEY (DealerID) REFERENCES DEALERS(DealerID);
 
  ALTER TABLE BOAT
ADD CONSTRAINT fk_Boat_classsizeid FOREIGN KEY (ClassSizeID) REFERENCES CLASS_SIZE(ClassSizeID);

 ALTER TABLE BOAT
ADD CONSTRAINT fk_Boat_manufacturerid FOREIGN KEY (ManufacturerID) REFERENCES MANUFACTURERS(ManufacturerID);
 
CREATE TABLE RENTAL(
RentalID NUMBER(8) PRIMARY KEY,
BoatID Number(8),
RentalDate DATE,
RentalPrice Number(12),
CustomerID Number(8),
ClassSizeID Number(8),
RentalPeriod Number(4),
DateBackDue DATE,
DateBackActual DATE,
AmounPaid Number(6),
CONSTRAINT fk_Rental_boatid FOREIGN KEY (BoatID) REFERENCES BOAT(BoatID),
CONSTRAINT fk_Rental_customerid FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID),
CONSTRAINT fk_Rental_classsizeid FOREIGN KEY (ClassSizeID) REFERENCES CLASS_SIZE(ClassSizeID)
); 

CREATE TABLE MAINTENANCE(
MaintenanceID NUMBER(8) PRIMARY KEY,
BoatID Number(8),
FaultDate DATE,
FaultDetails VARCHAR2(50),
ActionTaken VARCHAR2(50),
ActionDetails VARCHAR2(50),
CONSTRAINT fk_maintenance_boatid FOREIGN KEY (BoatID) REFERENCES BOAT(BoatID)
); 

CREATE TABLE STOCK(
PartID Number(8) PRIMARY KEY,
PartDescription VARCHAR2(50),
PartQuantity VARCHAR2(50),
MaintenanceID Number(8),
CONSTRAINT fk_stock_maintenanceid FOREIGN KEY (MaintenanceID) REFERENCES MAINTENANCE(MaintenanceID)
);

CREATE TABLE ORDER_LANE(
OrderID Number(8),
PartID Number (8),
Quantity Number(6),
CONSTRAINT pk_Order_Lane_orderandpart PRIMARY KEY (OrderID, PartID),
CONSTRAINT fk_Order_Lane_order FOREIGN KEY (OrderID) REFERENCES STOCK_ORDERS(OrderID),
CONSTRAINT fk_Order_Lane_Part FOREIGN KEY (PartID) REFERENCES STOCK(PartID)
);

INSERT INTO CUSTOMERS VALUES (1, 'Dion Brodnecke',7174826351,'Oak Street, Liverpool', 'dbroes1d@who.int ');
INSERT INTO CUSTOMERS VALUES (2, 'Scarlett Galley',03260476982,'886 Northport Parkway, Liverpool', 'scargr1c@imgur.com');
INSERT INTO CUSTOMERS VALUES (3, 'Sissy Gadson',4924556740,'95 Putney Road, Liverpool', 'sgadson1b@ucoz.com');
INSERT INTO CUSTOMERS VALUES (4, 'Tabby Minichi',7795213673,'6 Amoth Court, Warrington', 'minitabc@imgur.com');
INSERT INTO CUSTOMERS VALUES (5, 'Nellie Greenmon',3816078215,'40 Graceland Crossing, Liverpool', 'nelliegreen12@patch.com');
INSERT INTO CUSTOMERS VALUES (6, 'Hanny Marsters ',07075576685 ,'2 Almo Trail, Liverpool', 'hmarsters@netlog.com');
INSERT INTO CUSTOMERS VALUES (7, 'Oswell Aspinell',09931348133 ,'64 Jackson Road, Liverpool', 'OsAspinell@digg.com');
INSERT INTO CUSTOMERS VALUES (8, 'Florance Baston ',07315082134 ,'440 Magdeline Lane, Warrington', 'FloBar@dirtg.com');
INSERT INTO CUSTOMERS VALUES (9, 'Candice Tumilson',016398246574,'1 Farragut Parkway, Liverpool', 'nelliegreen12@patch.com');
INSERT INTO CUSTOMERS VALUES (10, 'Clair Bavin',06245985897,'87 Toban Drive, Liverpool', ' clairBav@sprog.it');

INSERT INTO MANUFACTURERS VALUES (1, 'SuperBoat',01772459666,'Unit 7 Centurian Court, Leyland', 'admin@superboat.co.uk');
INSERT INTO MANUFACTURERS VALUES (2, 'Explorer Boats UK',01704807654,'Meadow Lane, Burscough', 'admin@explorerboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (3, 'The Northwich Boat, Company',01270160160,'Uint 1 Kings Lock Boattard Booth Lane,Middlewich', 'admin@northwichboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (4, 'Collingwood Boat Builder',01513742985,'9 Townsend Street', 'admin@collingwoodboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (5, 'Elto Moss Boat Builders',01270760160,'Unit 4 Kings Lock Boatyard BoothLane, Middlewich', 'admin@eltonmossboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (6, 'Aintree Boat Company Ltd',01515239000,'Brookfield Drive, Liverpool ', 'admin@eltonmossboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (7, 'Braidbar Boats Ltd',01625873471,'Lord Vernons Wharf Lyme Road Higher, Poynton', 'admin@eltonmossboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (8, 'Bourne Boat Builders Ltd ',01785714692 ,'Teddesley Road, Penkridge', 'admin@eltonmossboats.co.uk');
INSERT INTO MANUFACTURERS VALUES (9, 'Stoke on Trent Boat Building Co Ltd ',01782813831 ,'Longport Wharf Station Street, Stoke-on-Trent ', 'admin@eltonmossboats.co.uk');

INSERT INTO DEALERS VALUES (1, 'Dalis Vannoort',07574137463,'77 A828, Appin', 'dvannoort0@salon.com');
INSERT INTO DEALERS VALUES (2, 'Joes Junk',07365534221,'15 Back Lane, Buxton', 'JoesJunk@zdnet.com ');
INSERT INTO DEALERS VALUES (3, 'Hoebart Kubera',07874051869,'4 Finedon House, Marine Parade, Littlestone', 'hkubera2@who.int ');
INSERT INTO DEALERS VALUES (4, 'Eva Iacomettii',07880072148,'9 Hartlands, Onslow Road, Newwent', 'eiacomettii3@admin.ch');
INSERT INTO DEALERS VALUES (5, 'Alley Pate',07822040557,'07610 Arizona Alley', 'apate4@gnu.org');
INSERT INTO DEALERS VALUES (6, 'Korrie Legge',07380018233,'1076 Evesham Road, Astwood Bank ', 'klegge5@reference.com');
INSERT INTO DEALERS VALUES (7, 'Minne Hinkens',07978390430,'53 Balby Road, Balby', 'mhinken6@smh.com.au');
INSERT INTO DEALERS VALUES (8, 'Inigo MacAllaster',07893419552,'1910 Farwell Plaza', 'imacallaster7@blogspot.com');
INSERT INTO DEALERS VALUES (9, 'Linell Skeeles',07532931207,'57 Great Russell Street, London', 'Iskeeles8@goo.gl');

INSERT INTO CLASS_SIZE VALUES (1, '240','170');
INSERT INTO CLASS_SIZE VALUES (2, '180','120');
INSERT INTO CLASS_SIZE VALUES (3, '160','100');
INSERT INTO CLASS_SIZE VALUES (4, '140','90');
INSERT INTO CLASS_SIZE VALUES (5, '280','175');
INSERT INTO CLASS_SIZE VALUES (6, '240','150');
INSERT INTO CLASS_SIZE VALUES (7, '200','125');
INSERT INTO CLASS_SIZE VALUES (8, '170','125');
INSERT INTO CLASS_SIZE VALUES (9, '160','100');
INSERT INTO CLASS_SIZE VALUES (10, '150','140');

INSERT INTO BOAT VALUES (1, 'Explorer', 3910,1,1,1, '10-Oct-2019 ',280,'20-Oct-2020 ' );
INSERT INTO BOAT VALUES (2, 'TurboSail ',3840,2,2,2, '10-Oct-2019 ', 220,'20-Oct-2020 ');
INSERT INTO BOAT VALUES (3, 'MasterSail',3240,3,3,3, '10-Oct-2019 ', 240, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (4, 'SmallSailor', 2040,4,4,4, '10-Oct-2019 ', 240, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (5, 'SmallSailor',2040,5,5,5, '10-Oct-2019 ',140, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (6, 'Grande',5440,6,6,6, '10-Oct-2019 ', 240, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (7, 'Grande ',5440,7,7,7, '10-Oct-2019 ', 180, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (8, 'Turbo Mid',5440,8,8,8, '10-Oct-2019 ', 110, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (9, 'RowStream',440 ,9,9,9, '10-Oct-2019 ',110, '20-Oct-2020 ');
INSERT INTO BOAT VALUES (10, 'RowerX',320 ,9,9,9, '10-Oct-2019 ',110, '20-Oct-2020 ');

INSERT INTO RENTAL VALUES (1, 1,' 20-Oct-2020', 140,1,1,2,'02-may-2017','03-may-2017',180.00);
INSERT INTO RENTAL VALUES (2, 2,' 20-Oct-2020', 240,2,2,3,'03-may-2017','06-may-2017',170.00);
INSERT INTO RENTAL VALUES (3, 3,' 20-Oct-2020', 180,3,3,2,'04-may-2017','06-may-2017',240.00);
INSERT INTO RENTAL VALUES (4, 4,' 20-Oct-2020', 110,4,4,3,'05-may-2017','06-may-2017',240.00);
INSERT INTO RENTAL VALUES (5, 5,' 20-Oct-2020', 110,5,5,1,'06-may-2017','02-may-2017',240.00);
INSERT INTO RENTAL VALUES (6, 6,' 20-Oct-2020', 400,6,6,6,'07-may-2017','05-may-2017',170.00);
INSERT INTO RENTAL VALUES (7, 7,' 20-Oct-2020', 180,7,7,3,'08-may-2017','06-may-2017',170.00);
INSERT INTO RENTAL VALUES (8, 8,' 20-Oct-2020', 110,8,8,1,'09-may-2017','06-may-2017',180.00);
INSERT INTO RENTAL VALUES (9, 9,' 20-Oct-2020', 400,9,9,2,'06-may-2017','06-may-2017',180.00);
INSERT INTO RENTAL VALUES (10,10,' 20-Oct-2020',200,10,10,4,'06-may-2017','06-may-2017',180.00);

INSERT INTO MAINTENANCE VALUES (1, 1, '17-apr-2016','Damaged mast',' Repair Mast','27-apr-2016');
INSERT INTO MAINTENANCE VALUES (2, 2, '10-jul-2017','Bent Forestay','Replace Forestay','22-aug-2017');
INSERT INTO MAINTENANCE VALUES (3, 3, '07-may-2018','Shot Boom','Replace Boom','06-june-2018');
INSERT INTO MAINTENANCE VALUES (4, 4, '07-jul-2019','Shot Boom','Repair Rudderstock','08-jul-2019');
INSERT INTO MAINTENANCE VALUES (5, 5, '19-oct-2020','Rudderstock Chipped','Normal Service','27-jan-2020');
INSERT INTO MAINTENANCE VALUES (6, 6, '19-oct-2020',' Rudderblade busted ','Normal Service','27-jan-2020');
INSERT INTO MAINTENANCE VALUES (7, 7, '19-oct-2020',' Rudderblade busted ','Normal Service','06-june-2018');

INSERT INTO STOCK VALUES (1,'Sail boat ', 'two',1);
INSERT INTO STOCK VALUES (2,'Sail boat ', 'three',2);
INSERT INTO STOCK VALUES (3,'Rowing boat ', 'fuor',3);
INSERT INTO STOCK VALUES (4,'Motorboat', 'six',4);

INSERT INTO  STOCK_ORDERS VALUES (1, '02-FEB-2016');
INSERT INTO  STOCK_ORDERS VALUES (2, '12 Oct 15');




