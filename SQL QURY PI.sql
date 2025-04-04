--1. Display all data from DimCustomer

SELECT *
FROM DimCustomer

--1.A Select all data from DimProduct

SELECT *
FROM DimProduct

--1B-HA SELECT ALL RECORDS FROM DIMEMPLOYEE

SELECT *
FROM DimEmployee

--1C HA SELECT ALL DATA FROM DIMGEOGRAPHY
SELECT *
FROM DimGeography

--2. DISPLAY CUSTOMER'S FIRST NAME, BIRTHDATE, 
--MARRITAL STATUS AND GENDER FROM DimCustomer

SELECT FirstName, BirthDate, MaritalStatus, Gender
FROM DimCustomer

--2A Display ProductKey, Productname, Colour, 
--ReorderPoint from DimProduct

SELECT ProductKey, EnglishProductName, Color, ReorderPoint
FROM DimProduct

--2HA Show City, Country, PostalCode from DimGeography

SELECT City, EnglishCountryRegionName, PostalCode
FROM DimGeography

-- 3. Get Customers whose yearly income is more than 60000

SELECT FirstName, LastName, YearlyIncome
FROM DimCustomer
WHERE YearlyIncome > 60000

-- 4. List all customers who have total children <= 3

SELECT FirstName, LastName, TotalChildren
FROM DimCustomer
WHERE TotalChildren <= 3

-- 4A. Display all those customers who has atleast 1 child 
-- and less than 3 childeren

SELECT FirstName, LastName, TotalChildren
FROM DimCustomer
WHERE TotalChildren <= 3
AND TotalChildren >= 1

-- 5. Select the products whose reorder level is more than 250

SELECT EnglishProductName, ReorderPoint
FROM DimProduct
WHERE ReorderPoint > 250

-- 5A Display all the female customers whose yearly income is < 1 lakh
SELECT FirstName,YearlyIncome
FROM DimCustomer
WHERE YearlyIncome <100000
AND GENDER= 'F'


-- 6. List all male customers whose BirthDate > 01 JAN 1970

SELECT FirstName+' '+LastName CUSTOMERNAME, BirthDate
FROM DimCustomer
WHERE BirthDate>'1970-01-01'
AND GENDER='M'

--6A. Displat Birthdate of only those customers who are born in year 1979
SELECT FirstName+' '+LastName CUSTERMERNAME,BirthDate
FROM DimCustomer
WHERE BirthDate>='1979-01-01'
AND BirthDate<= '1979-12-01'
--ANOTHERWAY
SELECT FirstName+' '+LastName CUSTERMERNAME,BirthDate
FROM DimCustomer
WHERE BirthDate BETWEEN '1979-01-01'AND '1979-12-31'

--7. Get customers whose occupation is either Professional and Managemen
SELECT FirstName,LastName,EnglishOccupation
FROM DimCustomer
WHERE EnglishOccupation = 'professional'
OR EnglishOccupation = 'Management'



--7A. Diasplay all products which are red or black in colour
SELECT EnglishProductName ,Color
FROM DimProduct
WHERE Color='RED '
OR COLOR='Color'

--8. Get Accountkey, Parentaccountkey and account discriptio from DimAccount
-- Whose Account type is liabilities and parentaccountkey is not null

-- Whose Account type is liabilities and parentaccountkey is nul

SELECT AccountKey,ParentAccountKey,AccountDescription,AccountType
FROM DimAccount
WHERE AccountType = 'Liabilities'
and ParentAccountKey is not null

---null values
SELECT AccountKey,ParentAccountKey,AccountDescription,AccountType
FROM DimAccount
WHERE AccountType = 'Liabilities'
and ParentAccountKey is  null

-- 9. Display productkey and productname from DimProduct where reorder point is > 300 and colour is black

SELECT ProductKey, EnglishProductName,ReorderPoint,Color
FROM DimProduct
WHERE ReorderPoint>300
AND Color='BLACK'

--10. Display all products who are silver in colour
SELECT EnglishProductName,Color
FROM DimProduct
WHERE Color='SILVER'

