/*
This file contains a script of Transact SQL (T-SQL) command to interact with an existing database named 'Inventory'.
Details:
- Sets the default database to 'Inventory'.
- Creates a 'categories' table and related 'products' table if they do not already exist. (one to many relationship between 'categories' and 'products')
- Remove all rows from the tables (just in case they already existed).
- Populates the 'Categories' table with sample data.
- Populates the 'Products' table with sample data.
- Creates three stored procedures:
    1. GetProductsByCategory: Retrieves all products in a specific category.
    2. GetHighestPricedProductByCategory: Retrieves the highest priced product in a specific category.
    3. UpdateProductPrice: Updates the price of a product.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Errors:
- If the database 'Inventory' does not exist, the script will print an error message and then exit.
*/


-- check if the database 'Inventory' exists before proceeding
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Inventory')
BEGIN
    PRINT 'Error: The database ''Inventory'' does not exist. Please create the database first.'
    RETURN
END

-- set the default database to 'Inventory'
USE Inventory

-- create the 'categories' table if it does not already exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryID INT PRIMARY KEY,
        CategoryName NVARCHAR(50) NOT NULL
    )
END

-- create the 'products' table if it does not already exist (with a foreign key constraint to 'categories')
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductID INT PRIMARY KEY,
        ProductName NVARCHAR(50) NOT NULL,
        CategoryID INT,
        -- Add a timestamp column to track when the row was created or last updated
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
    )
END

-- remove all rows from the 'Products' table followed by removing all rows from the 'Categories' tables.
TRUNCATE TABLE Products
TRUNCATE TABLE Categories

-- populate the 'Categories' table with sample data
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Toys'),
(5, 'Home Goods'),
(6, 'Sporting Goods')


-- populate the 'Products' table with sample data   
INSERT INTO Products (ProductID, ProductName, CategoryID) VALUES
(1, 'Laptop', 1),
(2, 'Smartphone', 1),
(3, 'T-shirt', 2),
(4, 'Jeans', 2),
(5, 'Novel', 3),
(6, 'Textbook', 3),
(7, 'Action Figure', 4),
(8, 'Board Game', 4),
(9, 'Couch', 5),
(10, 'Bed', 5),
(11, 'Basketball', 6),
(12, 'Tennis Racket', 6)

/*
Create a stored proc to get all products in a specific category
*/
CREATE PROCEDURE GetProductsByCategory
    @CategoryID INT
AS
BEGIN
    SELECT * FROM Products WHERE CategoryID = @CategoryID
END


/*
Create a stored proc to retrieve the highest priced product in a specific category
*/
CREATE PROCEDURE GetHighestPricedProductByCategory
    @CategoryID INT
AS
BEGIN
    SELECT TOP 1 * FROM Products WHERE CategoryID = @CategoryID ORDER BY Price DESC
END


/*
Create a stored proc to update the price of a product
*/
CREATE PROCEDURE UpdateProductPrice
    @ProductID INT,
    @NewPrice DECIMAL
AS
BEGIN
    UPDATE Products SET Price = @NewPrice WHERE ProductID = @ProductID
END

-- End of script