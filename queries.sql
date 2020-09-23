-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName,
       CategoryName
  FROM Product AS P
       JOIN
       Category AS C ON P.CategoryId = C.Id;
;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT O.id,
       S.companyname
  FROM [order] AS O
       JOIN
       shipper AS s ON S.id = O.shipvia
 WHERE O.orderdate <= "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT P.ProductName,
       OD.Quantity
  FROM Product AS P
       JOIN
       OrderDetail AS OD ON OD.ProductId = P.Id
 WHERE OD.OrderId = "10251"
 ORDER BY P.ProductName DESC;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT O.id AS OrderID,
       C.companyname AS Customer_Company_Name,
       E.lastname AS Employee_Last_Name
  FROM [order] AS O
       JOIN
       customer AS C ON C.id = O.customerid
       JOIN
       employee AS E ON E.id = O.employeeid;


       ***** STRETCH  *****

Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.


FROM Categories AS C
       JOIN 
       Products AS P ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;


Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT O.OrderID, 
       SUM(OD.Quantity) as TotalItems 
  FROM [Orders] AS O
       JOIN 
       OrderDetails AS OD ON O.OrderID = OD.OrderID 
GROUP BY O.OrderID
