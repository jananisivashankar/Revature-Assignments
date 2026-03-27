CREATE DATABASE BankingDB;
USE BankingDB;



CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    CustomerStatus ENUM('Active', 'Inactive') NOT NULL
);

CREATE TABLE Branches (
    BranchId INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(100) NOT NULL,
    BranchCode VARCHAR(20) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    IFSCCode VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE Accounts (
    AccountId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    BranchId INT NOT NULL,
    AccountNumber VARCHAR(20) NOT NULL UNIQUE,
    AccountType ENUM('Savings', 'Current', 'Fixed Deposit') NOT NULL,
    OpenDate DATE NOT NULL,
    Balance DECIMAL(12,2) NOT NULL,
    AccountStatus ENUM('Active', 'Closed', 'Frozen') NOT NULL,
    
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (BranchId) REFERENCES Branches(BranchId)
);





CREATE TABLE BankTransactions (
    TransactionId INT PRIMARY KEY AUTO_INCREMENT,
    AccountId INT NOT NULL,
    TransactionDate DATETIME NOT NULL,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    Description VARCHAR(255),
    
    FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId)
);



CREATE TABLE Loans (
    LoanId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    BranchId INT NOT NULL,
    LoanType ENUM('Home Loan', 'Car Loan', 'Personal Loan', 'Education Loan') NOT NULL,
    LoanAmount DECIMAL(12,2) NOT NULL,
    InterestRate DECIMAL(5,2) NOT NULL,
    LoanStartDate DATE NOT NULL,
    LoanStatus ENUM('Approved', 'Pending', 'Closed') NOT NULL,
    
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (BranchId) REFERENCES Branches(BranchId)
);




CREATE TABLE AccountAudit (
    AuditId INT PRIMARY KEY AUTO_INCREMENT,
    AccountId INT NOT NULL,
    ActionType VARCHAR(50) NOT NULL,
    OldBalance DECIMAL(12,2),
    NewBalance DECIMAL(12,2),
    ActionDate DATETIME NOT NULL,
    Remarks VARCHAR(255),
    
    FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId)
);



CREATE TABLE LoanAudit (
    AuditId INT PRIMARY KEY AUTO_INCREMENT,
    LoanId INT NOT NULL,
    OldStatus VARCHAR(20),
    NewStatus VARCHAR(20),
    ActionDate DATETIME,
    Remarks VARCHAR(255)
);





INSERT INTO Customers (CustomerName, Gender, DateOfBirth, PhoneNumber, Email, City, State, CustomerStatus)
VALUES
('Arun Kumar', 'Male', '1998-05-10', '9876543210', 'arun@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Priya Sharma', 'Female', '1995-08-20', '9876543211', 'priya@gmail.com', 'Bangalore', 'Karnataka', 'Active'),
('Rahul Verma', 'Male', '1992-03-15', '9876543212', 'rahul@gmail.com', 'Chennai', 'Tamil Nadu', 'Inactive'),
('Sneha Reddy', 'Female', '2000-11-25', '9876543213', 'sneha@gmail.com', 'Hyderabad', 'Telangana', 'Active'),
('Vikram Singh', 'Male', '1997-07-30', '9876543214', 'vikram@gmail.com', 'Mumbai', 'Maharashtra', 'Active');

INSERT INTO Branches (BranchName, BranchCode, City, State, IFSCCode)
VALUES
('Chennai Main Branch', 'BR001', 'Chennai', 'Tamil Nadu', 'BANK0001'),
('Bangalore City Branch', 'BR002', 'Bangalore', 'Karnataka', 'BANK0002'),
('Hyderabad Central Branch', 'BR003', 'Hyderabad', 'Telangana', 'BANK0003'),
('Mumbai West Branch', 'BR004', 'Mumbai', 'Maharashtra', 'BANK0004');


INSERT INTO Accounts (CustomerId, BranchId, AccountNumber, AccountType, OpenDate, Balance, AccountStatus)
VALUES
(1, 1, 'ACC1001', 'Savings', '2023-01-10', 50000.00, 'Active'),
(2, 2, 'ACC1002', 'Current', '2023-02-15', 120000.00, 'Active'),
(3, 1, 'ACC1003', 'Savings', '2022-12-20', 80000.00, 'Frozen'),
(4, 3, 'ACC1004', 'Savings', '2024-01-05', 150000.00, 'Active'),
(5, 4, 'ACC1005', 'Fixed Deposit', '2021-11-11', 250000.00, 'Active'),
(1, 2, 'ACC1006', 'Current', '2024-03-01', 70000.00, 'Active');






