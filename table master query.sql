SELECT
  o.Date AS order_date,
  cat.CategoryName AS category_name,
  p.ProdName AS product_name,
  p.Price AS product_price,
  o.Quantity AS order_qty,
  (o.Quantity * p.Price) AS total_sales,
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city

FROM
  `bank_muamalat.orders` AS o
LEFT JOIN
  `bank_muamalat.customers` AS c
  ON o.CustomerID = c.CustomerID
LEFT JOIN
  `bank_muamalat.products` AS p
  ON o.ProdNumber = p.ProdNumber
LEFT JOIN
  `bank_muamalat.product_category` AS cat
  ON p.Category = cat.CategoryID

ORDER BY
  order_date ASC;