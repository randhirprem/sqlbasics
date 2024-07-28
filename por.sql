CREATE DATABASE porousway_final;
USE porousway_final;

-- Customer table customer information table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    PhoneNumber BIGINT NOT NULL,
    EmailAddress VARCHAR(255),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CustomerType ENUM('business', 'personal') NOT NULL
);

-- Address Table
CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Staff table
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    StaffName VARCHAR(255) NOT NULL,
    DateJoin DATE NOT NULL,
    TypeOfStaff ENUM('office', 'site') NOT NULL,
    LoginID VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- customer issues table
CREATE TABLE CustomerIssue (
  issue_id INT PRIMARY KEY AUTO_INCREMENT,
  CustomerId INT,
  issue ENUM('payment', 'behaviour', 'mismatch_expectation', 'dishonest', 'illegal', 'upkeep', 'environmental_factor', 'unreasonable'),
  StaffId INT,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  remarks VARCHAR(255), -- Adjust length as needed
  FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
  FOREIGN KEY (StaffId) REFERENCES Staff(StaffId)
);

drop table Locations;

-- Location Table
-- Create the Locations table
CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    location_type VARCHAR(255)
);

-- Insert data into the Locations table
INSERT INTO Locations (location_name, location_type) VALUES 
('common toilet', 'HDB'), 
('masterbed room toilet', 'HDB'), 
('kitchen', 'HDB'), 
('balcony', 'HDB'), 
('common room', 'HDB'), 
('masterbed room', 'HDB'), 
('living room', 'HDB'), 
('dining room', 'HDB'), 
('common toilet', NULL), 
('masterbed room toilet', NULL), 
('kitchen', NULL), 
('balcony', NULL), 
('common room', NULL), 
('masterbed room', NULL), 
('living room', NULL), 
('dining room', NULL);

-- Create the Reason table
CREATE TABLE Reason (
    reason_id INT AUTO_INCREMENT PRIMARY KEY,
    reason_name VARCHAR(255) NOT NULL
);

-- Insert data into the Reason table
INSERT INTO Reason (reason_name) VALUES 
('floor only'), 
('wall only'), 
('floor and wall');

-- Create the ShowroomVisits table
CREATE TABLE ShowroomVisits (
    VisitID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    DateOfVisit DATETIME,
    LocationID INT,
    ReasonID INT,
    Remarks VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (LocationID) REFERENCES Locations(location_id),
    FOREIGN KEY (ReasonID) REFERENCES Reason(reason_id)
);

-- Create the CustomerLocations junction table
CREATE TABLE CustomerLocations (
    CustomerLocationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    LocationID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (LocationID) REFERENCES Locations(location_id)
);


-- Create the Material table
CREATE TABLE Material (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    material_name VARCHAR(255) NOT NULL,
    application VARCHAR(255) NOT NULL
);

-- Insert data into the Material table
INSERT INTO Material (material_name, application) VALUES 
('pebble', 'floor'), 
('lastic', 'floor'),
('pebble', 'wall'), 
('lastic', 'wall'),  
('ecoluxe', 'floor'), 
('nanocrete', 'floor'),
('flake', 'wall'),
('pebble', 'half wall'),
('flake', 'half wall'),
('lastic', 'half wall');

-- Create products table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    days FLOAT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- SET GLOBAL local_infile = 1;
select * from Product;
desc product;

-- import products csv
-- LOAD DATA LOCAL INFILE '/Users/randhirprem/Desktop/products.csv'
-- INTO TABLE Product
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (product_name, days, price);

-- import was done by python

-- Create the FloorColour table
CREATE TABLE FloorColour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    floor_colour VARCHAR(255) NOT NULL
);

-- Insert data into the FloorColour table
INSERT INTO FloorColour (floor_colour) VALUES ('None');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Creamy White AP');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Multicolour AK');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Bali Brown AQ');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Dark Grey (new)');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Spotty Black No.9');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Coral Brown 601');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Rusty Red 603');
INSERT INTO FloorColour (floor_colour) VALUES ('Pebble Floor Bali White 210/AP');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Charcoal');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Black Sesame');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Ash Grey');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Earl Grey');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Oyster');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Coconut');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Caramel');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Hazelnut');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Oat Milk');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Rose');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Strawberry');
INSERT INTO FloorColour (floor_colour) VALUES ('Lastic floor Peach');

select * from FloorColour;

CREATE TABLE WallColour (
    colour_id INT AUTO_INCREMENT PRIMARY KEY,
    wall_colour VARCHAR(255) NOT NULL
);

