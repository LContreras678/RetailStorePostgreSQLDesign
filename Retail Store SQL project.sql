/*To begin the facilitation of tables, tables are dropped with the DROP Table statement. 
It will delete the table and all information will be removed. (TutorialsPoint, 2025a)
Once this is done, the tables will then be created in the perceding code by using the CREATE statement.

The IF statement is used to allow the EXISTS operator to function, which will activate the CASCADE statement.
The IF statement allows expressions to be evaluated, as long as the condition matches it to be true. (Gupta, 2019).
The EXISTS operator will check for any existing records of the entities (e.g. Product or Customer) (Refsnes Data and W3Schools, 2025a).
The CASCADE statement will trigger the DROP TABLE statement, since a change has occured for the Tables. (GeeksforGeeks, 2024)
*/
DROP TABLE IF EXISTS Warehouse_Item CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Store CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Transactions CASCADE;

/*
The tables are created below for each entity: Customer, Product, Store, Warehouse Items and Transactions).
Creating tables allow to create databases to define the entities and the relationships they have for Millie's Musical Emporium.
(SQLBolt, 2024)
The IDs for each Entity serve as the Primary Key (e.g. Customer_ID is the PRIMARY KEY for the Customer entity).
The Primary Keys allow the data stored in the database to be uniquely identified and to establish relationships between other entities.
(TutorialsPoint, 2025b)
*/

CREATE TABLE Customer(
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Fname VARCHAR(20) NOT NULL,
    Customer_Sname VARCHAR(20) NOT NULL,
    Customer_Address VARCHAR(100) NOT NULL,
    Customer_Phone_No VARCHAR(20) NOT NULL,
    Customer_DOB DATE,
    Customer_Bank_Name VARCHAR(50) NOT NULL,
    Customer_Bank_Address VARCHAR(100) NOT NULL,
    Customer_Bank_Sort_Code INTEGER NOT NULL,
    Customer_Bank_Account_No INTEGER NOT NULL
);

