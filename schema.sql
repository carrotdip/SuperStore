-- Drop Table in case it exists
DROP TABLE SuperStore;

-- Create SuperStore Table
CREATE TABLE SuperStore 
(
	Row_ID INT NOT NULL,
	Order_ID VARCHAR NOT NULL,
	Order_Date DATE NOT NULL,
	Ship_Date DATE NOT NULL,
	Ship_Mode VARCHAR NOT NULL,
	Customer_ID VARCHAR NOT NULL,
	Customer_Name VARCHAR NOT NULL,
	Segment VARCHAR NOT NULL,
	Country VARCHAR NOT NULL,
	City VARCHAR NOT NULL,
	State VARCHAR NOT NULL,
	Postal_Code VARCHAR(5) NOT NULL,
	Region VARCHAR NOT NULL,
	Product_ID VARCHAR NOT NULL,
	Category VARCHAR NOT NULL,
	Sub_Category VARCHAR NOT NULL,
	Product_Name VARCHAR NOT NULL,
	Sales FLOAT NOT NULL,
	Quantity INT NOT NULL,
	Discount FLOAT NOT NULL,
	Profit FLOAT NOT NULL,
	PRIMARY KEY (Row_ID)	
);

-- View Table
SELECT * FROM SuperStore;