--11. Dispaly employees working in department HR and Sales
SELECT  FirstName +' '+ LastName EMPLOYEE_NAME,DepartmentName
FROM DimEmployee 
WHERE DepartmentName='Human Resources'
OR DepartmentName='Sales'

--12. Display all departments from DimEmployee
SELECT DISTINCT DepartmentName
FROM DimEmployee


--13. Display sales orderno. product kay and freight from FactInternetSales whose freight is >15 and < 100
SELECT SalesOrderNumber,ProductKey,Freight
FROM FactInternetSales
WHERE Freight BETWEEN 15 AND 100

--14. Display all employees working in HR, Sales, Purchases and Marketing
SELECT FirstName,LastName,DepartmentName
FROM DimEmployee
WHERE DepartmentName='Human Resources'
OR DepartmentName='Sales'
OR DepartmentName='Purchasing'
OR DepartmentName='Marketing'
-- Another way
SELECT FirstName,LastName,DepartmentName
FROM DimEmployee
WHERE DepartmentName IN ('Human Resources','Sales','Purchasing','Marketing')

--SELECT 
--FROM 
--WHERE 

--15. Display employeekey parentempoyeekay, and department names of employees 
--whose employee key is 1,19,276,105 and 73
SELECT EmployeeKey,FirstName,LastName,DepartmentName,ParentEmployeeKey
FROM DimEmployee
WHERE EmployeeKey IN (1,9,276,105,73)


--15A. Select all customers whose occupation is either Professional, Skilled Manual, Clerical and Management
SELECT EnglishOccupation,FirstName,LastName
FROM DimCustomer
WHERE EnglishOccupation IN ('Professional','Skilled Manual','Clerical','Management')

--16. All employees who are married and whose base rate is > 10 and < 25

SELECT FirstName,LastName, BaseRate
FROM DimEmployee

WHERE MaritalStatus ='M'
AND
BaseRate>10
AND BaseRate<25

--OR
SELECT FirstName,LastName, BaseRate
FROM DimEmployee
WHERE MaritalStatus='M'
AND BaseRate BETWEEN 10 AND 25


--17. List of all married male employees whose base rate is in between 10 and 25
SELECT FirstName,LastName, BaseRate
FROM DimEmployee
WHERE MaritalStatus='M'
AND BaseRate BETWEEN 10 AND 25

-- 18. Display all customers whose first name starts with J
SELECT DISTINCT FirstName
FROM DimCustomer
WHERE FirstName LIKE'J%'
--NOTE
--IF WE ARE PUTTING %SIGN LETTER WE WILL GET SEARCH ENDING WITH LETTER

--Display all customers whose first name starts with J, E AND C
SELECT DISTINCT FirstName
FROM DimCustomer
WHERE FirstName LIKE'%[JEC]'

--ANOTHER WAY
SELECT DISTINCT FirstName
FROM DimCustomer
WHERE FirstName LIKE'%J'
AND FirstName LIKE'%E'
AND FirstName LIKE'%C'

--20HW. Display customer name, birthdate, gender





---JOINS ARE STARTED
--21A. List all PRODUCT WITH THEIR SUBCATEGORY
SELECT DP.EnglishProductName,DPS.EnglishProductSubcategoryName
FROM DimProduct AS DP
JOIN DimProductSubcategory AS DPS
ON DP.ProductSubcategoryKey=DPS.ProductSubcategoryKey

--21A. List all customer with their country, state and city
SELECT DC.FirstName+' '+DC.LastName CUSTOMER_NAME,DG.EnglishCountryRegionName,DG.City,DG.StateProvinceName
FROM DimCustomer AS DC
JOIN DimGeography AS DG
ON DC.GeographyKey=DG.GeographyKey

--21B. Display all employees with their territory
SELECT DE.FirstName+''+DE.LastName EMPNAME,DST.SalesTerritoryRegion
FROM DimEmployee AS DE
JOIN DimSalesTerritory AS DST
ON DE.SalesTerritoryKey=DST.SalesTerritoryKey


