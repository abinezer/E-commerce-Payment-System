IF OBJECT_ID('dbo.RegTypes', 'U') IS NOT NULL
DROP TABLE dbo.RegTypes
GO
-- Create the table in the specified schema
CREATE TABLE dbo.RegTypes
(
    RegTypeID VARCHAR(3) NOT NULL PRIMARY KEY, -- primary key column
    RegistrationType VARCHAR(20) NOT NULL 
);
GO

IF OBJECT_ID('dbo.Registrations', 'U') IS NOT NULL
DROP TABLE dbo.Registrations
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Registrations
(
    RegID VARCHAR(7) NOT NULL PRIMARY KEY, -- primary key column
    Phone_number VARCHAR(10) NOT NULL,
    Passwd varchar(10) NOT NULL,
    RegTypeID VARCHAR(3) NOT NULL  
    -- specify more columns here
);
GO

IF OBJECT_ID('dbo.Permissions', 'U') IS NOT NULL
DROP TABLE dbo.Permissions
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Permissions
(
    UserTypeID VARCHAR(3) NOT NULL , -- primary key column
    UserType VARCHAR(20) NOT NULL,
    Updt BIT NULL,
    crt BIT NULL,
    dlt BIT NULL,
    qry BIT NULL, 
    
);
GO

IF OBJECT_ID('dbo.IFSC', 'U') IS NOT NULL
DROP TABLE dbo.IFSC
GO
-- Create the table in the specified schema
CREATE TABLE dbo.IFSC
(
    IFSC_code VARCHAR(11) NOT NULL PRIMARY KEY,
    BranchName VARCHAR(20) NOT NULL,
    BankID_no  VARCHAR(10) NOT NULL,
    AreaName VARCHAR(20) NOT NULL,
    PIN_code VARCHAR(6),
);
GO

IF OBJECT_ID('dbo.Banks', 'U') IS NOT NULL
DROP TABLE dbo.Banks
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Banks
(
    BankID VARCHAR(10) NOT NULL PRIMARY KEY,
    BankName VARCHAR(20) 
);
GO
IF OBJECT_ID('dbo.CustomerDetails', 'U') IS NOT NULL
DROP TABLE dbo.CustomerDetails
GO
-- Create the table in the specified schema
CREATE TABLE dbo.CustomerDetails
(
    WalletID VARCHAR(5),
    CustomerID VARCHAR(7),
    NameOfCustomer VARCHAR(20),
    PAN_number VARCHAR(10),
    RegID VARCHAR(7) Not NULL
);
GO

IF OBJECT_ID('dbo.MerchantDetails', 'U') IS NOT NULL
DROP TABLE dbo.MerchantDetails
GO
-- Create the table in the specified schema
CREATE TABLE dbo.MerchantDetails
(
    WalletID VARCHAR(5) PRIMARY KEY NOT NULL,
    MerchantID VARCHAR(7),
    NameOnPAN VARCHAR(20),
    PAN_number VARCHAR(10),
    SubCategoryID VARCHAR(7),
    RegID VARCHAR(7),
    DisplayName VARCHAR(20)
);
GO

IF OBJECT_ID('dbo.Wallet', 'U') IS NOT NULL
DROP TABLE dbo.Wallet
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Wallet
(
    WalletID VARCHAR(5) PRIMARY KEY NOT NULL,
    WalletAmount INT,
    BankAccountNumber VARCHAR(12),
    IFSCno VARCHAR(11)
);
GO


-- Create the table in the specified schema
CREATE TABLE dbo.BusinessCategories
(
    CategoryID VARCHAR(7) PRIMARY KEY NOT NULL,
    CategoryName VARCHAR(20) NOT NULL,
);
GO

IF OBJECT_ID('dbo.BusinessSubCategory', 'U') IS NOT NULL
DROP TABLE dbo.BusinessSubCategory
GO
-- Create the table in the specified schema
CREATE TABLE dbo.BusinessSubCategory
(
    SubCategoryID VARCHAR(7) PRIMARY KEY NOT NULL,
    SubCategoryName Varchar(20),
    CategoryID VARCHAR(7) NOT NULL
);
GO

IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL
DROP TABLE dbo.Transactions
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Transactions
(
    TransactionID VARCHAR(7) NOT NULL,
    SourceID VARCHAR(5),
    DestID VARCHAR(5),
    Amount Money,
    DoT DATE,
    ToT Time,
    PayID VARCHAR(5)
);
GO


-- Create the table in the specified schema
CREATE TABLE dbo.TransactionTypes
(
    PayID VARCHAR(5) NOT NULL PRIMARY KEY,
    Source VARCHAR(10),
    Dest VARCHAR(10),
);
GO



ALTER TABLE dbo.Registrations
   ADD CONSTRAINT FK_RegTypes_Reg FOREIGN KEY (RegTypeID)
      REFERENCES dbo.RegTypes (RegTypeID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;


ALTER TABLE dbo.CustomerDetails
   ADD CONSTRAINT FK_Customer_Reg FOREIGN KEY (RegID)
      REFERENCES dbo.Registrations(RegID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.MerchantDetails
   ADD CONSTRAINT FK_Merchant_Reg FOREIGN KEY (RegID)
      REFERENCES dbo.Registrations (RegID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;



ALTER TABLE dbo.BusinessSubCategory
   ADD CONSTRAINT FK_SubCat_Cat FOREIGN KEY (CategoryID)
      REFERENCES dbo.BusinessCategories (CategoryID)
      ON DELETE CASCADE
      ON UPDATE CASCADE     
;

ALTER TABLE dbo.MerchantDetails
   ADD CONSTRAINT FK_Merchant_SubCat FOREIGN KEY (SubCategoryID)
      REFERENCES dbo.BusinessSubCategory (SubCategoryID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.Permissions
   ADD CONSTRAINT FK_Permission_RegType FOREIGN KEY (UserTypeID)
      REFERENCES dbo.RegTypes (RegTypeID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.IFSC
   ADD CONSTRAINT FK_ifsc_bank FOREIGN KEY (BankID_no)
      REFERENCES dbo.Banks (BankID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.Wallet
   ADD CONSTRAINT FK_Wallet_ifsc FOREIGN KEY (IFSCno)
      REFERENCES dbo.IFSC (IFSC_code)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;


ALTER TABLE dbo.MerchantDetails
   ADD CONSTRAINT FK_Merchant_wallet FOREIGN KEY (WalletID)
      REFERENCES dbo.Wallet (WalletID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.CustomerDetails
   ADD CONSTRAINT FK_Customer_wallet FOREIGN KEY (WalletID)
      REFERENCES dbo.Wallet (WalletID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.Transactions
   ADD CONSTRAINT FK_trans_transType FOREIGN KEY (PayID)
      REFERENCES dbo.TransactionTypes (PayID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;