INSERT INTO Loans (CustomerId, BranchId, LoanType, LoanAmount, InterestRate, LoanStartDate, LoanStatus)
VALUES
(1, 1, 'Home Loan', 500000.00, 8.50, '2023-06-01', 'Approved'),
(2, 2, 'Personal Loan', 100000.00, 11.00, '2024-01-15', 'Pending'),
(3, 1, 'Car Loan', 300000.00, 9.25, '2022-08-20', 'Approved'),
(4, 3, 'Education Loan', 200000.00, 7.75, '2023-09-10', 'Closed');




INSERT INTO BankTransactions (AccountId, TransactionDate, TransactionType, Amount, Description)
VALUES
(1, NOW(), 'Deposit', 10000.00, 'Salary Credit'),
(1, NOW(), 'Withdrawal', 5000.00, 'ATM Withdrawal'),
(2, NOW(), 'Deposit', 20000.00, 'Business Income'),
(3, NOW(), 'Transfer', 15000.00, 'Online Transfer'),
(4, NOW(), 'Deposit', 30000.00, 'Cash Deposit'),
(5, NOW(), 'Withdrawal', 10000.00, 'FD Partial Withdrawal');



INSERT INTO AccountAudit (AccountId, ActionType, OldBalance, NewBalance, ActionDate, Remarks)
VALUES
(1, 'Account Created', NULL, 50000.00, NOW(), 'Initial account opening'),
(2, 'Account Created', NULL, 120000.00, NOW(), 'Initial account opening');


SELECT *
FROM Customers
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Loans
    WHERE LoanAmount > (
        SELECT MAX(LoanAmount)
        FROM Loans
        WHERE LoanType = 'Personal Loan'
    )
);



SELECT *
FROM Customers
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Accounts
    WHERE Balance > (SELECT AVG(Balance) FROM Accounts)
);

SELECT *
FROM Customers
WHERE CustomerId NOT IN (
    SELECT CustomerId
    FROM Loans
);

SELECT *
FROM Accounts
WHERE BranchId IN (
    SELECT BranchId
    FROM Branches
    WHERE City = 'Chennai'
);


SELECT *
FROM Customers
WHERE CustomerId NOT IN (
    SELECT CustomerId
    FROM Loans
);




SELECT c.CustomerId, c.CustomerName, SUM(t.Amount) AS TotalTransaction
FROM Customers c
JOIN Accounts a ON c.CustomerId = a.CustomerId
JOIN BankTransactions t ON a.AccountId = t.AccountId
GROUP BY c.CustomerId, c.CustomerName
HAVING SUM(t.Amount) > (
    SELECT SUM(t2.Amount)
    FROM Accounts a2
    JOIN BankTransactions t2 ON a2.AccountId = t2.AccountId
    WHERE a2.CustomerId = 1
);


SELECT *
FROM Branches
WHERE BranchId IN (
    SELECT BranchId
    FROM Accounts
    GROUP BY BranchId
    HAVING COUNT(*) > (
        SELECT AVG(AccountCount)
        FROM (
            SELECT COUNT(*) AS AccountCount
            FROM Accounts
            GROUP BY BranchId
        ) AS BranchAccountCounts
    )
);

SELECT *
FROM Accounts
WHERE Balance = (
    SELECT MAX(Balance)
    FROM Accounts
    WHERE Balance < (
        SELECT MAX(Balance) FROM Accounts
    )
);


SELECT *
FROM Customers
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Accounts
    WHERE OpenDate = (SELECT MIN(OpenDate) FROM Accounts)
);



SELECT *
FROM Loans
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Accounts
    WHERE AccountType = 'Savings'
);


SELECT *
FROM Customers
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Accounts
    GROUP BY CustomerId
    HAVING COUNT(*) > 1
);

CREATE VIEW vw_CustomerAccountDetails AS
SELECT 
    c.CustomerId,
    c.CustomerName,
    a.AccountNumber,
    a.AccountType,
    a.Balance,
    a.AccountStatus
FROM Customers c
JOIN Accounts a ON c.CustomerId = a.CustomerId;









CREATE VIEW vw_BranchAccountSummary AS
SELECT 
    b.BranchName,
    COUNT(a.AccountId) AS TotalAccounts,
    SUM(a.Balance) AS TotalBalance
FROM Branches b
LEFT JOIN Accounts a ON b.BranchId = a.BranchId
GROUP BY b.BranchName;




CREATE VIEW vw_LoanCustomerDetails AS
SELECT
    c.CustomerName,
    l.LoanType,
    l.LoanAmount,
    l.InterestRate,
    l.LoanStatus,
    b.BranchName
FROM Loans l
JOIN Customers c ON l.CustomerId = c.CustomerId
JOIN Branches b ON l.BranchId = b.BranchId;





CREATE VIEW vw_HighValueAccounts AS
SELECT *
FROM Accounts
WHERE Balance > 100000;




