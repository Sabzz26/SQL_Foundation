SELECT		c.CustomerId,
			c.FirstName,
			c.LastName,
			CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
			c.City,
			c.Company
FROM		Customer AS C
WHERE		c.Company IS NOT NULL
--WHERE	c.City IN ('London', 'Paris', 'Rome', 'Berlin')
--WHERE		c.LastName LIKE '%R'
ORDER BY	c.Company ASC;


SELECT
	c.Country,
	count(*) AS NumberOfCustomers
FROM	Customer AS c
GROUP BY c.Country
ORDER BY NumberOfCustomers DESC

--looking at invoices

SELECT	i.InvoiceId,
		i.InvoiceDate,
		i.CustomerId,
		i.Total
FROM	Invoice AS i;



SELECT		i.CustomerId,
			c.FirstName,
			c.LastName,
			CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
			SUM(i.Total) AS InvoiceTotal,
			COUNT(*) AS NumberOfInvoices
FROM		Invoice AS i
			INNER JOIN
			Customer AS c
			ON i.CustomerId = c.CustomerId
GROUP BY	i.CustomerId, c.FirstName, c.LastName
ORDER BY	i.CustomerId;


-- Alternative Way

SELECT	ibc.CustomerId,
		CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
		CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
		ibc.InvoiceTotal,
		ibc.NumberOfInvoices
FROM	(SELECT		i.CustomerId,
					SUM(i.Total) AS InvoiceTotal,
					COUNT(*) AS NumberOfInvoices
		FROM		Invoice AS i
		GROUP BY	i.CustomerId) AS ibc
		INNER JOIN
		Customer AS c
		ON ibc.CustomerID = c.CustomerId JOIN Employee AS e
		ON e.EmployeeId = c.SupportRepId


-- Customers & Employees

SELECT		e.EmployeeId,
			CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
			c.CustomerId,
			CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM		Employee AS e
			INNER JOIN
			Customer AS c
			ON c.SupportRepId = e.EmployeeId
ORDER BY	e.EmployeeId, c.CustomerId;
	
