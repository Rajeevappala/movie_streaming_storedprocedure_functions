# 🏨 HotelDatabase – Stored Procedures & Functions

This project demonstrates how to modularize SQL logic in **SQL Server (SSMS)** using **stored procedures** and **functions**.  
The implementation is based on the `HotelDatabase` schema with two core tables:

- **CUSTOMERS**  
- **ORDERS**

---

## 📌 Objectives
- Learn reusable SQL blocks  
- Use **CREATE PROCEDURE** and **CREATE FUNCTION** with parameters  
- Apply joins and aggregations for reporting  

---

## 📂 Deliverables
The attached **`HotelDatabase_Procedures_Functions.sql`** file contains:
- Stored Procedures  
  - `GetCustomerOrders` – fetch orders by customer  
  - `GetCustomerWithOrders` – customer details with their orders  
- Functions  
  - `GetTotalSpent` – total amount spent by a customer  
  - `GetCustomerOrderCount` – number of orders placed by a customer  

---

## 🛠️ Tools Used
- SQL Server Management Studio (SSMS)  
- T-SQL  

---

## 📊 Schema Overview

- CUSTOMERS (CustomerId, FirstName, LastName, Email)
- ORDERS (OrderId, CustomerId, OrderDate, TotalAmount)