--22. Display all products with their category and subcategory
SELECT DP.EnglishProductName PRODUCTNAME,DPC.EnglishProductCategoryName PRODUCTCATEGORYNAME,
DPS.EnglishProductSubcategoryName PRODUCTCATEGORYNAME
FROM DimProduct AS DP
LEFT JOIN DimProductSubcategory AS DPS
ON DP.ProductSubcategoryKey=DPS.ProductSubcategoryKey
JOIN DimProductCategory AS DPC
ON DPS.ProductCategoryKey=DPC.ProductCategoryKey

--23. Display departmentwise employee count
SELECT DE.DepartmentName,COUNT(*) NUMBEROFEMPLOYEE
FROM DimEmployee AS DE
GROUP BY DE.DepartmentName

--24. Productsubcategorywise number of products from Dim.Product
SELECT DPSC.EnglishProductSubcategoryName SUBCATEGORYNAME,COUNT(*)NUMBEROFPRODUCT
FROM DimProduct AS DP
LEFT JOIN DimProductSubcategory AS DPSC
ON DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
GROUP BY DPSC.EnglishProductSubcategoryName

--25. Productsubcategorywise number of products from table DimProduct whose subcategorykey is not nul
SELECT DPSC.EnglishProductSubcategoryName SUBCATEGORYNAME,COUNT(*)NUMBEROFPRODUCT
FROM DimProduct AS DP
LEFT JOIN DimProductSubcategory AS DPSC
ON DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
WHERE DP.ProductSubcategoryKey IS NOT NULL
GROUP BY DPSC.EnglishProductSubcategoryName

--OR
SELECT DPSC.EnglishProductSubcategoryName SUBCATEGORYNAME,COUNT(*)NUMBEROFPRODUCT
FROM DimProduct AS DP
JOIN DimProductSubcategory AS DPSC
ON DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
GROUP BY DPSC.EnglishProductSubcategoryName

--26. Display count of married female employees
SELECT COUNT(*)COUNT_of_married_female_employees
FROM DimEmployee
WHERE MaritalStatus= 'M'
AND GENDER='F'






-- 26A. Display count of unmarried male employees
SELECT COUNT(*)
FROM DimEmployee AS DE
WHERE DE.MaritalStatus='S'
AND Gender='M'


--27.CUSTOMER WISE TOTAL SELS AND TOTAL FRIGHT FRIM FACTINTERNETSALES
SELECT DC.FirstName+''+DC.LastName CUSTERNAME,SUM(FIS.SalesAmount)TOTALSELS,
SUM(FIS.FREIGHT)FREIGHT
FROM FactInternetSales AS FIS
JOIN DimCustomer AS DC
ON FIS.CustomerKey=DC.CustomerKey
GROUP BY DC.FirstName+''+DC.LastName

--28. Display productwise total sales from FactInternetSales
SELECT DP.EnglishProductName PROSUCTNAME ,SUM(FIS.SalesAmount)TOTALSELS
FROM FactInternetSales AS FIS
JOIN DimProduct AS DP
ON FIS.ProductKey=DP.ProductKey
GROUP BY DP.EnglishProductName

--29. Display ProductSubCategorywise Avereage Sales from FactInternetSales
SELECT DPS.EnglishProductSubcategoryName PRODUCTSUBCATEGORY,AVG(FIS.SalesAmount)AVJSELS
FROM FactInternetSales FIS
JOIN DimProduct AS DP
ON FIS.ProductKey=DP.ProductKey
JOIN DimProductSubcategory AS DPS
ON DP.ProductSubcategoryKey=DPS.ProductSubcategoryKey
GROUP BY DPS.EnglishProductSubcategoryName


--30. Countrywise total sales in ascending order from FactResellerSales
SELECT DG.EnglishCountryRegionName CUNTRYNAME,SUM(FRS.SalesAmount)TOTALSELS
FROM FactResellerSales AS FRS
JOIN DimReseller AS DR
ON FRS.ResellerKey=DR.ResellerKey
JOIN DimGeography AS DG
ON DR.GeographyKey=DG.GeographyKey
GROUP BY DG.EnglishCountryRegionName
ORDER BY SUM(FRS.SalesAmount)DESC