CREATE VIEW vw_DailyTransactions AS
SELECT
    a.AccountNumber,
    t.TransactionDate,
    t.TransactionType,
    t.Amount,
    t.Description
FROM BankTransactions t
JOIN Accounts a ON t.AccountId = a.AccountId;




CREATE VIEW vw_ActiveCustomers AS
SELECT *
FROM Customers
WHERE CustomerStatus = 'Active';



CREATE VIEW vw_ApprovedLoans AS
SELECT *
FROM Loans
WHERE LoanStatus = 'Approved';



CREATE VIEW vw_CustomerAccountBranch AS
SELECT
    c.CustomerId,
    c.CustomerName,
    a.AccountNumber,
    a.AccountType,
    a.Balance,
    b.BranchName,
    b.City,
    b.State
FROM Customers c
JOIN Accounts a ON c.CustomerId = a.CustomerId
JOIN Branches b ON a.BranchId = b.BranchId;



SELECT * FROM vw_ActiveCustomers;

UPDATE vw_ActiveCustomers
SET City = 'Coimbatore'
WHERE CustomerId = 1;



INSERT INTO vw_ActiveCustomers
(CustomerName, Gender, DateOfBirth, PhoneNumber, Email, City, State, CustomerStatus)
VALUES
('Kiran', 'Male', '1999-09-09', '9876543299', 'kiran@gmail.com', 'Madurai', 'Tamil Nadu', 'Active');





DROP VIEW IF EXISTS vw_BranchBalanceSummary;

CREATE VIEW vw_BranchBalanceSummary AS
SELECT
    BranchId,
    COUNT(AccountId) AS TotalAccounts,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY BranchId;

UPDATE Accounts
SET Balance = 420000
WHERE AccountId = 1;


SELECT * FROM vw_BranchBalanceSummary;

DELIMITER //

CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM Customers;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetAccountsByCustomer(IN p_CustomerId INT)
BEGIN
    SELECT * 
    FROM Accounts
    WHERE CustomerId = p_CustomerId;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE GetBranchTotalBalance(IN p_BranchId INT)
BEGIN
    SELECT SUM(Balance) AS TotalBalance
    FROM Accounts
    WHERE BranchId = p_BranchId;
END //

DELIMITER ;


DELIMITER //

DELIMITER //

CREATE PROCEDURE GetApprovedLoanCount(OUT p_TotalCount INT)
BEGIN
    SELECT COUNT(*) INTO p_TotalCount
    FROM Loans
    WHERE LoanStatus = 'Approved';
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AddTransaction(
    IN p_AccountId INT,
    IN p_TransactionType VARCHAR(20),
    IN p_Amount DECIMAL(12,2),
    IN p_Description VARCHAR(255)
)
BEGIN
    INSERT INTO BankTransactions(AccountId, TransactionDate, TransactionType, Amount, Description)
    VALUES (p_AccountId, NOW(), p_TransactionType, p_Amount, p_Description);
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE DepositAmount(
    IN p_AccountId INT,
    IN p_Amount DECIMAL(12,2)
)
BEGIN
    INSERT INTO BankTransactions(AccountId, TransactionDate, TransactionType, Amount, Description)
    VALUES (p_AccountId, NOW(), 'Deposit', p_Amount, 'Deposit via procedure');
END //

DELIMITER ;















DELIMITER //

CREATE PROCEDURE WithdrawAmount(
    IN p_AccountId INT,
    IN p_Amount DECIMAL(12,2)
)
BEGIN
    DECLARE current_balance DECIMAL(12,2);

    SELECT Balance INTO current_balance
    FROM Accounts
    WHERE AccountId = p_AccountId;

    IF current_balance >= p_Amount THEN
        INSERT INTO BankTransactions(AccountId, TransactionDate, TransactionType, Amount, Description)
        VALUES (p_AccountId, NOW(), 'Withdrawal', p_Amount, 'Withdrawal via procedure');
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient balance';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetLoansByCustomer(IN p_CustomerId INT)
BEGIN
    SELECT *
    FROM Loans
    WHERE CustomerId = p_CustomerId;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE ChangeAccountStatus(
    IN p_AccountId INT,
    IN p_NewStatus VARCHAR(20)
)
BEGIN
    UPDATE Accounts
    SET AccountStatus = p_NewStatus
    WHERE AccountId = p_AccountId;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AddServiceCharge(INOUT p_Balance DECIMAL(12,2))
BEGIN
    SET p_Balance = p_Balance - 100;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_BeforeInsertAccount
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.Balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Balance cannot be negative';
    END IF;
END //

DELIMITER ;





DELIMITER //

