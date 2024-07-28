CREATE DATABASE porousway;
USE porousway;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    FullAddress VARCHAR(255) NOT NULL,
    PostalCode INT,
    PhoneNumber VARCHAR(20),
    EmailAddress VARCHAR(100),
    Ethnicity ENUM('Chinese', 'Malay', 'Indian', 'Others'),
    AgeGroup ENUM('25-35', '35-45', '45-55', '55-65', '65 and above'),
    Gender ENUM('Male', 'Female'),
    TypeOfHousing ENUM('HDB 2 room', 'HDB 3 room', 'HDB 4 room', 'HDB 5 room',
                      'Condo 2 room', 'Condo 3 room', 'Condo 4 room', 'Condo 5 room',
                      'Landed', 'Commercial'),
    FlaggedTroublesomeCustomer BOOLEAN DEFAULT FALSE,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- drop table customer;
SHOW TABLES;
desc customers;

CREATE TABLE HumanResources (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    StaffName VARCHAR(100) NOT NULL,
    DateJoin DATE NOT NULL,
    TypeOfStaff ENUM('Office', 'Site') NOT NULL
);

CREATE TABLE ShowroomVisits (
    VisitID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(100),
    DateOfVisit DATE,
    NumberOfTimes INT,
    ProductInterested VARCHAR(255),
    QuotationProvided ENUM('yes', 'no'),
    TypeOfCustomer ENUM('consumer', 'business'),
    SourceOfLead ENUM('Carousell', 'Facebook', 'Google', 'Website', 'Referral', 'Instagram', 'Xiao Hong Shu', 'Youtube', 'Unknown'),
    ReasonForOverlay ENUM('Aesthetics - Refresh old looks', 'Aesthetics - Fit a theme', 'Safety', 'Waterleaking', 'Waterponding', 'Others'),
    Gender ENUM('Male', 'Female'),
    Ethnicity ENUM('Chinese', 'Malay', 'Indian', 'Others'),
    AgeGroup ENUM('25-35', '35-45', '45-55', '55-65', '65 and above'),
    TypeOfHousing ENUM('HDB 2 room', 'HDB 3 room', 'HDB 4 room', 'HDB 5 room',
                       'Condo 2 room', 'Condo 3 room', 'Condo 4 room', 'Condo 5 room',
                       'Landed', 'Commercial'),
    Remarks VARCHAR(255),
    FlaggedTroublesomeCustomer BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_floor ENUM('pebble floor', 'lastic floor', 'ecoluxe floor', 'nanocrete floor', 'none') NOT NULL,
    category_wall ENUM('pebble wall', 'lastic wall', 'flake wall', 'none') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    duration DECIMAL(4, 1) NOT NULL,
    c48_floor BOOLEAN NOT NULL,
    c49_wall BOOLEAN NOT NULL,
    c50_floor_wall BOOLEAN NOT NULL,
    c51_pebble_floor BOOLEAN NOT NULL,
    c52_pebble_wall BOOLEAN NOT NULL,
    c53_flake_wall BOOLEAN NOT NULL,
    c54_lastic_floor BOOLEAN NOT NULL,
    c55_lastic_wall BOOLEAN NOT NULL,
    info TEXT
);

desc Products;

Select * from Products;

