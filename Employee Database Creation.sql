
------------------------------------- CREATING TABLE -----------------------------------


CREATE TABLE BloodGroupMaster (
    BloodGroupID INT PRIMARY KEY,
    BloodGroupName NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE RelegionMaster (
    RelegionID INT PRIMARY KEY,
    Relegion NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE CasteMaster (
    CasteID INT PRIMARY KEY,
    RelegionID INT REFERENCES RelegionMaster(RelegionID),
    Caste NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE SubCasteMaster (
    SubCasteID INT PRIMARY KEY,
    CasteID INT REFERENCES CasteMaster(CasteID),
    SubCasteName NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE CountryMaster (
    CountryID INT PRIMARY KEY,
    CountryName NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE StateMaster (
    StateID INT PRIMARY KEY,
    CountryID INT REFERENCES CountryMaster(CountryID),
    StateName NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE CityMaster (
    CityID INT PRIMARY KEY,
    StateID INT REFERENCES StateMaster(StateID),
    CityName NVARCHAR(150),
    IsActive BIT
);

CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(150),
    LastName NVARCHAR(150),
    DateOfBirth DATE,
    Age INT,
    FatherOrHusbandName NVARCHAR(150),
    Gender NVARCHAR(10),
    MaritalStatus NVARCHAR(20),
    Citizenship NVARCHAR(150),
    Height INT,
    Weight INT,
    BloodGroupID INT REFERENCES BloodGroupMaster(BloodGroupID),
    CasteID INT REFERENCES CasteMaster(CasteID),
    SubCasteID INT REFERENCES SubCasteMaster(SubCasteID),
    RelegionID INT REFERENCES RelegionMaster(RelegionID),
    CreateBy NVARCHAR(150),
    CreateOn DATETIME,
    UpdateBy NVARCHAR(150),
    UpdateOn DATETIME,
    IsActive BIT
);

CREATE TABLE ContactDetails (
    ContactID INT PRIMARY KEY,
    EmployeeID INT REFERENCES EmployeeDetails(EmployeeID),
    HomeAddress NVARCHAR(150),
    MobileNo NVARCHAR(150),
    LandlineNo NVARCHAR(20),
    Email NVARCHAR(150),
    SkypeID NVARCHAR(150),
    SlackID NVARCHAR(150),
    LinkedinID NVARCHAR(150),
    OfficeAddress NVARCHAR(150),
    OfficeNo NVARCHAR(20),
    CountryID INT REFERENCES CountryMaster(CountryID),
    StateID INT REFERENCES StateMaster(StateID),
    CityID INT REFERENCES CityMaster(CityID)
);


CREATE TABLE EducationDetails (
    EducationID INT PRIMARY KEY,
    EmployeeID INT REFERENCES EmployeeDetails(EmployeeID),
    Qualification NVARCHAR(150),
    School NVARCHAR(150),
    CollegeOrUniversity NVARCHAR(150),
    PassOutYear INT,
    SubjectOrField NVARCHAR(150),
    PercentageOrGrade FLOAT
);

CREATE TABLE BankDetails (
    BankID INT PRIMARY KEY,
    EmployeeID INT REFERENCES EmployeeDetails(EmployeeID),
    BankAccNo NVARCHAR(50),
    EmployeeName NVARCHAR(150),
    BankName NVARCHAR(150),
    Branch NVARCHAR(150),
    AccountType NVARCHAR(50),
    IFSCCode NVARCHAR(50),
    MICRNo NVARCHAR(50)
);

CREATE TABLE ExperienceDetails (
    ExpID INT PRIMARY KEY,
    EmployeeID INT REFERENCES EmployeeDetails(EmployeeID),
    Occupation NVARCHAR(150),
    DateOfJoining nvarchar(25),
    Experience INT,
    Designation NVARCHAR(150),
    CurrentCompany NVARCHAR(150),
    Sector NVARCHAR(150),
    PreviousCompany NVARCHAR (150)
	);



------------------------------------- INSERT BLOOD GROUP MASTER -----------------------------------


	INSERT INTO BloodGroupMaster (BloodGroupID, BloodGroupName, IsActive)
VALUES
(1, 'A+', 1),
(2, 'A-', 1),
(3, 'B+', 1),
(4, 'B-', 1),
(5, 'AB+', 1),
(6, 'AB-', 1),
(7, 'O+', 1),
(8, 'O-', 1);


------------------------------------- INSERT RELEGION MASTER -----------------------------------



INSERT INTO RelegionMaster (RelegionID, Relegion, IsActive)
VALUES
(1, 'Hinduism', 1),
(2, 'Islam', 1),
(3, 'Christianity', 1),
(4, 'Sikhism', 1),
(5, 'Buddhism', 1),
(6, 'Jainism', 1),
(7, 'Zoroastrianism', 1),
(8, 'Judaism', 1),
(9, 'Baháʼí Faith', 1),
(10, 'Taoism', 1),
(11, 'Confucianism', 1);


------------------------------------- INSERT CASTE MASTER -----------------------------------



INSERT INTO CasteMaster (CasteID, RelegionID, Caste, IsActive)
VALUES
(1, 1, 'Brahmin', 1),
(2, 1, 'Kshatriya', 1),
(3, 1, 'Vaishya', 1),
(4, 1, 'Shudra', 1),
(5, 2, 'Sunni', 1),
(6, 2, 'Shia', 1),
(7, 3, 'Catholic', 1),
(8, 3, 'Protestant', 1),
(9, 4, 'Jat', 1),
(10, 4, 'Khatri', 1),
(11, 5, 'Buddhist', 1),
(12, 6, 'Digambar', 1),
(13, 6, 'Shwetambar', 1),
(14, 7, 'Parsi', 1),
(15, 8, 'Jew', 1),
(16, 9, 'Baháʼí', 1),
(17, 10, 'Taoist', 1),
(18, 11, 'Confucian', 1);


------------------------------------- INSERT SUB CASTE MASTER -----------------------------------



INSERT INTO SubCasteMaster (SubCasteID, CasteID, SubCasteName, IsActive)
VALUES
(1, 1, 'Sharma', 1),
(2, 1, 'Mishra', 1),
(3, 1, 'Tiwar', 1),
(4, 2, 'Rajput', 1),
(5, 2, 'Thakur', 1),
(6, 2, 'Chauhan', 1),
(7, 3, 'Gupta', 1),
(8, 3, 'Agrawal', 1),
(9, 3, 'Jaiswal', 1),
(10, 4, 'Yadav', 1),
(11, 4, 'Jatav', 1),
(12, 4, 'Kori', 1),
(13, 5, 'Dalit', 1),
(14, 5, 'Mahar', 1),
(15, 6, 'Jain', 1),
(16, 7, 'Parsi', 1),
(17, 8, 'Levi', 1),
(18, 8, 'Cohen', 1);


------------------------------------- INSERT COUNTRY MASTER -----------------------------------



INSERT INTO CountryMaster (CountryID, CountryName, IsActive)
VALUES
(1, 'India', 1),
(2, 'United States', 1),
(3, 'United Kingdom', 1),
(4, 'Canada', 1),
(5, 'Australia', 1),
(6, 'Japan', 1),
(7, 'China', 1),
(8, 'France', 1),
(9, 'Germany', 1),
(10, 'Italy', 1);


------------------------------------- INSERT STATE MASTER -----------------------------------



INSERT INTO StateMaster (StateID, CountryID, StateName, IsActive)
VALUES
(1, 1, 'Uttar Pradesh', 1),
(2, 1, 'Maharashtra', 1),
(3, 1, 'Bihar', 1),
(4, 1, 'West Bengal', 1),
(5, 1, 'Madhya Pradesh', 1),
(6, 1, 'Tamil Nadu', 1),
(7, 1, 'Rajasthan', 1),
(8, 1, 'Karnataka', 1),
(9, 1, 'Gujarat', 1),
(10, 1, 'Andhra Pradesh', 1);

INSERT INTO StateMaster (StateID, CountryID, StateName, IsActive)
VALUES
(11, 1, 'Kerala', 1),
(12, 1, 'Punjab', 1),
(13, 1, 'Haryana', 1),
(14, 1, 'Jharkhand', 1),
(15, 1, 'Assam', 1),
(16, 1, 'Odisha', 1),
(17, 1, 'Telangana', 1),
(18, 1, 'Uttarakhand', 1),
(19, 1, 'Himachal Pradesh', 1),
(20, 1, 'Chhattisgarh', 1);



------------------------------------- INSERT CITY MASTER -----------------------------------


INSERT INTO CityMaster (CityID, StateID, CityName, IsActive)
VALUES
(1, 1, 'Lucknow', 1),
(2, 1, 'Kanpur', 1),
(3, 2, 'Mumbai', 1),
(4, 2, 'Pune', 1),
(5, 3, 'Patna', 1),
(6, 3, 'Gaya', 1),
(7, 4, 'Kolkata', 1),
(8, 4, 'Howrah', 1),
(9, 5, 'Indore', 1),
(10, 5, 'Bhopal', 1);

INSERT INTO CityMaster (CityID, StateID, CityName, IsActive)
VALUES
(11, 6, 'Chennai', 1),
(12, 6, 'Coimbatore', 1),
(13, 7, 'Jaipur', 1),
(14, 7, 'Ajmer', 1),
(15, 8, 'Banglore', 1),
(16, 8, 'Manglore', 1),
(17, 9, 'Ahmedabad', 1),
(18, 9, 'Surat', 1),
(19, 10, 'Visakhapatnam', 1),
(20, 10, 'Vijaywada', 1),
(21, 11, 'Kochi', 1),
(22, 11, 'Thiruvananthapuram', 1),
(23, 12, 'Ludhiana', 1),
(24, 12, 'Amritsar', 1),
(25, 13, 'Gurugram', 1),
(26, 13, 'Rohtak', 1),
(27, 14, 'Ranchi', 1),
(28, 14, 'Jamshedpur', 1),
(29, 15, 'Guwahati', 1),
(30, 15, 'Jorhat', 1),
(31, 16, 'JorhatBhubneswar', 1),
(32, 16, 'Puri', 1),
(33, 17, 'Hyderabad', 1),
(34, 17, 'Warangal', 1),
(35, 18, 'Dehradun', 1),
(36, 18, 'Nainital', 1),
(37, 19, 'Shimla', 1),
(38, 19, 'Manali', 1),
(39, 20, 'Raipur', 1),
(40, 20, 'Bilaspur', 1);



----------------------------------------------------- INSERT EMPLOYEE DETAILS ------------------------------------------------------


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES (1, 'Amit', 'Sharma', '1990-01-01', 32, 'Rakesh Sharma', 'Male', 'Married', 'Indian', 170, 70, 1, 1, 1, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (2, 'Priya', 'Singh', '1995-05-12', 27, 'Rajesh Singh', 'Female', 'Married', 'Indian', 160, 55, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (3, 'Suresh', 'Kumar', '1988-11-25', 33, 'Raman Kumar', 'Male', 'Unmarried', 'Indian', 175, 80, 2, 4, 7, 3, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (4, 'Rajesh', 'Gupta', '1985-04-10', 37, 'Anil Gupta', 'Male', 'Married', 'Indian', 175, 75, 4, 6, 10, 4, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (5, 'Anjali', 'Verma', '1992-07-03', 29, 'Rajiv Verma', 'Female', 'Unmarried', 'Indian', 165, 60, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1);


	   INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES (6, 'Suman', 'Chakraborty', '1994-08-12', 28, 'Sudip Chakraborty', 'Female', 'Married', 'Indian', 162, 52, 1, 1, 1, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (7, 'Rajat', 'Mishra', '1991-03-05', 32, 'Sunil Mishra', 'Male', 'Married', 'Indian', 178, 75, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (8, 'Riya', 'Patel', '1996-09-15', 26, 'Suresh Patel', 'Female', 'Unmarried', 'Indian', 165, 55, 4, 6, 10, 4, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (9, 'Alok', 'Singh', '1993-11-30', 28, 'Rajendra Singh', 'Male', 'Married', 'Indian', 172, 80, 2, 4, 7, 3, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (10, 'Sarika', 'Chauhan', '1988-05-21', 34, 'Sudhir Chauhan', 'Female', 'Married', 'Indian', 158, 50, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1);

INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES (11, 'Aditi', 'Sharma', '1997-06-25', 25, 'Ankit Sharma', 'Female', 'Unmarried', 'Indian', 167, 56, 2, 3, 6, 4, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (12, 'Amit', 'Verma', '1985-11-19', 37, 'Rajesh Verma', 'Male', 'Married', 'Indian', 174, 78, 4, 6, 11, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (13, 'Kavita', 'Pandey', '1990-03-10', 32, 'Vikas Pandey', 'Female', 'Married', 'Indian', 159, 49, 1, 1, 1, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (14, 'Rohit', 'Joshi', '1989-07-02', 33, 'Sanjay Joshi', 'Male', 'Married', 'Indian', 180, 82, 2, 3, 7, 4, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
       (15, 'Deepa', 'Nair', '1995-04-17', 27, 'Ajith Nair', 'Female', 'Unmarried', 'Indian', 163, 55, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1);


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES 
(16, 'Alok', 'Mishra', '1993-09-14', 29, 'Rajeev Mishra', 'Male', 'Unmarried', 'Indian', 172, 70, 4, 6, 11, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(17, 'Nisha', 'Kumar', '1998-05-30', 24, 'Vikas Kumar', 'Female', 'Unmarried', 'Indian', 160, 50, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(18, 'Rahul', 'Mehta', '1991-01-05', 32, 'Sanjay Mehta', 'Male', 'Married', 'Indian', 175, 75, 2, 3, 7, 4, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(19, 'Sneha', 'Shah', '1995-12-21', 27, 'Rajiv Shah', 'Female', 'Married', 'Indian', 163, 55, 1, 1, 1, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(20, 'Avinash', 'Singh', '1990-08-19', 32, 'Vikas Singh', 'Male', 'Married', 'Indian', 170, 72, 2, 3, 7, 4, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(21, 'Smita', 'Sharma', '1997-11-05', 25, 'Rakesh Sharma', 'Female', 'Unmarried', 'Indian', 165, 55, 4, 6, 11, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(22, 'Rakesh', 'Soni', '1988-03-18', 34, 'Sanjay Soni', 'Male', 'Married', 'Indian', 173, 78, 3, 2, 5, 2, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1),
(23, 'Nidhi', 'Pandey', '1993-12-25', 29, 'Vikas Pandey', 'Female', 'Unmarried', 'Indian', 157, 48, 1, 1, 1, 1, 'Admin', '2023-02-23', 'Admin', '2023-02-23', 1)


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES 
(24, 'Raj', 'Kumar', '1990-05-20', 31, 'Ram Kumar', 'Male', 'Married', 'Indian', 175, 70, 1, 1, 1, 1, 'Admin', GETDATE(), NULL, NULL, 1),
(25, 'Priya', 'Singh', '1995-11-12', 26, 'Alok Singh', 'Female', 'Unmarried', 'Indian', 160, 50, 2, 2, 2, 2, 'Admin', GETDATE(), NULL, NULL, 1),
(26, 'Sandeep', 'Kumar', '1988-07-18', 33, 'Bhola Ram', 'Male', 'Married', 'Indian', 180, 75, 3, 3, 3, 1, 'Admin', GETDATE(), NULL, NULL, 1),
(27, 'Sunita', 'Yadav', '1998-03-08', 23, 'Vijay Yadav', 'Female', 'Unmarried', 'Indian', 155, 45, 4, 2, 4, 2, 'Admin', GETDATE(), NULL, NULL, 1),
(28, 'Rakesh', 'Sharma', '1985-12-27', 36, 'Sanjay Sharma', 'Male', 'Married', 'Indian', 170, 68, 1, 1, 1, 1, 'Admin', GETDATE(), NULL, NULL, 1),
(29, 'Swati', 'Gupta', '1992-09-04', 29, 'Anil Gupta', 'Female', 'Unmarried', 'Indian', 165, 55, 2, 2, 2, 2, 'Admin', GETDATE(), NULL, NULL, 1),
(30, 'Alok', 'Jain', '1994-06-22', 27, 'Vikas Jain', 'Male', 'Married', 'Indian', 175, 70, 3, 3, 3, 1, 'Admin', GETDATE(), NULL, NULL, 1),
(31, 'Neha', 'Verma', '1997-02-15', 24, 'Rakesh Verma', 'Female', 'Unmarried', 'Indian', 160, 50, 4, 2, 4, 2, 'Admin', GETDATE(), NULL, NULL, 1),
(32, 'Amit', 'Singh', '1991-08-29', 30, 'Rajeev Singh', 'Male', 'Married', 'Indian', 180, 75, 1, 1, 1, 1, 'Admin', GETDATE(), NULL, NULL, 1),
(33, 'Deepa', 'Srivastava', '1999-05-10', 22, 'Vikram Srivastava', 'Female', 'Unmarried', 'Indian', 155, 45, 2, 2, 2, 2, 'Admin', GETDATE(), NULL, NULL, 1);


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES 
(34, 'Anjali', 'Sharma', '1990-05-23', 32, 'Rajendra Sharma', 'Female', 'Married', 'Indian', 5.5, 60, 3, 7, 6, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(35, 'Akash', 'Singh', '1995-09-18', 27, 'Raj Kumar Singh', 'Male', 'Single', 'Indian', 6, 70, 4, 8, 11, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(36, 'Kavita', 'Patil', '1992-02-12', 30, 'Ramesh Patil', 'Female', 'Married', 'Indian', 5.3, 55, 2, 5, 3, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(37, 'Manoj', 'Sharma', '1991-06-05', 31, 'Vijay Sharma', 'Male', 'Married', 'Indian', 5.8, 70, 1, 3, 7, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(38, 'Renuka', 'Gupta', '1994-12-02', 28, 'Ravi Gupta', 'Female', 'Single', 'Indian', 5.4, 58, 3, 7, 2, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1)


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES
(39, 'Riya', 'Verma', '1992-03-10', 31, 'Rajesh Verma', 'Female', 'Unmarried', 'Indian', 162, 55, 2, 5, 2, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(40, 'Deepak', 'Gupta', '1983-08-25', 38, 'Harish Gupta', 'Male', 'Married', 'Indian', 176, 70, 3, 6, 6, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(41, 'Smita', 'Joshi', '1987-11-30', 34, 'Rakesh Joshi', 'Female', 'Married', 'Indian', 163, 60, 4, 8, 3, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(42, 'Rakesh', 'Shah', '1980-06-15', 41, 'Prakash Shah', 'Male', 'Married', 'Indian', 180, 78, 1, 3, 1, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(43, 'Geeta', 'Desai', '1993-02-28', 28, 'Nitin Desai', 'Female', 'Unmarried', 'Indian', 160, 50, 3, 6, 4, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(44, 'Pradeep', 'Singh', '1990-10-15', 31, 'Alok Singh', 'Male', 'Unmarried', 'Indian', 172, 70, 2, 5, 2, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(45, 'Anita', 'Mishra', '1985-07-01', 36, 'Rajeev Mishra', 'Female', 'Married', 'Indian', 165, 62, 2, 5, 7, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1);


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES
(46, 'Shilpa', 'Gupta', '1985-05-17', 36, 'Rakesh Gupta', 'Female', 'Married', 'Indian', 160, 55, 1, 2, 3, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(47, 'Rahul', 'Sharma', '1990-02-03', 31, 'Sanjay Sharma', 'Male', 'Single', 'Indian', 175, 70, 2, 3, 4, 5, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(48, 'Meena', 'Patil', '1982-08-12', 39, 'Ramesh Patil', 'Female', 'Married', 'Indian', 155, 65, 3, 4, 5, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(49, 'Amit', 'Singh', '1995-11-23', 26, 'Rajesh Singh', 'Male', 'Single', 'Indian', 180, 75, 4, 5, 1, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(50, 'Priya', 'Das', '1988-04-05', 33, 'Sanjay Das', 'Female', 'Married', 'Indian', 162, 58, 5, 1, 2, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(51, 'Vikram', 'Rao', '1981-01-12', 40, 'Suresh Rao', 'Male', 'Married', 'Indian', 178, 80, 1, 2, 3, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(52, 'Anita', 'Verma', '1992-07-08', 29, 'Pradeep Verma', 'Female', 'Single', 'Indian', 155, 65, 2, 3, 4, 5, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(53, 'Ravi', 'Gandhi', '1989-06-19', 32, 'Alok Gandhi', 'Male', 'Married', 'Indian', 170, 75, 3, 4, 5, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(54, 'Smita', 'Nair', '1983-09-28', 38, 'Vijay Nair', 'Female', 'Married', 'Indian', 160, 60, 4, 5, 1, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1)


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES 
(55, 'Akash', 'Kumar', '1995-02-10', 28, 'Ramesh Kumar', 'M', 'Married', 'Indian', 5.8, 70, 1, 1, 1, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(56, 'Anjali', 'Singh', '1990-05-20', 32, 'Ram Singh', 'F', 'Single', 'Indian', 5.2, 55, 2, 2, 2, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(57, 'Karan', 'Sharma', '1988-12-15', 34, 'Amit Sharma', 'M', 'Married', 'Indian', 5.9, 75, 3, 3, 3, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(58, 'Neha', 'Gupta', '1992-06-02', 30, 'Alok Gupta', 'F', 'Single', 'Indian', 5.3, 50, 4, 4, 4, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(59, 'Prakash', 'Jha', '1987-04-01', 35, 'Rakesh Jha', 'M', 'Married', 'Indian', 5.7, 80, 5, 5, 5, 5, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(60, 'Ritu', 'Mishra', '1993-10-18', 28, 'Alok Mishra', 'F', 'Single', 'Indian', 5.4, 45, 6, 6, 6, 6, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(61, 'Vikas', 'Verma', '1990-08-08', 31, 'Rajeev Verma', 'M', 'Married', 'Indian', 6.0, 85, 7, 7, 7, 7, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(62, 'Sarita', 'Yadav', '1989-03-22', 32, 'Ram Yadav', 'F', 'Married', 'Indian', 5.1, 60, 8, 8, 8, 8, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(63, 'Nitin', 'Kumar', '1991-11-05', 30, 'Rajesh Kumar', 'M', 'Single', 'Indian', 5.6, 70, 6, 9, 9, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1) 


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES 
(64, 'Anita', 'Kumari', '1985-03-21', 36, 'Ramesh Prasad', 'Female', 'Married', 'Indian', 168, 65, 3, 4, 5, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(65, 'Suresh', 'Sharma', '1989-07-12', 32, 'Mahesh Sharma', 'Male', 'Married', 'Indian', 172, 75, 2, 1, 6, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(66, 'Rajesh', 'Singh', '1992-01-05', 29, 'Ram Singh', 'Male', 'Single', 'Indian', 165, 58, 1, 2, 3, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(67, 'Priya', 'Verma', '1990-04-18', 31, 'Rajesh Verma', 'Female', 'Married', 'Indian', 160, 50, 4, 1, 2, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(68, 'Sanjay', 'Jha', '1984-09-08', 37, 'Kamal Jha', 'Male', 'Married', 'Indian', 175, 80, 3, 3, 4, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(69, 'Manish', 'Gupta', '1987-12-23', 34, 'Alok Gupta', 'Male', 'Married', 'Indian', 170, 70, 2, 4, 5, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(70, 'Pooja', 'Mishra', '1993-05-11', 28, 'Rajendra Mishra', 'Female', 'Single', 'Indian', 162, 55, 1, 1, 6, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(71, 'Vikas', 'Choudhary', '1991-11-28', 30, 'Rajesh Choudhary', 'Male', 'Single', 'Indian', 175, 78, 4, 2, 3, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(72, 'Suman', 'Sinha', '1988-08-16', 33, 'Anand Sinha', 'Female', 'Married', 'Indian', 160, 48, 3, 3, 4, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1)

INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES 
(73, 'Alok', 'Gupta', '1987-03-16', 36, 'Suresh Gupta', 'Male', 'Married', 'Indian', 175, 78, 4, 3, 5, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(74, 'Rajni', 'Yadav', '1992-07-21', 29, 'Ram Yadav', 'Female', 'Single', 'Indian', 160, 54, 3, 2, 2, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(75, 'Akash', 'Sharma', '1995-09-23', 26, 'Sanjay Sharma', 'Male', 'Married', 'Indian', 172, 68, 2, 1, 1, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(76, 'Preeti', 'Singh', '1997-11-12', 24, 'Raj Singh', 'Female', 'Single', 'Indian', 167, 58, 1, 2, 2, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(77, 'Manish', 'Mishra', '1991-02-28', 30, 'Sudhir Mishra', 'Male', 'Married', 'Indian', 180, 85, 4, 4, 6, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(78, 'Divya', 'Joshi', '1993-04-09', 28, 'Rajendra Joshi', 'Female', 'Single', 'Indian', 165, 52, 3, 3, 3, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(79, 'Sanjay', 'Kumar', '1986-06-02', 35, 'Shyam Kumar', 'Male', 'Married', 'Indian', 178, 75, 2, 2, 2, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(80, 'Anjali', 'Verma', '1990-12-28', 31, 'Raj Verma', 'Female', 'Married', 'Indian', 162, 56, 1, 1, 1, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(81, 'Vikas', 'Shukla', '1988-01-14', 33, 'Prakash Shukla', 'Male', 'Married', 'Indian', 170, 72, 3, 3, 3, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1)


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive) 
VALUES
(82, 'Amit', 'Sharma', '1980-01-15', 43, 'Rajendra Sharma', 'Male', 'Married', 'Indian', 173, 80, 2, 1, 1, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(83, 'Rajesh', 'Kumar', '1990-05-25', 33, 'Hari Ram', 'Male', 'Single', 'Indian', 170, 70, 1, 3, 3, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(84, 'Priya', 'Singh', '1995-02-10', 28, 'Rakesh Singh', 'Female', 'Married', 'Indian', 160, 60, 4, 2, 2, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(85, 'Rahul', 'Gupta', '1998-11-07', 23, 'Vivek Gupta', 'Male', 'Single', 'Indian', 175, 72, 3, 2, 2, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(86, 'Smita', 'Patil', '1985-08-30', 36, 'Suresh Patil', 'Female', 'Married', 'Indian', 165, 68, 1, 4, 4, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(87, 'Kunal', 'Jain', '1992-03-17', 29, 'Anil Jain', 'Male', 'Single', 'Indian', 180, 75, 2, 1, 1, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(88, 'Divya', 'Verma', '1994-06-11', 27, 'Rakesh Verma', 'Female', 'Single', 'Indian', 158, 55, 4, 3, 3, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(89, 'Manish', 'Singh', '1988-12-23', 33, 'Rajeev Singh', 'Male', 'Married', 'Indian', 172, 78, 3, 2, 2, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(90, 'Riya', 'Goyal', '1993-09-05', 28, 'Vikram Goyal', 'Female', 'Single', 'Indian', 163, 62, 1, 4, 4, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1)


INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES
(91, 'Rajesh', 'Singh', '1985-03-12', 38, 'Harish Singh', 'Male', 'Married', 'Indian', 175, 72, 2, 4, 1, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(92, 'Sneha', 'Sharma', '1993-10-15', 28, 'Rakesh Sharma', 'Female', 'Married', 'Indian', 162, 60, 4, 6, 3, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(93, 'Alok', 'Verma', '1988-06-07', 33, 'Sunil Verma', 'Male', 'Married', 'Indian', 178, 75, 3, 7, 7, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(94, 'Neha', 'Gupta', '1992-09-23', 29, 'Ravi Gupta', 'Female', 'Married', 'Indian', 164, 58, 2, 5, 1, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(95, 'Amit', 'Patel', '1987-12-18', 36, 'Rajesh Patel', 'Male', 'Married', 'Indian', 176, 80, 1, 1, 1, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(96, 'Sarika', 'Singh', '1994-05-30', 27, 'Anil Singh', 'Female', 'Single', 'Indian', 160, 55, 3, 7, 4, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(97, 'Vikas', 'Sharma', '1990-08-25', 31, 'Mahesh Sharma', 'Male', 'Married', 'Indian', 170, 68, 2, 4, 8, 2, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(98, 'Pooja', 'Verma', '1995-02-11', 26, 'Satish Verma', 'Female', 'Single', 'Indian', 155, 50, 4, 6, 3, 4, 'Admin', GETDATE(), 'Admin', GETDATE(), 1),
(99, 'Suresh', 'Gupta', '1989-11-08', 32, 'Vijay Gupta', 'Male', 'Married', 'Indian', 180, 85, 1, 1, 2, 1, 'Admin', GETDATE(), 'Admin', GETDATE(), 1)

INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, DateOfBirth, Age, FatherOrHusbandName, Gender, MaritalStatus, Citizenship, Height, Weight, BloodGroupID, CasteID, SubCasteID, RelegionID, CreateBy, CreateOn, UpdateBy, UpdateOn, IsActive)
VALUES (100, 'Nikita', 'Gupta', '1992-03-12', 29, 'Rakesh Gupta', 'Female', 'Married', 'Indian', 165, 60, 2, 4, 7, 3, 'Admin', GETDATE(), 'Admin', GETDATE(), 1);


select * from EmployeeDetails


----------------------------------------------------- UPDATE EMPLOYEE DETAILS ------------------------------------------------------


update EmployeeDetails
set RelegionID = Cast(FLOOR(rand(checksum(newid()))* 11)+1 as int) where EmployeeID between 1 and 23



update EmployeeDetails
set CasteID = Cast(FLOOR(rand(checksum(newid()))* 4)+1 as int) where RelegionID = 1

update EmployeeDetails
set CasteID= 5 where RelegionID = 2 and EmployeeID  between 1 and 30

update EmployeeDetails
set CasteID= 6 where RelegionID = 2 and EmployeeID  between 31 and 89

update EmployeeDetails
set CasteID= 5 where RelegionID = 2 and EmployeeID  between 90 and 100

update EmployeeDetails
set CasteID= 7 where RelegionID = 3 and EmployeeID  between 1 and 50

update EmployeeDetails
set CasteID= 8 where RelegionID = 3 and EmployeeID  between 51 and 100

update EmployeeDetails
set CasteID= 9 where RelegionID = 4 and EmployeeID  between 1 and 54

update EmployeeDetails
set CasteID= 10 where RelegionID = 4 and EmployeeID  between 55 and 100

update EmployeeDetails
set CasteID= 11 where RelegionID = 5 

update EmployeeDetails
set CasteID= 12 where RelegionID = 6 and EmployeeID  between 1 and 67

update EmployeeDetails
set CasteID= 13 where RelegionID = 6 and EmployeeID  between 68 and 100

update EmployeeDetails
set CasteID= 14 where RelegionID = 7

update EmployeeDetails
set CasteID= 15 where RelegionID = 8

update EmployeeDetails
set CasteID= 16 where RelegionID = 9

update EmployeeDetails
set CasteID= 17 where RelegionID = 10

update EmployeeDetails
set CasteID= 18 where RelegionID = 11 


update EmployeeDetails
set SubCasteID = 1 where CasteID =1 and EmployeeID between 1 and 45


update EmployeeDetails
set SubCasteID = 2 where CasteID =1 and EmployeeID between 46 and 70


update EmployeeDetails
set SubCasteID = 3 where CasteID =1 and EmployeeID between 71 and 100


update EmployeeDetails
set SubCasteID = 4 where CasteID =2 and EmployeeID between 1 and 45


update EmployeeDetails
set SubCasteID = 5 where CasteID =2 and EmployeeID between 46 and 70


update EmployeeDetails
set SubCasteID = 6 where CasteID =2 and EmployeeID between 71 and 100


update EmployeeDetails
set SubCasteID = 7 where CasteID =3 and EmployeeID between 1 and 45


update EmployeeDetails
set SubCasteID = 8 where CasteID =3 and EmployeeID between 46 and 70


update EmployeeDetails
set SubCasteID = 9 where CasteID =3 and EmployeeID between 71 and 100


update EmployeeDetails
set SubCasteID = 10 where CasteID =4 and EmployeeID between 1 and 45


update EmployeeDetails
set SubCasteID = 11 where CasteID =4 and EmployeeID between 46 and 70

update EmployeeDetails
set SubCasteID = 12 where CasteID =4 and EmployeeID between 71 and 100

update EmployeeDetails
set SubCasteID = 13 where CasteID =5 and EmployeeID between 1 and 45

update EmployeeDetails
set SubCasteID = 14 where CasteID =5 and EmployeeID between 46 and 100

update EmployeeDetails
set SubCasteID = 15 where CasteID =6 and EmployeeID between 1 and 100

update EmployeeDetails
set SubCasteID = 16 where CasteID =7 and EmployeeID between 1 and 100

update EmployeeDetails
set SubCasteID = 17 where CasteID =8 and EmployeeID between 1 and 65

update EmployeeDetails
set SubCasteID = 18 where CasteID =8 and EmployeeID between 66 and 100




-----------------------------------------------------  INSERT CONTACT DETAILS ------------------------------------------------------



  INSERT INTO ContactDetails (ContactID, EmployeeID, --HomeAddress,
  MobileNo, LandlineNo, 
             Email, SkypeID, SlackID, LinkedinID,  
			 --OfficeAddress,
			 OfficeNo --CountryID, StateID, CityID 
			 )
SELECT 
    ROW_NUMBER() OVER(ORDER BY EmployeeID) as ContactID, -- Generating ContactID as Row number
    EmployeeID,
 --CAST(CONCAT('House No. ', FLOOR(RAND(checksum(newid()))*(999-100+1))+100, ', Street No. ', FLOOR(RAND(checksum(NEWID()))*(99-10+1))+10, ', ', ctm.CityName, ', ', sm.StateName, ', India')as nvarchar(150)),
    CAST(CONCAT('+91', ' ', Floor(RAND(checksum(newid()))*8740) + 87999, Floor(RAND(checksum(newid()))*2040) + 30500) as nvarchar(150)),
    CAST(CONCAT('0', FLOOR(RAND(checksum(newid()))*999) + 02000, ' ', Floor(RAND(checksum(newid()))*20409) + 225000) as varchar(50)),
    CONCAT(LEFT(FirstName, 1), '.', LastName, '@gmail.com'),
    CONCAT('skype.', FirstName, '.', LastName),
    CONCAT('slack.', FirstName, '_', LastName),
    CONCAT('linkedin.com/', FirstName, '_', LastName),
    --CAST(CONCAT('Office No. ', FLOOR(RAND(checksum(newid()))*(999-100+1))+100, ', Street No. ', FLOOR(RAND(checksum(newid()))*(99-10+1))+10, ', ', ctm.CityName, ', ', sm.StateName, ', India')as nvarchar(150)),
    CAST(CONCAT('0', FLOOR(RAND(checksum(newid()))*999) + 02000, ' ', Floor(RAND(checksum(newid()))*20409) + 225000) as varchar(50))
    --cm.CountryID,
    --sm.StateID,
    --ctm.CityID
FROM EmployeeDetails 
--CROSS JOIN CountryMaster cm
--CROSS JOIN CityMaster ctm
--INNER JOIN StateMaster sm ON sm.StateID = ctm.StateID AND sm.CountryID = cm.CountryID






select * from  ContactDetails

-----------------------------------------------------  INSERT BANK DETAILS ------------------------------------------------------


INSERT INTO BankDetails (BankID, EmployeeID, BankAccNo, EmployeeName, BankName, Branch, AccountType, --IFSCCode, 
MICRNo)
SELECT 
    ROW_NUMBER() OVER(ORDER BY ed.EmployeeID) as BankID,
    ed.EmployeeID,
    CONCAT(Floor(RAND(CHECKSUM(NEWID())) * 8) + 1, Floor(RAND(CHECKSUM(NEWID())) * 746) + 8309, Floor(RAND(CHECKSUM(NEWID())) * 54837) + 648309) AS BankAccNo,
    CONCAT(ed.FirstName, ' ', ed.LastName) AS EmployeeName,
    CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 4) + 1 AS INT)
        WHEN 1 THEN 'STATE Bank of India'
        WHEN 2 THEN 'HDFC Bank'
        WHEN 3 THEN 'ICICI Bank'
		WHEN 4 THEN 'AXIS Bank'
    END AS BankName,
    CONCAT('Branch ', CAST(floor(RAND(CHECKSUM(NEWID())) * 1000) + 1 AS INT)) AS Branch,
    CASE floor(RAND(CHECKSUM(NEWID())) * 2) + 1
        WHEN 1 THEN 'Savings'
        WHEN 2 THEN 'Current'
    END AS AccountType,
    --CAST(ROUND(RAND(CHECKSUM(NEWID())) * 100000, 0) AS NVARCHAR(50)) AS IFSCCode,
   CONCAT(floor(RAND(CHECKSUM(NEWID())) * 534) + 6000,  floor(RAND(CHECKSUM(NEWID())) * 2634) + 54830)  AS MICRNo

FROM 
    EmployeeDetails ed
	inner join ContactDetails cd on ed.EmployeeID = cd.EmployeeID
where IsActive = 1


select * from BankDetails

-----------------------------------------------------  UPDATE BANK DETAILS ------------------------------------------------------


update bankdetails 
set bankname = 'PUNJAB Bank' where bankname is null


UPDATE BankDetails
SET IFSCCode = cast(CONCAT(LEFT(BankName, 4), '000', floor(RAND(checksum(newid())) * 9438)+ 18593) as nvarchar (150))
where employeeid between 1 and 23;




-----------------------------------------------------  INSERT EDUCATIONAL DETAILS ------------------------------------------------------


Insert into EducationDetails (
    EducationID,
    EmployeeID,
    Qualification,
    School,
    CollegeOrUniversity,
    PassOutYear,
    --SubjectOrField,
    PercentageOrGrade)

SELECT 
    ROW_NUMBER() OVER(ORDER BY EmployeeID) as EducationID, 
    EmployeeID,
	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 8 -1 ) + 2 AS INT)
        WHEN 1 THEN 'BE'
        WHEN 2 THEN 'MCA'
        WHEN 3 THEN 'BCA'
		WHEN 4 THEN 'Msc'
		WHEN 5 THEN 'ME'
		WHEN 6 THEN 'Phd'
		WHEN 7 THEN 'BA'
		WHEN 8 THEN 'Bsc'
	END AS Qualification,


	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 8 -1 ) + 2 AS INT)
	    WHEN 1 THEN 'Litlle Flowers School'
	    WHEN 2 THEN 'St Mary School'
	    WHEN 3 THEN 'Kendriya Vidhyalaya'
	    WHEN 4 THEN 'St Joseph School'
	    WHEN 5 THEN 'Bright School'
	    WHEN 6 THEN 'Day School'
	    WHEN 7 THEN 'Sunshine School'
	    WHEN 8 THEN 'Delhi Public School'
	END AS School,

	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 11 -1 ) + 2 AS INT)
	    WHEN 1 THEN 'Mumbai University'
		WHEN 2 THEN 'Delhi University'
		WHEN 3 THEN 'Sikkim University'
		WHEN 4 THEN 'LD College'
		WHEN 5 THEN 'Gujarat Technological University'
		WHEN 6 THEN 'Goa University'
		WHEN 7 THEN 'Manipal University'
		WHEN 8 THEN 'Delhi University'
		WHEN 9 THEN 'Lovely Professional University'
		WHEN 10 THEN 'BITS Pilani'
		WHEN 11 THEN 'Sharda University'
    END as CollegeOrUniversity,

	CASE 
	    WHEN AGE BETWEEN 1 AND 21 THEN '2023'
		WHEN AGE BETWEEN 22 AND 30 THEN '2014'
		WHEN AGE BETWEEN 31 AND 35 THEN '2006'
		WHEN AGE BETWEEN 36 AND 40 THEN '2001'
		WHEN AGE BETWEEN 41 AND 45 THEN '1996'
		WHEN AGE BETWEEN 46 AND 50 THEN '1991'
		WHEN AGE BETWEEN 51 AND 55 THEN '1987'
		WHEN AGE BETWEEN 56 AND 60 THEN '1982'
		WHEN AGE BETWEEN 61 AND 66 THEN '1976'
		WHEN AGE BETWEEN 67 AND 72 THEN '1969'
		WHEN AGE BETWEEN 73 AND 89 THEN '1958'
		WHEN AGE BETWEEN 90 AND 100 THEN '1940'
	END AS PassOutYear,


	--CASE
      --  WHEN Qualification='BE' THEN 'Engineering'
        --WHEN Qualification='MCA' THEN 'Computer'
        --WHEN Qualification='BCA' THEN 'Computer'
		--WHEN Qualification='Msc'THEN  'Science'
		--WHEN Qualification='ME' THEN  'Engineering'
		--WHEN Qualification='Phd' THEN 'Doctarate'
		--WHEN Qualification='BA' THEN  'Arts'
		--WHEN Qualification='Bsc' THEN 'Science'
	--END as SubjectOrField,

	CAST(floor(rand(checksum(newid()))* 65) + 35 as decimal) as PercentageOrGrade

from EmployeeDetails 
where IsActive = 1




-----------------------------------------------------  UPDATE EDUCATIONAL DETAILS ------------------------------------------------------



update EducationDetails
set Qualification= 'CA'
where Qualification is null

update EducationDetails
	set SubjectOrField = 
	case 
	WHEN Qualification='BE' THEN 'Engineering'
        WHEN Qualification='MCA' THEN 'Computer'
        WHEN Qualification='BCA' THEN 'Computer'
		WHEN Qualification='Msc'THEN  'Science'
		WHEN Qualification='ME' THEN  'Engineering'
		WHEN Qualification='Phd' THEN 'Doctarate'
		WHEN Qualification='BA' THEN  'Arts'
		WHEN Qualification='Bsc' THEN 'Science'
		WHEN Qualification='CA' THEN 'Accountant'
	END;
	 

update EducationDetails
set School= 'St Stephen School'
where School is null	
		
update EducationDetails
set CollegeOrUniversity= 'Nirma University'
where CollegeOrUniversity is null


select * from EducationDetails


-----------------------------------------------------  INSERT EXPERIENCE DETAILS ------------------------------------------------------


insert into ExperienceDetails (
    ExpID,
    EmployeeID,
    Occupation,
    DateOfJoining,
    Experience,
   -- Designation,
    CurrentCompany,
    Sector,
    PreviousCompany)

SELECT 
    ROW_NUMBER() OVER(ORDER BY EmployeeID) as ExpID, 
    EmployeeID,
	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 14) + 1 AS INT)
        WHEN 1 THEN 'Scientist'
        WHEN 2 THEN 'SQL Devloper'
        WHEN 3 THEN 'DOT NET Devloper'
		WHEN 4 THEN 'Electrical Engineer'
		WHEN 5 THEN 'Accountant'
		WHEN 6 THEN 'Software Devloper'
		WHEN 7 THEN 'Civil Engineer'
		WHEN 8 THEN 'Architect'
		WHEN 9 THEN 'Manager'
        WHEN 10 THEN 'Chef'
        WHEN 11 THEN 'Police Officer'
		WHEN 12 THEN 'Worker'
		WHEN 13 THEN 'Salesperson'
		WHEN 14 THEN 'Teacher'

		else 'Dentist'

	END AS Occupation,

CONCAT( floor(RAND(checksum(newid())) * 43 ) + 1980, '-', floor(RAND(checksum(newid())) * 11 ) + 1, '-', floor(RAND(checksum(newid())) * 29 ) + 1),

floor(RAND(checksum(newid())) * 24 ) + 1 ,


	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 7  ) + 1 AS INT)
	    WHEN 1 THEN 'Apple'
	    WHEN 2 THEN 'Infosys'
	    WHEN 3 THEN 'Cisco'
	    WHEN 4 THEN 'Wipro'
	    WHEN 5 THEN 'IBM'
	    WHEN 6 THEN 'TATA STEEL'
	    WHEN 7 THEN 'Pepsi Cola'
	    WHEN 8 THEN 'Bajaj Fin'

		else 'L&T'
	END AS CurrentCompany,

	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 8) + 1 AS INT)
	    WHEN 1 THEN 'Investment'
	    WHEN 2 THEN 'Finance'
	    WHEN 3 THEN 'Technology'
	    WHEN 4 THEN 'IT'
	    WHEN 5 THEN 'SCience'
	    WHEN 6 THEN 'Production'
	    WHEN 7 THEN 'Infrastructure'
	    WHEN 8 THEN 'E- Commerce'
		WHEN 9 THEN 'Construction'

		else 'Marketing'
	END AS Sector,

	CASE CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 10 ) +1 AS INT)
	    WHEN 1 THEN 'IBM'
		WHEN 2 THEN 'State Bank Of India'
		WHEN 3 THEN 'Tech Mahindra'
		WHEN 4 THEN 'Apple'
		WHEN 5 THEN 'Google'
		WHEN 6 THEN 'Ikea'
		WHEN 7 THEN 'ADANI'
		WHEN 8 THEN 'Indian Oil'
		WHEN 9 THEN 'Cisco'
		WHEN 10 THEN 'TCS'
		WHEN 11 THEN 'Decathalon'

		else 'Bosch'
    END as PreviousCompany


from EmployeeDetails
where IsActive = 1




-----------------------------------------------------  UPDATE EXPERIENCE DETAILS ------------------------------------------------------


update ExperienceDetails
	set Designation = 
	case 
	WHEN Occupation='Scientist' THEN 'Jr Scientist'
        WHEN Occupation='SQL Devloper' THEN 'Backend SQL Devloper'
        WHEN Occupation='DOT NET Devloper' THEN 'Frontend .net Devloper'
		WHEN Occupation='Electrical Engineer'THEN  'Electrical Design Engineer'
		WHEN Occupation='Software Devloper' THEN  ' Sr Software Devloper'
		WHEN Occupation='Civil Engineer' THEN 'Structural Engineer'
		WHEN Occupation='Architect' THEN  'Sr Architect'
		WHEN Occupation='Manager' THEN 'Project Manager'
		WHEN Occupation='Chef' THEN 'Master Chef'
		WHEN Occupation='Police Officer' THEN 'Sub Inspector'
		WHEN Occupation='Worker' THEN 'Office Worker'
		WHEN Occupation='Salesperson' THEN 'Sales Manager'
		WHEN Occupation='Teacher' THEN 'PGT'
		WHEN Occupation='Dentist' THEN 'Dental Medicine'
		WHEN Occupation='Accountant' THEN 'CPA'
	END;




select * from ExperienceDetails




	-----------------------------------------------------  NEW CONTACT DETAILS ------------------------------------------------------



INSERT INTO ContactDetails (ContactID, EmployeeID, HomeAddress, MobileNo, LandlineNo, Email, SkypeID, SlackID, LinkedinID, OfficeAddress, OfficeNo 
   --CountryID, StateID, CityID
                                )
SELECT 
    ROW_NUMBER() OVER(ORDER BY EmployeeID) as ContactID, 
    EmployeeID,
    CONCAT('Flat/House No. ', FLOOR(RAND(CHECKSUM(newid()))*(999-100+1)+100), ', ', 
        CHOOSE(FLOOR(RAND(CHECKSUM(newid())) * 2) + 1, 'Lane No. ', 'Road No. ', 'Street No. '), FLOOR(RAND(CHECKSUM(newid()))* 20) +1, ', ',
        CHOOSE(FLOOR(RAND(CHECKSUM(newid()))* 2) +1, 'Near ', 'Opposite '), CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*(8-1+1)+1),'Zydus Hospital,', 
		'SBI Bank,', 'Sun Complex,', 'Prime Tenaments,', 'Gokul Dham Society,', 'Chamanlal Police Station,', 'Church Gate,', 'IIM College,'),
        CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*(2-1+1)+1), 'Shanti Vihar, ', 'Rajiv Nagar, ', 'Mayur Vihar, ', 'Adarsh Nagar, ', 'Vaishali Nagar, ', 'Malviya Nagar, ', 'Vikaspuri, ', 'Lajpat Nagar, '), 
        CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*(2-1+1)+1), 'Phase 1, ', 'Phase 2, ', 'Phase 3, '))
     AS HomeAddress,
    CONCAT('+91', ' ', Floor(RAND(checksum(newid()))*8740) + 87999, Floor(RAND(checksum(newid()))*2040) + 30500)  AS MobileNo,
    CAST(CONCAT('0', FLOOR(RAND(checksum(newid()))*999) + 02000, ' ', Floor(RAND(checksum(newid()))*20409) + 225000) as varchar(50)) AS LandlineNo,
    CONCAT(FirstName, FLOOR(RAND(CHECKSUM(newid()))*(999-100+1)+100), '@gmail.com') AS Email,
    CONCAT('Slype.',FirstName, FLOOR(RAND(CHECKSUM(newid()))*(999-100+1)+100)) AS SkypeID,
    CONCAT('Slack.',FirstName, FLOOR(RAND(CHECKSUM(newid()))*(999-100+1)+100)) AS SlackID,
    CONCAT('linkedin.com/in/', FirstName, FLOOR(RAND(CHECKSUM(newid()))*(999-100+1)+100)) AS LinkedinID,
    CONCAT('Office No. ', FLOOR(RAND(CHECKSUM(newid()))*(999-100+1)+100), ', ',
        CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*3)+1, 'Lane No. ', 'Road No. ', 'Street No. '), FLOOR(RAND(CHECKSUM(newid()))* 20) +1, ', ',
        CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*2)+1, 'Near ', 'Opposite '), CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*(8-1+1)+1), 'ALPHA Mall, ', 'RAJ Mall,', 
		    'In Orbit Mall,', 'Railway Station,','Airport,', 'Genda Circle,', 'Bright School,', 'AXIS Bank,'),
        CHOOSE(FLOOR(RAND(CHECKSUM(newid()))*(2-1+1)+1), 'Sector 14, ', 'Sector 29, ', 'Sector 44, ', 'Sector 56, ', 'Sector 62, ', 'Sector 63, ')
        
    ) AS OfficeAddress, 
CAST(CONCAT('0', FLOOR(RAND(checksum(newid()))*999) + 02000, ' ', Floor(RAND(checksum(newid()))*20409) + 225000) as varchar(50)) AS OfficeNo

	from EmployeeDetails

 
 
 select * from ContactDetails
 --------------------------------------------------------------------- THE END ----------------------------------------------------------------