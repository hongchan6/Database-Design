CREATE DATABASE if not exists WareMart_s5085739;

USE WareMart_s5085739;


CREATE TABLE if not exists WAREHOUSE(
    warehouseID VARCHAR(3) PRIMARY KEY,
    street VARCHAR(20),
    city VARCHAR(15),
    state CHAR(3),
    postcode CHAR(4),
    managerID INT
) ENGINE = INNODB;


CREATE TABLE if not exists EMPLOYEE(
    staffID INT PRIMARY KEY AUTO_INCREMENT,
    surname VARCHAR(20),
    firstName VARCHAR(15),
    dob Date,
    street VARCHAR(20),
    city VARCHAR(15),
    state CHAR(3),
    postcode CHAR(4),
    salary Decimal(19,4),
    warehouseID VARCHAR(3),
    supervisedBy INT,
    FOREIGN KEY (warehouseID) REFERENCES WAREHOUSE(warehouseID),
    FOREIGN KEY (supervisedBy) REFERENCES EMPLOYEE(staffID)
) ENGINE = INNODB;


ALTER TABLE WAREHOUSE
ADD FOREIGN KEY (managerID) REFERENCES EMPLOYEE(staffID);


CREATE TABLE if not exists LOCATION(
    warehouseID VARCHAR(3),
    locationID VARCHAR(3),
    Aisle INT,
    Shelf INT,
    Bin INT,
    capacity Decimal(5,2),
    hazardousAllowed TINYINT(1),
    FOREIGN KEY (warehouseID) REFERENCES WAREHOUSE(warehouseID),
    PRIMARY KEY (warehouseID, locationID)
) ENGINE = INNODB;


CREATE TABLE if not exists DEPARTMENT(
    dptNumber INT PRIMARY KEY AUTO_INCREMENT,
    dptName VARCHAR(20)
) ENGINE INNODB;


CREATE TABLE if not exists PRODUCT(
    productNum INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(30),
    packSize INT,
    dptNumber INT,
    FOREIGN KEY (dptNumber) REFERENCES DEPARTMENT(dptNumber)
) ENGINE = INNODB;


CREATE TABLE if not exists PROD_LOCATION(
    warehouseID VARCHAR(3),
    locationID VARCHAR(3),
    productNum INT,
    quantitiyOnHand INT,
    FOREIGN KEY (warehouseID, locationID) REFERENCES LOCATION(warehouseID, locationID),
    FOREIGN KEY (productNum) REFERENCES PRODUCT(productNum),
    PRIMARY KEY (warehouseID, locationID, productNum)
) ENGINE = INNODB;


CREATE TABLE if not exists CLIENT(
    clientNum INT PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(40)
) ENGINE = INNODB;


CREATE TABLE if not exists CLIENT_ADDRESS(
    clientNum INT AUTO_INCREMENT,
    addressType CHAR(1),
    street VARCHAR(20),
    city VARCHAR(15),
    state CHAR(3),
    postcode CHAR(4),
    FOREIGN KEY (clientNum) REFERENCES Client(clientNum),
    PRIMARY KEY (clientNum, addressType)
) ENGINE = INNODB;


CREATE TABLE if not exists STOCK_REQUEST(
    requestNum INT PRIMARY KEY AUTO_INCREMENT,
    requestDate Date,
    clientNum INT,
    FOREIGN KEY (clientNum) REFERENCES CLIENT(clientNum)
) ENGINE = INNODB;


CREATE TABLE if not exists REQUEST_LIST(
    requestNum INT,
    productNum INT,
    qtyRequested INT,
    FOREIGN KEY (requestNum) REFERENCES STOCK_REQUEST(requestNum),
    FOREIGN KEY (productNum) REFERENCES PRODUCT(ProductNum),
    PRIMARY KEY (requestNum, productNum)
) ENGINE = INNODB;


CREATE TABLE if not exists PICKING_LIST(
    warehouseID VARCHAR(3),
    locationID VARCHAR(3),
    productNum INT,
    requestNum INT,
    quantityPicked INT,
    datePicked Date,
    pickerStaffID INT,
    FOREIGN KEY (warehouseID, locationID, productNum) REFERENCES PROD_LOCATION(warehouseID, locationID, productNum),
    FOREIGN KEY (productNum, requestNum) REFERENCES REQUEST_LIST(productNum, requestNum),
    FOREIGN KEY (pickerstaffID) REFERENCES EMPLOYEE(staffID),
    PRIMARY KEY (warehouseID, locationID, productNum, requestNum)
) ENGINE = INNODB;