CREATE TABLE Product(
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Product_Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Store(
    Store_ID VARCHAR(5) PRIMARY KEY,
    Store_Name VARCHAR(50) NOT NULL,
    Store_Address VARCHAR(50)
);

CREATE TABLE Warehouse_Item(
    Warehouse_Item_ID VARCHAR(10) PRIMARY KEY,
    Product_ID VARCHAR(10) NOT NULL,
    Stock_Level INTEGER NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Transactions(
    Transaction_ID VARCHAR(50) PRIMARY KEY,
    Customer_ID VARCHAR(10) NOT NULL,
    Product_ID VARCHAR(10) NOT NULL,
    Transaction_Date DATE NOT NULL,
    Delivery_Date_To_Customer DATE NOT NULL,
    Delivery_Slot_For_Customer VARCHAR(50) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

/*
Sample data has been placed for the Entities in order to initiate the functionality of the SQL script. 
Data is inserted to the databases by using INSERT. To place data into the tables, INSERT INTO is written. (Navlani, 2019)
The data is then placed into the columns as shown below by using VALUES and placing them in their respective columns. (TutorialsPoint, 2025b)
*/

INSERT INTO Customer(
Customer_ID, Customer_Fname, Customer_Sname, Customer_Address, Customer_Phone_No, Customer_DOB,
Customer_Bank_Name, Customer_Bank_Address, Customer_Bank_Sort_Code, Customer_Bank_Account_No
) VALUES 
('C00', 'Sam', 'Smith', '123 Someplace Road, York', '07897897890', '1999-07-10', 'Generic Bank', '24 Deposit Road, London', 456456, 78978912),
('C01', 'Taylor', 'Swift', '13 December Road, Catford', '07246246892', '1989-12-13', 'American Bank', '13 Vault Street, London', 123123, 45645689),
('C02', 'Lena', 'Oxton', '2 Kings Row, London', '07654654124', '2000-12-09', 'Omni Bank', '12 Payload Valley, London', 898989, 32323223),
('C03', 'Peter', 'Parker', '56 Friendly Street, London', '07636363455', '2000-01-02', 'Old Bank', '54 Web Street, London', 787889, 31313113);

INSERT INTO Product(
Product_ID, Product_Name, Product_Category, Product_Price
) VALUES
('P001', 'How to Play the Guitar in 30 Days', 'Instrument Tutorial Books', 19.99),
('P002', 'Piano Essential Tricks', 'Instrument Tutorial Books', 17.99),
('P003', 'Sender Sunburst Electric Guitar', 'Musical Instruments', 149.99),
('P004', 'Plesis Electric Piano', 'Musical Instruments', 299.99),
('P005', 'RGBX Bass Guitar', 'Musical Instruments', 159.99),
('P006', 'Taylor Swift Fearless CD', 'Disc Media', 9.99),
('P007', 'Sender Official Guitar DVD Learner Series Volume 1', 'Disc Media', 12.99),
('P008', 'Bee Gees Live in London DVD', 'Disc Media', 14.99),
('P009', 'Aerosmith Essential CD Volume 1', 'Disc Media', 9.99),
('P010', 'Taylor Swift Tortured Poets Department Complete Sheet Music', 'Sheet Music', 19.99),
('P011', '100 Famous Guitar Riffs to Learn', 'Sheet Music', 7.99),
('P012', 'The Beatles Greatest Hits on Piano', 'Sheet Music', 18.99);

INSERT INTO Store(
Store_ID, Store_Name, Store_Address
) VALUES
('S001', 'Millies Musical Emporium London', '123 Main Street, London'),
('S002', 'Millies Musical Emporium Newcastle', '456 Coda Road, Newcastle'),
('S003', 'Millies Musical Emporium Bristol', '101 Piano Street, Cardiff');

INSERT INTO Warehouse_Item(
Warehouse_Item_ID, Product_ID, Stock_Level
) VALUES
('WH001', 'P001', 178),
('WH002', 'P002', 158),
('WH003', 'P003', 80),
('WH004', 'P004', 72),
('WH005', 'P005', 76),
('WH006', 'P006', 88),
('WH007', 'P007', 155),
('WH008', 'P008', 325),
('WH009', 'P009', 99),
('WH010', 'P010', 235),
('WH011', 'P011', 279),
('WH012', 'P012', 200);

/* Sample data is placed for the Transactions entity. Delivery slots are based in three zones: Early Morning (8am-10am), Late Morning (10am-12pm), Early Afternoon (12pm-3pm), Late Afternoon (3pm-5pm), Evening (5pm-7pm) and Night (7pm-9pm)
*/

INSERT INTO Transactions(
    Transaction_ID, Customer_ID, Product_ID, Transaction_Date, Delivery_Date_To_Customer, Delivery_Slot_For_Customer
) VALUES 
    ('TS001', 'C00', 'P003', '2024-12-29', '2025-01-07', 'Early Morning (8am-10am)'), 
    ('TS002', 'C00', 'P006', '2024-12-29', '2025-01-07', 'Early Morning (8am-10am)'),  
    ('TS003', 'C01', 'P010', '2024-12-29', '2025-01-07', 'Early Morning (8am-10am)'), 
    ('TS004', 'C00', 'P002', '2024-11-24', '2024-11-27', 'Early Afternoon (12pm-3pm)'), 
    ('TS005', 'C02', 'P011', '2024-06-13', '2024-06-18', 'Late Afternoon (3pm-5pm)'), 
    ('TS006', 'C03', 'P005', '2024-09-12', '2024-09-16', 'Evening (5pm-7pm)'), 
    ('TS007', 'C03', 'P012', '2024-03-22', '2024-03-27', 'Night (7pm-9pm)'), 
    ('TS008', 'C03', 'P004', '2024-03-22', '2024-03-27', 'Night (7pm-9pm)'),
    ('TS009', 'C02', 'P009', '2024-03-10', '2024-03-14', 'Late Morning (10am-12pm)');


/*
The CREATE commands allow the user in order (for this instance) add functionality in order to add information. (Drkusic, 2020)  
Here it is used in order to provide the ability for this SQL script to register or add new customers. 
Another function has also been defined in order to allow the customer to purchase a product, check for delivery slot availability and to prevent clashing.
The c and p prefixes is added for visual clarity when creating and defining the CREATE function for PurchaseProduct. 
The RETURNS statement ends the stored procedure once it has been called. (IBM Corporation, 2024)
If the return statement is successful, it will return with VOID. 
*/

CREATE OR REPLACE FUNCTION PurchaseProduct(
    p_Transaction_ID VARCHAR(50),
    p_Customer_ID VARCHAR(10),
    p_Product_ID VARCHAR(10),
    p_Delivery_Date DATE,
    p_Delivery_Slot VARCHAR(50),
    p_Transaction_Date DATE
) RETURNS VOID AS $$
/*
The DECLARE is placed here to use the variables written below. (Erkec, 2019)
The variables are focused in different actions to complete the purchase process: using a BOOLEAN value (True or False) to see if there is availability in delivery, if there is available stock and pushing the delivery date to be done on Monday.
*/
DECLARE
    product_stock INTEGER;
    delivery_time_clash BOOLEAN;
	set_delivery_weekday DATE;
BEGIN
/*
As the syntax for SQL, once something has been declared, a BEGIN statement can be used (IBM Corporation, 2021a) to activate the IF statement.
A RAISE statement is written in order to handle for exceptions in cases such as the Product ID not existing or the Delivery Slot has already been taken. (IBM Corporation, 2021b)
*/
    IF NOT EXISTS (SELECT 1 FROM Product WHERE Product_ID = p_Product_ID) THEN
        RAISE EXCEPTION 'This product does not exist or is not registered: Product ID %', p_Product_ID;
    END IF;
    SELECT Stock_Level INTO product_stock
    FROM Warehouse_Item
    WHERE Product_ID = p_Product_ID;

    IF product_stock IS NULL THEN
        RAISE EXCEPTION 'Product ID % has no stock remaining in the warehouse.', p_Product_ID;
    ELSIF product_stock <= 0 THEN
        RAISE EXCEPTION 'Product ID % is out of stock.', p_Product_ID;
    END IF;

/*
The SELECT statement below focuses on checking for the Delivery date availability. The Customer ID also checked by using the Not Equal operator (!=)(MariaDB, 2025), which is done to check for schedules clashing in delivery slots.
*/
    SELECT EXISTS(
        SELECT 1
        FROM Transactions
        WHERE Delivery_Date_To_Customer = p_Delivery_Date
        AND Delivery_Slot_For_Customer = p_Delivery_Slot
		AND Customer_ID != p_Customer_ID
    ) INTO delivery_time_clash;

    IF delivery_time_clash THEN
        RAISE EXCEPTION 'Delivery slot % on % is not available. Please choose another delivery slot and date.', 
                        p_Delivery_Slot, p_Delivery_Date;
    END IF;

/*
Millie's Musical Emporium will deliver on weekdays only, so the delivery date is shifted into the nearest weekday (Monday).
EXTRACT is used so that the delivery date is shifted slightly. (Hightouch, 2025)
0 to 6 represents the days of the week. 1 is Monday, 2 is Tuesday, etc. ; 6 is Saturday and 0 is Sunday and the delivery dates are shifted
(Sybase Inc., 2009)
*/

	IF EXTRACT(DOW FROM p_Delivery_Date) = 6 THEN
		set_delivery_weekday:= p_Delivery_Date + INTERVAL '1 day';
	ELSIF EXTRACT(DOW FROM p_Delivery_Date) = 0 THEN
		set_delivery_weekday:= p_Delivery_Date + INTERVAL '2 days';
	ELSE
		set_delivery_weekday:= p_Delivery_Date;
	END IF;
/*
The Warehouse_Item entity needs to deduct the quantity available, so the UPDATE command is placed here. (Refsnes Data and W3Schools, 2025b)
The Stock_Level is reduced by 1 and using the subtraction symbol (-) and seeks it from the Product_ID (which is the unique identifier to find the item).
*/
    UPDATE Warehouse_Item
    SET Stock_Level = Stock_Level - 1
    WHERE Product_ID = p_Product_ID;
/*
The information is placed into the Transactions entity to place information into their respective columns. The current date is also taken into account when establishing the delivery dates.
*/

    INSERT INTO Transactions(
        Transaction_ID, Customer_ID, Product_ID, Transaction_Date, Delivery_Date_To_Customer, Delivery_Slot_For_Customer
    ) VALUES (
        p_Transaction_ID, p_Customer_ID, p_Product_ID, CURRENT_DATE, set_delivery_weekday, p_Delivery_Slot
    );

/*
A NOTICE message is raised to notify that the item has been purchased succcessfully. 
*/
		RAISE NOTICE 'Product was purchased successfully! | Product ID: %, Transaction ID: %, Delivery Date: %, Delivery Slot: %',
             p_Product_ID, p_Transaction_ID, set_delivery_weekday, p_Delivery_Slot;


END;
$$ LANGUAGE plpgsql;

/*
A similar method was used here in order to register or add new customers to the database. 
*/

CREATE OR REPLACE FUNCTION AddNewCustomer(
    c_Customer_ID VARCHAR(10),
    c_Customer_Fname VARCHAR(20),
    c_Customer_Sname VARCHAR(20),
    c_Customer_Address VARCHAR(100),
    c_Customer_Phone_No VARCHAR(20),
    c_Customer_DOB DATE,
    c_Customer_Bank_Name VARCHAR(50),
    c_Customer_Bank_Address VARCHAR(100),
    c_Customer_Bank_Sort_Code INTEGER,
    c_Customer_Bank_Account_No INTEGER
) RETURNS VOID AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Customer WHERE Customer_ID = c_Customer_ID) THEN
        RAISE EXCEPTION 'This customer is already registered: Customer ID % | First Name: % | Last Name: %', 
            c_Customer_ID,
            (SELECT Customer_Fname FROM Customer WHERE Customer_ID = c_Customer_ID),
            (SELECT Customer_Sname FROM Customer WHERE Customer_ID = c_Customer_ID);

    ELSIF EXISTS (SELECT 1 FROM Customer WHERE Customer_Phone_No = c_Customer_Phone_No) THEN
        RAISE EXCEPTION 'This phone number has already been registered: Phone Number: % | First Name: % | Last Name: %', 
            c_Customer_Phone_No,
            (SELECT Customer_Fname FROM Customer WHERE Customer_Phone_No = c_Customer_Phone_No),
            (SELECT Customer_Sname FROM Customer WHERE Customer_Phone_No = c_Customer_Phone_No);
    ELSE 
        INSERT INTO Customer(
            Customer_ID, Customer_Fname, Customer_Sname, Customer_Address, Customer_Phone_No,
            Customer_DOB, Customer_Bank_Name, Customer_Bank_Address, Customer_Bank_Sort_Code, Customer_Bank_Account_No
        ) VALUES (
            c_Customer_ID, c_Customer_Fname, c_Customer_Sname, c_Customer_Address, c_Customer_Phone_No,
            c_Customer_DOB, c_Customer_Bank_Name, c_Customer_Bank_Address, c_Customer_Bank_Sort_Code, c_Customer_Bank_Account_No
        );
    END IF;
END;
$$ LANGUAGE plpgsql;


/* SELECT statement in order to add or register a new customer.*/
SELECT AddNewCustomer(
'C04', 'Tony', 'Stark', '20 Avengers Compound, Norwich', '07123457856', '1979-02-25','Stark Bank Industries', '10 Banking Avenue', 568780, 10012312
);
SELECT AddNewCustomer('C05', 'Hope', 'van Dyne', '20 Avengers Compound, Norwich', '075454545454', '1989-04-24', 'Pym Bank', '520 Savings Lane', 989898, 54754745);

/* SELECT statement in order to purchase a product and book a delivery.
The first two purchases are made by newly registered users, Tony Stark and Hope van Dyne. 
A new transaction is made per product and customers can purchase multiple items.*/

SELECT PurchaseProduct(
    'TS010', 'C05', 'P004', '2025-01-14', 'Late Afternoon (3pm-5pm)', CURRENT_DATE
);

SELECT PurchaseProduct(
	'TS011', 'C05', 'P005', '2025-01-14', 'Late Afternoon (3pm-5pm)', CURRENT_DATE
);

SELECT PurchaseProduct(
	'TS012', 'C04', 'P011', '2025-01-16', 'Early Morning (8am-10am)', CURRENT_DATE
);

SELECT PurchaseProduct(
	'TS013', 'C00', 'P003', '2025-01-17', 'Evening (5pm-7pm)', CURRENT_DATE
);

SELECT PurchaseProduct(
	'TS014', 'C00', 'P004', '2025-01-17', 'Evening (5pm-7pm)', CURRENT_DATE
);

SELECT PurchaseProduct(
	'TS015', 'C02', 'P004', '2025-01-17', 'Night (7pm-9pm)', CURRENT_DATE
);

SELECT PurchaseProduct(
	'TS016', 'C02', 'P011', '2025-01-17', 'Late Afternoon (3pm-5pm)', CURRENT_DATE
);


SELECT * FROM Transactions; 

/* References 

Drkusic, E. (2020). Learn SQL: User-Defined Functions. 
[online] SQL Shack - articles about database auditing, server performance, data recovery, and more. 
Available at: https://www.sqlshack.com/learn-sql-user-defined-functions/ 
[Accessed 4 Jan. 2025].

Erkec, E. (2019). SQL Variables: Basics and usage. [online] 
SQL Shack - articles about database auditing, server performance, data recovery, and more. 
Available at: https://www.sqlshack.com/sql-variables-basics-and-usage/ 
[Accessed 5 Jan. 2025].

GeeksforGeeks (2023). Cascade in SQL. [online] 
GeeksforGeeks. Available at: https://www.geeksforgeeks.org/cascade-in-sql/ 
[Accessed 4 Jan. 2025].

Gupta, R. (2019). SQL IF Statement introduction and overview. [online] 
SQL Shack - articles about database auditing, server performance, data recovery, and more. 
Available at: https://www.sqlshack.com/sql-if-statement-introduction-and-overview/ 
[Accessed 4 Jan. 2025].

Hightouch (2025). SQL EXTRACT - Syntax, Use Cases, and Examples. [online] 
hightouch.com. 
Available at: https://hightouch.com/sql-dictionary/sql-extract 
[Accessed 5 Jan. 2025].

IBM Corporation (2021a). Exception handling (PL/SQL). [online] Ibm.com. 
Available at: https://www.ibm.com/docs/en/ias?topic=plsql-exception-handling 
[Accessed 5 Jan. 2025].

IBM Corporation (2021b). RAISE statement (PL/SQL). [online] Ibm.com. 
Available at: https://www.ibm.com/docs/en/ias?topic=plsql-raise-statement 
[Accessed 5 Jan. 2025].

IBM Corporation (2024). Db2 12.1 RETURN statement in SQL procedures. [online] Ibm.com. 
Available at: https://www.ibm.com/docs/en/db2/12.1?topic=procedures-return-statement-in-sql 
[Accessed 4 Jan. 2025].

MariaDB (2025). Not Equal Operator: !=. [online] MariaDB KnowledgeBase. 
Available at: https://mariadb.com/kb/en/not-equal/ 
[Accessed 5 Jan. 2025].

Navlani, A. (2019). SQL Insert Tutorial — Inserting Records into a Database. [online] Dataquest. 
Available at: https://www.dataquest.io/blog/sql-insert/ [Accessed 4 Jan. 2025].

Refsnes Data and W3Schools (2025a). SQL EXISTS Operator. [online] www.w3schools.com. 
Available at: https://www.w3schools.com/sql/sql_exists.asp 
[Accessed 4 Jan. 2025].

Refsnes Data and W3Schools (2025b). SQL UPDATE. [online] www.w3schools.com. 
Available at: https://www.w3schools.com/sql/sql_ref_update.asp 
[Accessed 5 Jan. 2025].

SQLBolt (2024). SQLBolt - Learn SQL - SQL Lesson 16: Creating tables. [online] Sqlbolt.com. 
Available at: https://sqlbolt.com/lesson/creating_tables 
[Accessed 4 Jan. 2025].

Sybase Inc. (2009). Chapter 4: SQL Functions DOW function [Date and time]. [online] 
Sybase.com. 
Available at: https://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc38151.1510/html/iqrefbb/Dow.htm 
[Accessed 5 Jan. 2025].

TutorialsPoint (2025a). SQL - DROP or DELETE Table - Tutorialspoint. [online] www.tutorialspoint.com. 
Available at: https://www.tutorialspoint.com/sql/sql-drop-table.htm 
[Accessed 4 Jan. 2025].

TutorialsPoint (2025b). SQL - Primary Key - Tutorialspoint. [online] 
Tutorialspoint.com. 
Available at: https://www.tutorialspoint.com/sql/sql-primary-key.htm [Accessed 4 Jan. 2025].
*/