--31. Countrywise, Statewise total sale from FactResellerSales
SELECT  DG.EnglishCountryRegionName CUNTRYNAME,DG.StateProvinceName STATENAME,SUM(FRS.SalesAmount)TOTALSELS
FROM FactResellerSales AS FRS
JOIN DimReseller AS DR
ON FRS.ResellerKey=DR.ResellerKey
JOIN DimGeography AS DG
ON DR.GeographyKey=DG.GeographyKey
GROUP BY DG.EnglishCountryRegionName
ORDER BY 1,2 DESC

--32. Countrywise Resellerwise Total Sale from FactResellerSales

SELECT DG.EnglishCountryRegionName COUNTRYNAME,DR.ResellerName,SUM(FRS.SalesAmount)TOTALSALE
FROM FactResellerSales AS FRS
JOIN DimReseller AS DR
ON FRS.ResellerKey =DR.ResellerKey
JOIN DimGeography AS DG 
ON DR.GeographyKey=DG.GeographyKey
GROUP BY DG.EnglishCountryRegionName,DR.ResellerName
ORDER BY 1,3 DESC

--.33. Fisaclyearwise Employeewise Average Sale from FactResellerSale

   SELECT DD. FiscalYear FiscalYear, DE.FirstName+' '+DE.LastName EmployeeName,
   AVG(FRS. SalesAmount)AverageSale
   FROM FactResellerSales FRS
   JOIN DimDate DD
   ON FRS.OrderDateKey = DD.DateKey
   JOIN DimEmployee DE
   ON FRS.EmployeeKey = DE.EmployeeKey
   GROUP BY DD.FiscalYear, DE.FirstName+' '+DE.LastName
   ORDER BY 1, 2 DESC

--34. Salesterritorywise employeewise categorywise Minimum and Maximum sales from FactInternetSales
SELECT DST.SalesTerritoryCountry TerritoryName, DE.FirstName+' '+LastName EmployeeName, DPC. EnglishProductCategoryName
   MIN (FIS.SalesAmount)MinimumSale, MAX(FIS.SalesAmount)MaximumSale
   FROM FactInternetSales FIS
   JOIN DimSalesTerritory DST
   ON FIS.SalesTerritoryKey = DST. SalesTerritoryKey
   JOIN DimEmployee DE
   ON DST.SalesTerritoryKey = DE.SalesTerritoryKey
   JOIN DimProduct DP
   ON FIS.ProductKey = DP.ProductKey
   JOIN DimProductSubcategory DPS
   ON DP. ProductSubcategoryKey = DPS.ProductSubcategoryKey
   JOIN DimProductCategory DPC
   ON DPS.ProductCategoryKey = DPC.ProductCategoryKey
   GROUP BY DST. SalesTerritoryCountry, DE.FirstName+' '+LastName, DPC.EnglishProductCategoryName
   ORDER BY 1,3



--35. Subcategorywise total sales from FactInternetSale

SELECT  DPS.EnglishProductSubcategoryName SUBCATEGORY,ROUND(SUM(FIS.SELCEAMOUNT).2)TOTALSELS
FROM FactInternetSales AS FIS
JOIN DimProduct AS DP
ON FIS.ProductKey=DP.ProductKey
JOIN DimProductSubcategory AS DPS
ON DP.ProductSubcategoryKey=DPS.ProductSubcategoryKey
GROUP BY DPS.EnglishProductSubcategoryName
ORDER BY 2 DESC

--36. Display Countrywise, Statewise ReseLlerwise Total sales from FactReseellerSale
SELECT DG.EnglishCountryRegionName Country, DG.StateProvinceName State, DR.ResellerName,SUM(FRS.SalesAmount)TotalSale
  FROM FactResellerSales FRS
  JOIN DimReseller DR
  ON FRS.ResellerKey = DR.ResellerKey
  JOIN DimGeography DG
  ON DR.GeographyKey = DG.GeographyKey
  GROUP BY DG.EnglishCountryRegionName, DG.StateProvinceName, DR.ResellerName
  ORDER BY 1, 4 DESC

--37. Display Sale Oredr Number, SalesOredrLineNumber, AmountDue from FactInternetSales
SELECT SalesOrderNumber,SalesOrderLineNumber,(SalesAmount+TaxAmt+Freight) AMOUNTDUE
FROM FactInternetSales

