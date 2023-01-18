INSERT INTO warehouse(warehouseID, street, city, state, postcode) VALUES
	('W01', '10 Harper St', 'Gold Coast', 'QLD', '4214'),
	('W02', '20 Adam St', 'Gold Coast', 'QLD', '4210'),
	('W03', '5 Aldora St', 'Logan', 'QLD', '4127'),
	('W04', '2 Zamia St', 'Brisbane', 'QLD', '4109'),
	('W05', '8 Bolton St', 'Gold Coast', 'QLD', '4225');


INSERT INTO employee(staffID, surname, firstName, dob, street, city, state, postcode, salary, warehouseID, supervisedBy) VALUES
	(Null, 'Smith', 'John', '1975-05-25', '10 Baker St', 'Gold Coast', 'QLD', '4217', 88500.50, 'W03', 1),
    (Null, 'Johnson', 'Jessica', '1986-03-25', '14 Alexander St', 'Gold Coast', 'QLD', '4209', 75500.50, 'W02', 1),
    (Null, 'Brown', 'James', '1989-08-29', '2 Fox St', 'Gold Coast', 'QLD', '4210', 90000.50, 'W05', 1),
    (Null, 'Davis', 'Adam', '1983-12-02', '5 Moore St', 'Gold Coast', 'QLD', '4225', 81000.50, 'W01', 2),
    (Null, 'Lee', 'Chris', '1972-07-13', '9 Pearson St', 'Gold Coast', 'QLD', '4215', 99500.50, 'W04', 2),
    (Null, 'Scott', 'Daniel', '1993-07-13', '14 Price St', 'Gold Coast', 'QLD', '4209', 65000.00, 'W03', 3),
    (Null, 'Taylor', 'Tim', '1995-01-08', '9 Lawson St', 'Gold Coast', 'QLD' , '4215', 69500.50, 'W05', 3);



UPDATE warehouse
set managerID = 4
where warehouseID = 'W01';


UPDATE warehouse
set managerID = 2
where warehouseID = 'W02';


UPDATE warehouse
set managerID = 1
where warehouseID = 'W03';


UPDATE warehouse
set managerID = 5
where warehouseID = 'W04';


UPDATE warehouse
set managerID = 3
where warehouseID = 'W05';


INSERT INTO location(warehouseID, locationID, Aisle, Shelf, Bin, capacity, hazardousAllowed) VALUES
	('W01', 'L01', 1, 1, 1, 100.00, 1),
    ('W02', 'L02', 2, 2, 2, 200.00, 0),
    ('W02', 'L06', 2, 2, 2, 200.00, 0),
    ('W02', 'L07', 2, 2, 2, 200.00, 0),
    ('W03', 'L03', 3, 3, 3, 250.00, 0),
    ('W03', 'L08', 3, 3, 3, 250.00, 0),
    ('W04', 'L04', 4, 4, 4, 300.00, 0),
    ('W05', 'L05', 5, 5, 5, 400.00, 0);


INSERT INTO department(dptNumber, dptName) VALUES 
	(Null, 'Cloth'),
    (Null, 'Confectionery'),
    (Null, 'Chemicals'),
    (Null, 'Electronic'),
    (Null, 'Medicine');


INSERT INTO product(productNum, description, packSize, dptNumber) VALUES
	(NULL, 'MagicKeyboard', 5, 4),
    (NULL, 'BluePants',2, 1),
    (NULL, 'Panadol', 1, 5),
    (NULL, 'Macbook', 10, 4),
    (NULL, 'MagicMouse', 10, 4);


INSERT INTO prod_location(warehouseID, locationID, productNum, quantitiyOnHand) VALUES
	('W02', 'L02', 1, 10),
    ('W02', 'L06', 1, 10),
    ('W02', 'L07', 1, 10),
    ('W04', 'L04', 2, 50),
    ('W01', 'L01', 3, 3),
    ('W03', 'L03', 4, 5),
    ('W03', 'L08', 4, 10),
    ('W05', 'L05', 5, 35);


INSERT INTO client(clientNum, ClientName) VALUES
	(Null, 'Emily White'),
    (Null, 'Jack Jones'),
    (Null, 'Frank Adams'),
    (Null, 'Chris Brown'),
    (Null, 'James Walker');


INSERT INTO client_address(clientNum, addressType, street, city, state, postcode) VALUES
	(1, 'R', '3 Cannon St', 'Gold Coast', 'QLD', '4215'),
    (1, 'M', '2 Ellen St', 'Gold Coast', 'QLD', '4218'),
    (1, 'P', '1 Ferry St', 'Gold Coast', 'QLD', '4212'),
    (2, 'R', '10 Gray St', 'Gold Coast', 'QLD', '4211'),
    (2, 'M', '10 King St', 'Gold Coast', 'QLD', '4209'),
    (3, 'M', '66 Water St', 'Gold Coast', 'QLD', '4209'),
    (3, 'R', '6 Fire St', 'Gold Coast', 'QLD', '4209'),
    (4, 'P', '15 Griffith St', 'Gold Coast', 'QLD', '4209'),
    (5, 'R', '20 Jennifer St', 'Gold Coast', 'QLD', '4209'),
    (5, 'M', '9 Queenie St', 'Gold Coast', 'QLD', '4209');


INSERT INTO stock_request(requestNum, requestDate, clientNum) VALUES
	(NULL, '2022-03-22', 1),
    (NULL, '2022-02-10', 3),
    (NULL, '2021-11-15', 1),
    (NULL, '2021-8-15', 4),
    (NULL, '2022-01-08', 2);


INSERT INTO request_list(requestNum, productNum, qtyRequested) VALUES
	(1, 3, 1),
    (2, 2, 10),
    (3, 4, 1),
    (4, 1, 30),
    (5, 5, 10);


INSERT INTO picking_list(warehouseID, locationID, productNum, requestNum, quantityPicked, datePicked, pickerStaffID) VALUES
	('W01', 'L01', 3, 1, 1, '2022-03-23', 4),
    ('W02', 'L02', 1, 4, 20, '2021-08-16', 2),
    ('W03', 'L03', 4, 3, 1, '2021-11-16', 1),
    ('W04', 'L04', 2, 2, 10, '2022-02-11', 5),
    ('W05', 'L05', 5, 5, 10, '2022-01-09', 3);