-- Inserting sample data into the Products table
INSERT INTO Products (product_name, duration, price, category_floor, category_wall, c48_floor, c49_wall, c50_floor_wall, c51_pebble_floor, c52_pebble_wall, c53_flake_wall, c54_lastic_floor, c55_lastic_wall)
VALUES 
('Clear Coating (Shower Area)', 0.5, 480, 'none', 'none', 1, 0, 0, 0, 0, 0, 0, 0),
('Clear Coating (Whole Toilet)', 0.5, 550, 'none', 'none', 1, 0, 0, 0, 0, 0, 0, 0),
('Flake Wall (Bath & Shower Separate – Full)', 1, 2000, 'none', 'flake wall', 0, 1, 0, 0, 0, 1, 0, 0),
('Flake Wall (Full)', 1, 1300, 'none', 'flake wall', 0, 1, 0, 0, 0, 1, 0, 0),
('Flake Wall (Half)', 0.5, 800, 'none', 'flake wall', 0, 1, 0, 0, 0, 1, 0, 0),
('Lastic Floor & Flake Wall (Full)', 2, 2200, 'lastic floor', 'flake wall', 0, 0, 1, 0, 0, 1, 1, 0),
('Lastic Floor & Flake Wall (Half)', 1.5, 1750, 'lastic floor', 'flake wall', 0, 0, 1, 0, 0, 1, 1, 0),
('Lastic Floor & Lastic Wall (Full)', 3, 3400, 'lastic floor', 'lastic wall', 0, 0, 1, 0, 0, 0, 1, 1),
('Lastic Floor & Lastic Wall (Half)', 2, 2450, 'lastic floor', 'lastic wall', 0, 0, 1, 0, 0, 0, 1, 1),
('Lastic Floor & Pebble Wall (Bath & Shower Separate – Full)', 3, 5200, 'lastic floor', 'pebble wall', 0, 0, 1, 0, 1, 0, 1, 0),
('Lastic Floor & Pebble Wall (Full)', 3, 3400, 'lastic floor', 'pebble wall', 0, 0, 1, 0, 1, 0, 1, 0),
('Lastic Floor & Pebble Wall (Half)', 2, 2450, 'lastic floor', 'pebble wall', 0, 0, 1, 0, 1, 0, 1, 0),
('Lastic Floor (Bath & Shower Separate – Full)', 1, 1400, 'lastic floor', 'none', 1, 0, 0, 0, 0, 0, 1, 0),
('Lastic Floor (Shower Area)', 0.5, 650, 'lastic floor', 'none', 1, 0, 0, 0, 0, 0, 1, 0),
('Lastic Floor (Whole Toilet)', 1, 950, 'lastic floor', 'none', 1, 0, 0, 0, 0, 0, 1, 0),
('Lastic Wall (Bath & Shower Separate – Full)', 2, 3800, 'none', 'lastic wall', 0, 1, 0, 0, 0, 0, 0, 1),
('Lastic Wall (Full)', 2, 2500, 'none', 'lastic wall', 0, 1, 0, 0, 0, 0, 0, 1),
('Lastic Wall (Half)', 1, 1500, 'none', 'lastic wall', 0, 1, 0, 0, 0, 0, 0, 1),
('Pebble Floor & Flake Wall (Full)', 1.5, 1950, 'pebble floor', 'flake wall', 0, 0, 1, 1, 0, 1, 0, 0),
('Pebble Floor & Flake Wall (Half)', 1, 1500, 'pebble floor', 'flake wall', 0, 0, 1, 1, 0, 1, 0, 0),
('Pebble Floor & Lastic Wall (Full)', 2.5, 3150, 'pebble floor', 'lastic wall', 0, 0, 1, 1, 0, 0, 0, 1),
('Pebble Floor & Lastic Wall (Half)', 1.5, 2300, 'pebble floor', 'lastic wall', 0, 0, 1, 1, 0, 0, 0, 1),
('Pebble Floor & Pebble Wall (Full)', 2.5, 3150, 'pebble floor', 'pebble wall', 0, 0, 1, 1, 1, 0, 0, 0),
('Pebble Floor & Pebble Wall (Half)', 1.5, 2200, 'pebble floor', 'pebble wall', 0, 0, 1, 1, 1, 0, 0, 0),
('Pebble Floor (Bath & Shower Separate)', 0.5, 1200, 'pebble floor', 'none', 1, 0, 0, 1, 0, 0, 0, 0),
('Pebble Floor (Shower Area)', 0.5, 550, 'pebble floor', 'none', 1, 0, 0, 1, 0, 0, 0, 0),
('Pebble Floor (Whole Toilet)', 0.5, 750, 'pebble floor', 'none', 1, 0, 0, 1, 0, 0, 0, 0),
('Pebble Wall (Bath & Shower Separate – Full)', 2, 3800, 'none', 'pebble wall', 0, 1, 0, 0, 1, 0, 0, 0),
('Pebble Wall (Full)', 2, 2500, 'none', 'pebble wall', 0, 1, 0, 0, 1, 0, 0, 0),
('Pebble Wall (Half)', 1, 1500, 'none', 'pebble wall', 0, 1, 0, 0, 1, 0, 0, 0);


drop table Products;
DROP TABLE Colours;
Drop table Orders;
-- Create the Colours table
CREATE TABLE Colours (
    ColourID INT AUTO_INCREMENT PRIMARY KEY,
    ColourName VARCHAR(50) NOT NULL,
    ProductType ENUM('Pebble', 'Lastic', 'Flake') NOT NULL
);

-- Insert Pebble colors
INSERT INTO Colours (ColourName, ProductType)
VALUES 
    ('Creamy White', 'Pebble'),
    ('Multicolour', 'Pebble'),
    ('Bali Brown', 'Pebble'),
    ('Coral Brown', 'Pebble'),
    ('Grass Green', 'Pebble'),
    ('Rusty Red', 'Pebble');

-- Insert Lastic colors
INSERT INTO Colours (ColourName, ProductType)
VALUES 
    ('Oat', 'Lastic'),
    ('Shadow', 'Lastic'),
    ('Graphite', 'Lastic'),
    ('Charcoal', 'Lastic'),
    ('Dusty Rose', 'Lastic'),
    ('Ash', 'Lastic'),
    ('Toffee', 'Lastic'),
    ('Emerald', 'Lastic');

-- Insert Flake colors
INSERT INTO Colours (ColourName, ProductType)
VALUES 
    ('Misty Grey', 'Flake'),
    ('Sandy Brown', 'Flake'),
    ('Admiral Blue', 'Flake'),
    ('Charcoal Grey', 'Flake'),
    ('Chocolate Brown', 'Flake'),
    ('Coral White', 'Flake'),
    ('Golden Brown', 'Flake'),
    ('Royal Blue', 'Flake'),
    ('Turquoise', 'Flake');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(255),
    Address VARCHAR(255),
    PostalCode INT,
    PhoneNumber INT,
    DateOfOrder DATE,
    DateOfInstallation DATE,
    ProductID INT,
    ColourID INT,
    Price DECIMAL(10, 2),
    DurationDays DECIMAL(3, 1),
    ExpectedEndDate DATE GENERATED ALWAYS AS (DateOfInstallation + INTERVAL DurationDays DAY),
    StaffName VARCHAR(255),
    StaffID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ColourID) REFERENCES Colours(ColourID),
    FOREIGN KEY (StaffID) REFERENCES HumanResources(StaffID)
);


SHOW TABLES;
desc orders;

select * from Colours;