INSERT INTO WallColour (wall_colour) VALUES
('None'),
('Lastic wall Charcoal'),
('Lastic wall Black Sesame'),
('Lastic wall Ash Grey'),
('Lastic wall Earl Grey'),
('Lastic wall Oyster'),
('Lastic wall Coconut'),
('Lastic wall Caramel'),
('Lastic wall Hazelnut'),
('Lastic wall Oat Milk'),
('Lastic wall Rose'),
('Lastic wall Strawberry'),
('Lastic wall Peach'),
('Flake wall Admiral Blue'),
('Flake wall Charcoal Grey'),
('Flake wall Chocolate Brown'),
('Flake wall Coral White'),
('Flake wall Golden Brown'),
('Flake wall Misty Grey'),
('Flake wall Royal Blue'),
('Flake wall Sandy Brown'),
('Flake wall Turquoise'),
('Pebble wall Comfort Green'),
('Pebble wall Starry Black'),
('Pebble wall Rocky Beige'),
('Pebble wall Autumn Brown'),
('Pebble wall Silky Pink'),
('Pebble wall Midnight Gold'),
('Pebble wall Smoky Grey'),
('Pebble wall Twinkle White'),
('Pebble wall Crystal Yellow');


select * from WallColour;

drop table Accessories;
CREATE TABLE Accessories (
    accessory_id INT AUTO_INCREMENT PRIMARY KEY,
    accessory_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Inserting sample data including "None" option
INSERT INTO Accessories (accessory_name, price)
VALUES
    ('None', 0.00),
    ('Pebble infill floor trap (150mm x 150mm) + installation', 90.00),
    ('Pebble infill floor trap (100mm x 100mm) + installation', 80.00),
    ('Stainless steel floor trap (150mm x 150mm) + installation', 48.00),
    ('Stainless steel floor trap (100mm x 100mm) + installation', 38.00),
    ('Floor Trap Installation (no floor trap provided)', 35.00);

-- Create the AdhocJob table
CREATE TABLE AdhocJob (
    adhoc_job_id INT AUTO_INCREMENT PRIMARY KEY,
    adhoc_job_name VARCHAR(255) NOT NULL,
    days DECIMAL(5, 2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert data into the AdhocJob table
INSERT INTO AdhocJob (adhoc_job_name, days, price)
VALUES
    ('None', 0.0, 0.0),
    ('Debonded paint / flake removal', 0.5, 150.0);

-- Create the AdhocJob2 table
CREATE TABLE AdhocJob2 (
    adhoc_job_id INT AUTO_INCREMENT PRIMARY KEY,
    adhoc_job_name VARCHAR(255) NOT NULL,
    days DECIMAL(5, 2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert data into the AdhocJob2 table
INSERT INTO AdhocJob2 (adhoc_job_name, days, price)
VALUES
    ('None', 0.0, 0.0),
    ('Water proofing', 0.5, 350.0);
    
    
-- Create ProductOrdered table
-- Create ProductOrdered table
-- Create ProductOrdered table
CREATE TABLE ProductOrdered (
    product_ordered_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    location_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(CustomerID),
    FOREIGN KEY (address_id) REFERENCES Address(AddressID),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);



INSERT INTO Customers (CustomerName, PhoneNumber, EmailAddress, CustomerType)
VALUES ('John Doe', 1234567890, 'john.doe@example.com', 'personal');

-- Insert address for the customer with CustomerID 1
INSERT INTO Address (Address, PostalCode, CustomerID)
VALUES ('123 Main St, Springfield', '12345', 1);

-- Insert into ProductOrdered table
INSERT INTO ProductOrdered (customer_id, address_id, location_id, product_id, quantity)
VALUES (1, 1, 1, 1, 1);

INSERT INTO ProductOrdered (customer_id, address_id, location_id, product_id, quantity)
VALUES (@CustomerID, @AddressID, 1, 1, 1);
show tables;

SELECT 
    po.product_ordered_id,
    c.CustomerName AS customer_name,
    a.Address AS address,
    l.location_name,
    p.product_name,
    po.quantity,
    po.order_date,
    (po.quantity * p.price) AS total_price
FROM 
    ProductOrdered po
JOIN 
    Customers c ON po.customer_id = c.CustomerID
JOIN 
    Address a ON po.address_id = a.AddressID
JOIN 
    Locations l ON po.location_id = l.location_id
JOIN 
    Product p ON po.product_id = p.product_id;
