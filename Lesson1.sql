SELECT		c.CustomerId,
			c.FirstName,
			c.LastName,
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

SELECT		i.CustomerId, i.BillingCountry,
			SUM(i.Total) AS InvoiceTotal
FROM		Invoice AS i
GROUP BY	i.CustomerId, i.BillingCountry
ORDER BY	i.CustomerId;