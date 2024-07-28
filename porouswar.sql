-- CREATE DATABASE porousway2;
USE porousway2;
-- drop table Customers;
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    PhoneNumber BIGINT NOT NULL,
    EmailAddress VARCHAR(255),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CustomerType ENUM('business', 'personal') NOT NULL
);
desc Customers;

CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

desc Address;

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    StaffName VARCHAR(255) NOT NULL,
    DateJoin DATE NOT NULL,
    TypeOfStaff ENUM('office', 'site') NOT NULL,
    LoginID VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

desc Staff;

CREATE TABLE CustomerIssue (
    IssueID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(255),
    PhoneNumber BIGINT,
    IssueType ENUM('payment', 'behaviour', 'mismatch_expectation', 'dishonest', 'illegal', 'upkeep', 'environmental_factor', 'unreasonable') NOT NULL,
    Remarks VARCHAR(500),
    StaffID INT,
    StaffName VARCHAR(255),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

desc CustomerIssue;

CREATE TABLE CustomerFollowUp (
    FollowUpID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(255),
    PhoneNumber BIGINT,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DateToFollowUp DATE,
    Item VARCHAR(100),
    StaffID INT,
    StaffName VARCHAR(255),
    Status ENUM('inprogress', 'completed') DEFAULT 'inprogress',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

ALTER TABLE CustomerFollowUp
ADD COLUMN Remarks TEXT;


desc CustomerFollowUp;

CREATE TABLE CustomerBI (
    CustomerID INT,
    CustomerName VARCHAR(255),
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
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

desc CustomerBI;
-- drop table CustomerBi;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Category ENUM('Pebble Floor', 'Pebble Wall', 'Flake Wall', 'Lastic Floor', 'Lastic Wall') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    DurationDays DECIMAL(3, 1) NOT NULL,
    AdditionalInfo VARCHAR(255) DEFAULT 'excl. add-ons'
);

-- Inserting sample data into the Products table
INSERT INTO Products (ProductName, Category, Price, DurationDays, AdditionalInfo)
VALUES 
    ('Pebble Floor (Whole Toilet)', 'Pebble Floor', 600.00, 0.5, 'excl. add-ons'),
    ('Lastic Floor (Whole Toilet)', 'Lastic Floor', 950.00, 1.0, 'excl. add-ons'),
    ('Pebble Floor & Flake Wall (Full)', 'Pebble Floor', 1950.00, 1.5, 'excl. add-ons'),
    ('Pebble Floor & Flake Wall (Full)', 'Pebble Floor', 2000.00, 1.5, 'excl. add-ons'),
    ('Lastic Floor & Lastic Wall (Full)', 'Lastic Floor', 3400.00, 3.0, 'excl. add-ons'),
    ('Lastic Floor & Lastic Wall (Full)', 'Lastic Floor', 3450.00, 3.0, 'excl. add-ons'),
    ('Pebble Floor & Pebble Wall (Full)', 'Pebble Floor', 3150.00, 2.5, 'excl. add-ons'),
    ('Pebble Floor & Pebble Wall (Full)', 'Pebble Floor', 3200.00, 2.5, 'excl. add-ons'),
    ('Clear Coating (Shower Area)', 'Lastic Wall', 480.00, 0.5, 'excl. add-ons'),
    ('Clear Coating (Whole Toilet)', 'Lastic Wall', 550.00, 0.5, 'excl. add-ons'),
    ('Lastic Floor (Bath & Shower Separate – Full)', 'Lastic Floor', 1400.00, 1.0, 'excl. add-ons'),
    ('Lastic Floor (Shower Area)', 'Lastic Floor', 650.00, 0.5, 'excl. add-ons'),
    ('Pebble Floor (Bath & Shower Separate)', 'Pebble Floor', 1200.00, 0.5, 'excl. add-ons'),
    ('Pebble Floor (Shower Area)', 'Pebble Floor', 550.00, 0.5, 'excl. add-ons'),
    ('Lastic Floor & Flake Wall (Full)', 'Lastic Floor', 2200.00, 2.0, 'excl. add-ons'),
    ('Lastic Floor & Flake Wall (Full)', 'Lastic Floor', 2250.00, 2.0, 'excl. add-ons'),
    ('Lastic Floor & Flake Wall (Half)', 'Lastic Floor', 1750.00, 1.5, 'excl. add-ons'),
    ('Lastic Floor & Lastic Wall (Half)', 'Lastic Floor', 2450.00, 2.0, 'excl. add-ons'),
    ('Lastic Floor & Pebble Wall (Bath & Shower Separate – Full)', 'Lastic Floor', 5200.00, 3.0, 'excl. add-ons'),
    ('Lastic Floor & Pebble Wall (Full)', 'Lastic Floor', 3400.00, 3.0, 'excl. add-ons'),
    ('Lastic Floor & Pebble Wall (Full)', 'Lastic Floor', 3450.00, 3.0, 'excl. add-ons'),
    ('Lastic Floor & Pebble Wall (Half)', 'Lastic Floor', 2450.00, 2.0, 'excl. add-ons'),
    ('Pebble Floor & Flake Wall (Half)', 'Pebble Floor', 1500.00, 1.0, 'excl. add-ons'),
    ('Pebble Floor & Lastic Wall (Full)', 'Pebble Floor', 3150.00, 3.0, 'excl. add-ons'),
    ('Pebble Floor & Lastic Wall (Full)', 'Pebble Floor', 3200.00, 3.0, 'excl. add-ons'),
    ('Pebble Floor & Lastic Wall (Half)', 'Pebble Floor', 2300.00, 1.5, 'excl. add-ons'),
    ('Pebble Floor & Pebble Wall (Half)', 'Pebble Floor', 2200.00, 1.5, 'excl. add-ons'),
    ('Flake Wall (Bath & Shower Separate – Full)', 'Flake Wall', 2000.00, 1.0, 'excl. add-ons'),
    ('Flake Wall (Full)', 'Flake Wall', 1300.00, 1.0, 'excl. add-ons'),
    ('Flake Wall (Half)', 'Flake Wall', 800.00, 0.5, 'excl. add-ons'),
    ('Lastic Wall (Bath & Shower Separate – Full)', 'Lastic Wall', 3800.00, 2.0, 'excl. add-ons'),
    ('Lastic Wall (Full)', 'Lastic Wall', 2500.00, 2.0, 'excl. add-ons'),
    ('Lastic Wall (Half)', 'Lastic Wall', 1500.00, 1.0, 'excl. add-ons'),
    ('Pebble Wall (Bath & Shower Separate – Full)', 'Pebble Wall', 3800.00, 2.0, 'excl. add-ons'),
    ('Pebble Wall (Full)', 'Pebble Wall', 2500.00, 2.0, 'excl. add-ons'),
    ('Pebble Wall (Half)', 'Pebble Wall', 1500.00, 1.0, 'excl. add-ons');


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


-- drop table Accessories;
-- Insert accessory data
-- Create Accessories table with corrected Size column
CREATE TABLE Accessories (
    AccessoryID INT AUTO_INCREMENT PRIMARY KEY,
    Item VARCHAR(100) NOT NULL,
    Size ENUM('Big', 'Small', 'Any') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Insert accessory data
INSERT INTO Accessories (Item, Size, Price)
VALUES 
    ('Pebble infill', 'Big', 90.00),
    ('Pebble infill', 'Small', 80.00),
    ('Stainless steel', 'Big', 48.00),
    ('Stainless steel', 'Small', 38.00),
    ('Just floor trap', 'Any', 35.00);

-- Update the Products table to include waterproofing service with 0.5 days duration
INSERT INTO Products (ProductName, Category, Price, DurationDays, AdditionalInfo)
VALUES 
    ('Waterproofing Service', 'Pebble Floor', 350.00, 0.5, 'excl. add-ons'),
    ('Waterproofing Service', 'Lastic Floor', 350.00, 0.5, 'excl. add-ons');
    
-- Create Orders table with foreign key constraints
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(255),
    Address VARCHAR(255),
    PostalCode VARCHAR(10),
    PhoneNumber BIGINT,
    ProductID INT,
    ColourID INT,
    DurationDays DECIMAL(3, 1),
    Price DECIMAL(10, 2),
    StaffID INT,
    StaffName VARCHAR(255),
    OrderDate DATE,
    InstallationDate DATE,
    Status ENUM('Completed', 'Incomplete'),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ColourID) REFERENCES Colours(ColourID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
SELECT CONCAT('hwmd', LPAD(OrderID, 5, '0')) AS OrderIDWithPrefix
FROM Orders;

-- Create ShowroomVisits table
CREATE TABLE ShowroomVisits (
    VisitID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(100),
    DateOfVisit DATE,
    PhoneNumber BIGINT,
    Address VARCHAR(255),
    Remarks VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
show tables;