--38. Display EmployeeKey, EmployeeFullName, DepartmentName and ManagerName from DimEmployee
SELECT E.EmployeeKey,E.FirstName+' '+E.LastName EMPLOYEEFULLNAME,E.DepartmentName,
M.FirstName+''+M.LastName MANAGERNAME
FROM DimEmployee AS E
JOIN DimEmployee AS M
ON M.ParentEmployeeKeY=E.EmployeeKey
ORDER BY 1


--39. Display ManagerName from DimEmployee table and total number of employees reporting to him
SELECT M.FirstName+' '+M.LastName ManagerName, COUNT(E.FirstName) NumberofEmployees
  FROM DimEmployee E
  JOIN DimEmployee M
  ON E.ParentEmployeeKey = M.EmployeeKey
  GROUP BY M.FirstName+' '+M.LastName
  ORDER BY 2 DESC

 --40. Find the name of Customers who have registered more than 15 orders from FactInternetSales
	SELECT DC.FirstName+''+DC.LastName CUSTERMAENAME,COUNT(*)NUMBEROOFORDER
	FROM FactInternetSales AS FIS
	JOIN DimCustomer AS DC
	ON FIS.CustomerKey=DC.CustomerKey
	GROUP BY  DC.FirstName+''+DC.LastName
	HAVING COUNT(*)>15
	ORDER BY 2 DESC

	--41HW. Find the name of the Customers who had placed orders more than one time from FactInternetSales
	 --40. Find the name of Customers who have registered more than 15 orders from FactInternetSales
	SELECT DC.FirstName+''+DC.LastName CUSTERMAENAME,COUNT(*)NUMBEROOFORDER
	FROM FactInternetSales AS FIS
	JOIN DimCustomer AS DC
	ON FIS.CustomerKey=DC.CustomerKey
	GROUP BY  DC.FirstName+''+DC.LastName
	HAVING COUNT(*)>15
	ORDER BY 2 DESC
	--42. Display Categorywise Employeewise total sales having total sale greater than 200000 from FactInternetSales

SELECT DPC.EnglishProductCategoryName AS CATEGORY,DE.FirstName + ' ' + DE.LastName AS ENAME, 
SUM(FIS.SalesAmount) AS TOTALSELSE
FROM FactInternetSales FIS
JOIN DimSalesTerritory DST ON FIS.SalesTerritoryKey = DST.SalesTerritoryKey
JOIN DimEmployee DE ON DST.SalesTerritoryKey = DE.SalesTerritoryKey
JOIN DimProduct DP ON FIS.ProductKey = DP.ProductKey
JOIN DimProductSubcategory DPS ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
JOIN DimProductCategory DPC ON DPS.ProductCategoryKey = DPC.ProductCategoryKey
GROUP BY DPC.EnglishProductCategoryName,DE.FirstName + ' ' + DE.LastName
HAVING SUM(FIS.SalesAmount) > 200000
ORDER BY TOTALSELSE DESC;


--43. Which are the top 10 selling products from FactInternetSales
WITH ProductList AS
(
    SELECT DP.EnglishProductName AS PRODUCT, SUM(FIS.SalesAmount) AS TotalSale
    FROM FactInternetSales FIS
    JOIN DimProduct DP ON FIS.ProductKey = DP.ProductKey
    GROUP BY DP.EnglishProductName
    --ORDER BY TotalSale DESC
),
SortedProductList AS
(
    SELECT PL.Product, PL.TotalSale,
    ROW_NUMBER() OVER (ORDER BY PL.TotalSale DESC) AS SrNo
    FROM ProductList AS PL
)
SELECT SPL.SrNo, SPL.Product, SPL.TotalSale
FROM SortedProductList AS SPL
WHERE SPL.SrNo <= 10;

--44HW. Which are the top 25 selling products from FactInternetSales

WITH TopSellingProduct AS
(
    SELECT DP.EnglishProductName AS Product, SUM(FIS.SalesAmount) AS TotalSale
    FROM FactInternetSales FIS
    JOIN DimProduct DP
    ON FIS.ProductKey = DP.ProductKey
    GROUP BY DP.EnglishProductName
),
SortedTopSellingProduct AS 
(
    SELECT TSP.Product, TSP.TotalSale, ROW_NUMBER() OVER (ORDER BY TSP.TotalSale DESC) AS SrNo
    FROM TopSellingProduct AS TSP
)
SELECT S.SrNo, S.Product, S.TotalSale
FROM SortedTopSellingProduct AS S
WHERE S.SrNo <= 25;

