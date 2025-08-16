use HotelDatabase

-- Get all orders of a given customer by passing their CustomerId.

CREATE PROCEDURE GetCustomerOrders
    @custId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT o.OrderId, o.TotalAmount, o.OrderDate
    FROM ORDERS o
    WHERE o.CustomerId = @custId;
END;

EXEC GetCustomerOrders @custId = 1001;



--- Customer details along with all their orders.
CREATE PROCEDURE GetCustomerWithOrders
    @custId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT c.CustomerId, c.FirstName, c.LastName, 
           o.OrderId, o.OrderDate, o.TotalAmount
    FROM CUSTOMERS c
    INNER JOIN ORDERS o ON c.CustomerId = o.CustomerId
    WHERE c.CustomerId = @custId;
END;

EXEC GetCustomerWithOrders @custId = 1001;



--- Calculate the total amount spent by a customer.

CREATE FUNCTION GetTotalSpent (@custId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @totalSpent DECIMAL(10,2);

    SELECT @totalSpent = ISNULL(SUM(TotalAmount), 0)
    FROM ORDERS
    WHERE CustomerId = @custId;

    RETURN @totalSpent;
END;

SELECT dbo.GetTotalSpent(1001) AS Total_Spent;

--- Get the total number of orders a customer has placed

CREATE FUNCTION GetCustomerOrderCount (@custId INT)
RETURNS INT
AS
BEGIN
    DECLARE @orderCount INT;

    SELECT @orderCount = COUNT(o.OrderId)
    FROM CUSTOMERS c
    INNER JOIN ORDERS o ON c.CustomerId = o.CustomerId
    WHERE c.CustomerId = @custId;

    RETURN @orderCount;
END;



SELECT dbo.GetCustomerOrderCount(1002) AS Total_Orders;
