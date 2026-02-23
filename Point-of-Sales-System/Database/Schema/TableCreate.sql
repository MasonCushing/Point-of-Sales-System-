CREATE TABLE PAYROLLS (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Job VARCHAR(50) NOT NULL,
    Salary decimal(10, 2) CHECK (Salary >= 0 )
);

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
	FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNum VARCHAR(15)
	
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    State VARCHAR(50) NOT NULL DEFAULT 'Pending',
    TotalCost  DECIMAL(10,2) NOT NULL,
    CONSTRAINT FKcustomer FOREIGN KEY  (CustomerID) REFERENCES Customers(CustomerID)
    
);

CREATE TABLE MenuItems(
ItemID INT AUTO_INCREMENT PRIMARY KEY,
ItemName VARCHAR(50) NOT NULL,
ItemPrice DECIMAL(8,2) NOT NULL,
Catergory VARCHAR(50) NOT NULL
);

CREATE TABLE OrderItems(
OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
OrderID INT NOT NULL,
ItemID INT NOT NULL,
Quantity INT NOT NULL DEFAULT 1,
PriceEach DECIMAL(8,2) NOT NULL,
CONSTRAINT FKorder FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
CONSTRAINT FKmenuitem FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

CREATE TABLE Reservations(
ReservationID INT PRIMARY KEY AUTO_INCREMENT,
CustomerName VARCHAR(100) NOT NULL,
CustomerPhone VARCHAR(15),
ReservationTime DATETIME NOT NULL,
TableNumber INT,
Status VARCHAR(20) DEFAULT 'Booked'
);

INSERT INTO PAYROLLS (FirstName, LastName, Email, Job, Salary) VALUES
('John', 'Smith', 'john.smith@email.com', 'Manager', 55000.00),
('Emily', 'Davis', 'emily.davis@email.com', 'Cashier', 32000.00),
('Carlos', 'Martinez', 'carlos.m@email.com', 'Cook', 40000.00),
('Sarah', 'Brown', 'sarah.b@email.com', 'Server', 30000.00);

INSERT INTO Customers (FirstName, LastName, PhoneNum) VALUES
('Michael', 'Johnson', '8645551234'),
('Ashley', 'Williams', '8645555678'),
('David', 'Lee', '8645559012');

INSERT INTO MenuItems (ItemName, ItemPrice, Catergory) VALUES
('Cheeseburger', 8.99, 'Main'),
('Fries', 3.49, 'Side'),
('Coke', 1.99, 'Drink'),
('Chicken Alfredo', 12.99, 'Main'),
('Chocolate Cake', 4.99, 'Dessert');

INSERT INTO Orders (CustomerID, State, TotalCost) VALUES
(1, 'Completed', 14.47),
(2, 'Pending', 17.98),
(3, 'Completed', 6.98);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, PriceEach) VALUES
(1, 1, 1, 8.99),
(1, 2, 1, 3.49),
(1, 3, 1, 1.99),
(2, 4, 1, 12.99),
(2, 3, 2, 1.99),
(3, 5, 1, 4.99),
(3, 3, 1, 1.99);

INSERT INTO Reservations (CustomerName, CustomerPhone, ReservationTime, TableNumber, Status) VALUES
('Michael Johnson', '8645551234', '2026-02-25 18:00:00', 5, 'Booked'),
('Ashley Williams', '8645555678', '2026-02-25 19:30:00', 3, 'Seated'),
('David Lee', '8645559012', '2026-02-26 17:45:00', 2, 'Cancelled');

USE POS_database;