--45. Create the output which will give me Top 3 products by employeewise (full name) from FactResellerSales for Financial Year 2007
WITH EmployewiseProductList AS
(
    SELECT 
        DE.FirstName + ' ' + DE.LastName AS EmployeeName,
        DP.EnglishProductName AS Product,
        SUM(FRS.SalesAmount) AS TotalSale
    FROM 
        FactResellerSales FRS
        JOIN DimEmployee DE ON FRS.EmployeeKey = DE.EmployeeKey
        JOIN DimProduct DP ON FRS.ProductKey = DP.ProductKey
        JOIN DimDate DD ON FRS.OrderDateKey = DD.DateKey
    WHERE 
        DD.FiscalYear = 2007
    GROUP BY  
        DE.FirstName + ' ' + DE.LastName, 
        DP.EnglishProductName
),
SortedEmployeeProductList AS 
(
    SELECT 
        EPL.EmployeeName,
        EPL.Product,
        EPL.TotalSale,
        DENSE_RANK() OVER (PARTITION BY EPL.EmployeeName ORDER BY EPL.TotalSale DESC) AS SrNo
    FROM 
        EmployewiseProductList AS EPL
)
SELECT 
    SEPL.SrNo,
    SEPL.EmployeeName,
    SEPL.Product,
    SEPL.TotalSale
FROM 
    SortedEmployeeProductList AS SEPL
WHERE 
    SEPL.SrNo <= 3;


--46HW. Subcategorywise top 2 selling products from FactInternetSales

WITH SubCategorySale AS
(
SELECT DP.EnglishProductName Product, DPS.EnglishProductSubcategoryName SubCategory,
SUM(FIS.SalesAmount)TotalSale
FROM FactInternetSales FIS
JOIN DimProduct DP 
ON FIS.ProductKey= DP.ProductKey
JOIN DimProductSubcategory DPS
ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
GROUP BY DP.EnglishProductName,  DPS.EnglishProductSubcategoryName
--ORDER BY 1, 2, 3 DESC
),SortedSubCategory AS 
(
SELECT SCS.Product, SCS.SubCategory, SCS.TotalSale,
DENSE_RANK()OVER(PARTITION BY SCS.SubCategory ORDER BY SCS.TotalSale DESC)SrNo
FROM SubCategorySale AS SCS
)
SELECT SSC.SrNo, SSC.Product, SSC.SubCategory, SSC.TotalSale
FROM SortedSubCategory AS SSC
WHERE SSC.SrNo <= 2

--47. Create output from FactResellerSales to list products where products total sale 
--is less than average sale per produc
--1)TO CALCULAT AVJSELS[ER PRODUCT
--2)FRS.DP.AVJSELS
--3)


WITH AVGSALE AS
(

SELECT SUM(FRS.SalesAmount)/COUNT(DISTINCT FRS.PRODUCTKEY)AVERAJESELPERPRODUCT
FROM FactResellerSales AS FRS
)
SELECT DP.EnglishProductName PRODUCT,SUM(FRS.SalesAmount)PTOTALSALE,
AVERAJESELPERPRODUCT
FROM AVGSALE,FactResellerSales FRS
JOIN DimProduct DP
ON FRS.ProductKey=DP.ProductKey
GROUP BY DP.EnglishProductName,AVGSALE.AVERAJESELPERPRODUCT
HAVING SUM(FRS.SalesAmount)<AVGSALE.AVERAJESELPERPRODUCT
ORDER BY 1


--48. Give me the list of countries whose sales is greater than AverageSalePerCountry from FactResellerSales


