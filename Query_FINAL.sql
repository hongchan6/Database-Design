##Query1

SELECT clientNum, clientName AS 'Name'
FROM client
ORDER BY clientName ASC;


##Query2

SELECT CONCAT(firstName, " ", surname) AS 'Name', CONCAT(street, " ", city, " ", state, " ", postcode) AS 'Address', CONCAT('$', Cast(salary AS Decimal(9,2))) AS Salary
FROM employee
ORDER BY salary ASC;

##Query3

SELECT DATE_FORMAT(requestDate, '%d-%m-%Y') AS 'Date'
FROM stock_request
ORDER BY requestDate DESC
LIMIT 0,1;


##Query4

SELECT C.clientName, CONCAT(CA.street, " ",Ca.city, " ", CA.state, " ", CA.postcode) AS 'Address'
FROM client AS C, client_address as CA
WHERE C.clientNum = CA.clientNum
AND CA.addressType = 'R';


##Query5

SELECT C.clientNum
FROM client AS C
WHERE C.clientNum NOT IN (SELECT SR.clientNum
                          FROM stock_request AS SR);


##Query6

SELECT CONCAT(E.firstName, " ", E.surname) AS 'Name'
FROM employee AS E, stock_request AS SR, picking_list AS PL
WHERE E.staffID = PL.pickerStaffID
	AND SR.requestNum = PL.requestNum
    AND E.staffID IN (SELECT P.pickerStaffID
                      FROM picking_list AS P);


                    
##Query7

SELECT P.productNum, P.description, SUM(PLO.quantitiyOnHand) AS 'TotalQuantityOnHand'
FROM product AS P, prod_location AS PLO
WHERE P.productNum = PLO.productNum
GROUP BY P.productNum;


##Query8

SELECT C.clientName AS 'Name', RL.productNum, RL.qtyRequested
FROM client AS C, stock_request AS SR, request_list AS RL, product AS P
WHERE C.clientNum = SR.clientNum
	AND SR.requestNum = RL.requestNum
    AND P.productNum = RL.requestNum
ORDER BY C.clientName, P.productNum;


##Query9

SELECT CONCAT(E.firstName, " ", E.surname) AS 'Name',
CONCAT('$', Cast(E.salary AS Decimal(9,2))) AS 'Salary' 
FROM employee AS E 
WHERE E.salary <= (SELECT AVG(EMP.salary) FROM employee AS EMP);




##Query10

SELECT CONCAT(E.firstName, " ", E.surname) AS 'Name', CONCAT('$', Cast(1.075 * E.salary AS Decimal(9,2))) AS Salary
FROM employee AS E
WHERE E.salary <= (SELECT AVG(EMP.salary)
                  FROM employee AS EMP);



##Query11

SELECT P.productNum, P.description, PL.quantitiyOnHand,PL.warehouseID, PL.locationID 
FROM product AS P,prod_location AS PL, warehouse AS W, location AS L 
WHERE P.productNum = PL.productNum 
    AND W.warehouseID =L.warehouseID 
    AND L.warehouseID = PL.warehouseID 
    AND L.locationID = PL.locationID 
GROUP BY W.warehouseID,P.productNum, L.locationID 
ORDER BY p.productNum, PL.warehouseID, PL.locationID;


##Query12

SELECT P.productNum, RL.qtyRequested AS 'TotalQtyRequested', PL.quantityPicked AS 'TotalQtyPicked', (RL.qtyRequested - PL.quantityPicked) AS 'Difference'
FROM product as P, request_list AS RL, picking_list as PL, warehouse AS W, location AS L, prod_location AS PLO
WHERE W.warehouseID = L.warehouseID
	AND L.warehouseID = PLO.warehouseID
    AND L.locationID = PLO.locationID
    AND P.productNum = PLO.productNum
    AND P.productNum = RL.productNum
    AND PLO.warehouseID = PL.warehouseID
    AND PLO.locationID = PL.locationID
    AND PLO.productNum = PL.productNum
GROUP BY PLO.productNum;


##Query13

SELECT S.staffID AS 'SupervisorStaffID', CONCAT(S.firstName, " ", S.surname) AS 'SupervisorName', E.staffID AS 'SubordinateStaffID', CONCAT(E.firstName, " ", E.surname) AS 'SubordinateName'
FROM employee AS E, employee AS S
WHERE E.supervisedBy = S.staffID;