CREATE TRIGGER trg_AfterInsertAccount
AFTER INSERT ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO AccountAudit(AccountId, ActionType, OldBalance, NewBalance, ActionDate, Remarks)
    VALUES (NEW.AccountId, 'Account Created', NULL, NEW.Balance, NOW(), 'New account created');
END //

DELIMITER ;



DELIMITER //

CREATE TRIGGER trg_BeforeUpdateAccount
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.Balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Updated balance cannot be negative';
    END IF;
END //

DELIMITER ;




DELIMITER //

CREATE TRIGGER trg_AfterUpdateAccount
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF OLD.Balance <> NEW.Balance THEN
        INSERT INTO AccountAudit(AccountId, ActionType, OldBalance, NewBalance, ActionDate, Remarks)
        VALUES (NEW.AccountId, 'Balance Updated', OLD.Balance, NEW.Balance, NOW(), 'Balance changed');
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_BeforeInsertTransaction
BEFORE INSERT ON BankTransactions
FOR EACH ROW
BEGIN
    IF NEW.Amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaction amount must be greater than zero';
    END IF;
END //

DELIMITER ;








DELIMITER //

CREATE TRIGGER trg_AfterInsertTransactionDeposit
AFTER INSERT ON BankTransactions
FOR EACH ROW
BEGIN
    IF NEW.TransactionType = 'Deposit' THEN
        UPDATE Accounts
        SET Balance = Balance + NEW.Amount
        WHERE AccountId = NEW.AccountId;
    END IF;
END //

DELIMITER ;






DELIMITER //

CREATE TRIGGER trg_AfterInsertTransactionWithdrawal
AFTER INSERT ON BankTransactions
FOR EACH ROW
BEGIN
    IF NEW.TransactionType = 'Withdrawal' THEN
        UPDATE Accounts
        SET Balance = Balance - NEW.Amount
        WHERE AccountId = NEW.AccountId;
    END IF;
END //

DELIMITER ;



DELIMITER //

CREATE TRIGGER trg_AfterInsertTransactionWithdrawal
AFTER INSERT ON BankTransactions
FOR EACH ROW
BEGIN
    IF NEW.TransactionType = 'Withdrawal' THEN
        UPDATE Accounts
        SET Balance = Balance - NEW.Amount
        WHERE AccountId = NEW.AccountId;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_BeforeDeleteBranch
BEFORE DELETE ON Branches
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Accounts WHERE BranchId = OLD.BranchId
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete branch with existing accounts';
    END IF;
END //

DELIMITER ;










DELIMITER //

CREATE TRIGGER trg_BeforeInsertLoan
BEFORE INSERT ON Loans
FOR EACH ROW
BEGIN
    IF NEW.LoanAmount < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Loan amount must be at least 10000';
    END IF;
END //

DELIMITER ;







DELIMITER //

CREATE TRIGGER trg_AfterUpdateLoan
AFTER UPDATE ON Loans
FOR EACH ROW
BEGIN
    IF OLD.LoanStatus = 'Pending' AND NEW.LoanStatus IN ('Approved', 'Closed') THEN
        INSERT INTO LoanAudit(LoanId, OldStatus, NewStatus, ActionDate, Remarks)
        VALUES (NEW.LoanId, OLD.LoanStatus, NEW.LoanStatus, NOW(), 'Loan status changed');
    END IF;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE GetCustomersAboveBranchAverage()
BEGIN
    SELECT c.CustomerId, c.CustomerName, a.Balance, a.BranchId
    FROM Customers c
    JOIN Accounts a ON c.CustomerId = a.CustomerId
    WHERE a.Balance > (
        SELECT AVG(a2.Balance)
        FROM Accounts a2
        WHERE a2.BranchId = a.BranchId
    );
END //

DELIMITER ;







DELIMITER //

CREATE PROCEDURE GetActiveCustomers()
BEGIN
    SELECT * FROM vw_ActiveCustomers;
END //

DELIMITER ;


CREATE VIEW vw_CustomerBranchLatestTransaction AS
SELECT
    c.CustomerName,
    b.BranchName,
    a.AccountNumber,
    (
        SELECT MAX(t.TransactionDate)
        FROM BankTransactions t
        WHERE t.AccountId = a.AccountId
    ) AS LatestTransactionDate
FROM Customers c
JOIN Accounts a ON c.CustomerId = a.CustomerId
JOIN Branches b ON a.BranchId = b.BranchId;





DELIMITER //

CREATE PROCEDURE GetTransactionCountByCustomer(
    IN p_CustomerId INT
)
BEGIN
    SELECT COUNT(t.TransactionId) AS TotalTransactions
    FROM Accounts a
    JOIN BankTransactions t ON a.AccountId = t.AccountId
    WHERE a.CustomerId = p_CustomerId;
END //

DELIMITER ;