WITH CountrySale AS
(
SELECT DG.EnglishCountryRegionName CountryName, SUM(FRS.SalesAmount)TotalSale
FROM FactResellerSales FRS
JOIN DimReseller DR
ON FRS.ResellerKey = DR.ResellerKey
JOIN DimGeography DG
ON DR.GeographyKey = DG.GeographyKey
GROUP BY DG.EnglishCountryRegionName
), CountryAvgSale AS
(
SELECT ROUND(AVG(CS.TotalSale),2)AvgSalesPerCountry
FROM CountrySale AS CS
)
SELECT CS.CountryName, CS.CountryName, CAS.AvgSalesPerCountry
FROM CountrySale AS CS
CROSS JOIN CountryAvgSale AS CAS
WHERE CS.TotalSale > CAS.AvgSalesPerCountry
ORDER BY 1;



--49. From FactInternetSales each employee's highest and lowest selling product for year 2008.
-- FACTINTERNET , EMPLOYEE, PRODUCT, DATE ARE REQUIRED
-- EMPLOYEWISE, PRODUCTWISE TOTAL SALE FOR YEAR 2008
--TOTALSALE ORDER BY PERTITION SRNO WHERE HIGHEST SELLING PRODUCT
--TOTALSALE ORDER BY PERTITION SRNO WHERE LOWEST SELLING PRODUCT


WITH EMPLOYEEPRODUCTLIST AS
(
    SELECT 
        DE.FirstName + ' ' + DE.LastName AS EMPLOYEE,
        DP.EnglishProductName AS PRODUCTNAME,
        SUM(FIS.SalesAmount) AS TOTALSALES
    FROM 
        FactInternetSales FIS
    JOIN 
        DimSalesTerritory DST ON FIS.SalesTerritoryKey = DST.SalesTerritoryKey
    JOIN 
        DimEmployee DE ON DST.SalesTerritoryKey = DE.SalesTerritoryKey
    JOIN 
        DimProduct DP ON FIS.ProductKey = DP.ProductKey
    JOIN 
        DimDate DD ON FIS.OrderDateKey = DD.DateKey
    WHERE 
        DD.FiscalYear = 2008
    GROUP BY 
        DE.FirstName + ' ' + DE.LastName,
        DP.EnglishProductName
),
SORTEDENPLOYEEPRODUCTLIST AS
(
    SELECT 
        EPL.EMPLOYEE,
        EPL.PRODUCTNAME,
        EPL.TOTALSALES,
        ROW_NUMBER() OVER (PARTITION BY EPL.EMPLOYEE ORDER BY EPL.TOTALSALES DESC) AS SRNO
    FROM 
        EMPLOYEEPRODUCTLIST AS EPL
),
HIGHESTSELLINGPRODUCT AS
(
    SELECT 
        SEPL.SRNO,
        SEPL.EMPLOYEE,
        SEPL.PRODUCTNAME,
        SEPL.TOTALSALES
    FROM 
        SORTEDENPLOYEEPRODUCTLIST AS SEPL
    WHERE 
        SEPL.SRNO = 1
),
SORTEDEMPLOYEEPRODUCTLISTASC AS
(
    SELECT 
        EPL.EMPLOYEE,
        EPL.PRODUCTNAME,
        EPL.TOTALSALES,
        ROW_NUMBER() OVER (PARTITION BY EPL.EMPLOYEE ORDER BY EPL.TOTALSALES) AS SRNO
    FROM 
        EMPLOYEEPRODUCTLIST AS EPL
),
LOWESTSELLINGPRODUCT AS
(
    SELECT 
        SEPLA.SRNO,
        SEPLA.EMPLOYEE,
        SEPLA.PRODUCTNAME,
        SEPLA.TOTALSALES
    FROM 
        SORTEDEMPLOYEEPRODUCTLISTASC AS SEPLA
    WHERE 
        SEPLA.SRNO = 1
)
SELECT 
    HSP.EMPLOYEE,
    HSP.PRODUCTNAME AS HIGHEST_SELLING_PRODUCT,
    HSP.TOTALSALES AS HIGHEST_TOTALSALES,
    LSP.PRODUCTNAME AS LOWEST_SELLING_PRODUCT,
    LSP.TOTALSALES AS LOWEST_TOTALSALES
FROM 
    HIGHESTSELLINGPRODUCT HSP
JOIN 
    LOWESTSELLINGPRODUCT LSP ON HSP.EMPLOYEE = LSP.EMPLOYEE;
