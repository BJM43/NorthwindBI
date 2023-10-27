
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2023 22:18:06
-- Generated from EDMX file: C:\Users\bjm-r\OneDrive - Instituto Tecnológico de Las Américas (ITLA)\ITLA\Big Data\source\repos\NorthwindBI\Northwind.ConceptualModel\Model\NorthwindDwhModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DWNorthwindOrders];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_DimCategoryDimProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DimProductSet] DROP CONSTRAINT [FK_DimCategoryDimProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_DimCustomerFactOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FactOrderSet] DROP CONSTRAINT [FK_DimCustomerFactOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_DimEmployeeFactOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FactOrderSet] DROP CONSTRAINT [FK_DimEmployeeFactOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_DimShipperFactOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FactOrderSet] DROP CONSTRAINT [FK_DimShipperFactOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_DimDateFactOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FactOrderSet] DROP CONSTRAINT [FK_DimDateFactOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderNumber]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FactOrderDetailsSet] DROP CONSTRAINT [FK_OrderNumber];
GO
IF OBJECT_ID(N'[dbo].[FK_DimProductFactOrderDetails]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FactOrderDetailsSet] DROP CONSTRAINT [FK_DimProductFactOrderDetails];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[DimCustomerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DimCustomerSet];
GO
IF OBJECT_ID(N'[dbo].[DimEmployeeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DimEmployeeSet];
GO
IF OBJECT_ID(N'[dbo].[DimShipperSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DimShipperSet];
GO
IF OBJECT_ID(N'[dbo].[DimDateSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DimDateSet];
GO
IF OBJECT_ID(N'[dbo].[DimCategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DimCategorySet];
GO
IF OBJECT_ID(N'[dbo].[DimProductSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DimProductSet];
GO
IF OBJECT_ID(N'[dbo].[FactOrderSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FactOrderSet];
GO
IF OBJECT_ID(N'[dbo].[FactOrderDetailsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FactOrderDetailsSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DimCustomer'
CREATE TABLE [dbo].[DimCustomer] (
    [CustomerKey] int IDENTITY(1,1) NOT NULL,
    [CustomerId] nvarchar(5)  NOT NULL,
    [Customername] nvarchar(40)  NOT NULL
);
GO

-- Creating table 'DimEmployee'
CREATE TABLE [dbo].[DimEmployee] (
    [EmployeeKey] int IDENTITY(1,1) NOT NULL,
    [EmployeeId] int  NOT NULL,
    [Employeename] nvarchar(30)  NOT NULL
);
GO

-- Creating table 'DimShipper'
CREATE TABLE [dbo].[DimShipper] (
    [ShipperKey] int IDENTITY(1,1) NOT NULL,
    [ShipperId] int  NOT NULL,
    [Shippername] nvarchar(40)  NOT NULL
);
GO

-- Creating table 'DimDate'
CREATE TABLE [dbo].[DimDate] (
    [DateKey] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Datename] nvarchar(50)  NOT NULL,
    [Month] int  NOT NULL,
    [Monthname] nvarchar(50)  NOT NULL,
    [Quarter] int  NOT NULL,
    [Quartername] nvarchar(50)  NOT NULL,
    [Year] int  NOT NULL,
    [Yearname] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'DimCategory'
CREATE TABLE [dbo].[DimCategory] (
    [CategoryKey] int IDENTITY(1,1) NOT NULL,
    [CategorytId] int  NOT NULL,
    [Categoryname] nvarchar(15)  NOT NULL
);
GO

-- Creating table 'DimProduct'
CREATE TABLE [dbo].[DimProduct] (
    [ProductKey] int IDENTITY(1,1) NOT NULL,
    [ProductId] int  NOT NULL,
    [Productname] nvarchar(40)  NOT NULL,
    [CategoryKey] int  NOT NULL
);
GO

-- Creating table 'FactOrder'
CREATE TABLE [dbo].[FactOrder] (
    [OrderNumber] int IDENTITY(1,1) NOT NULL,
    [CustomerKey] int  NOT NULL,
    [EmployeeKey] int  NOT NULL,
    [ShipperKey] int  NOT NULL,
    [DateKey] int  NOT NULL,
    [OrdersQuantity] int  NOT NULL
);
GO

-- Creating table 'FactOrderDetails'
CREATE TABLE [dbo].[FactOrderDetails] (
    [OrderNumber] int  NOT NULL,
    [ProductKey] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [TotalPrice] decimal(18,4)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerKey] in table 'DimCustomer'
ALTER TABLE [dbo].[DimCustomer]
ADD CONSTRAINT [PK_DimCustomer]
    PRIMARY KEY CLUSTERED ([CustomerKey] ASC);
GO

-- Creating primary key on [EmployeeKey] in table 'DimEmployee'
ALTER TABLE [dbo].[DimEmployee]
ADD CONSTRAINT [PK_DimEmployee]
    PRIMARY KEY CLUSTERED ([EmployeeKey] ASC);
GO

-- Creating primary key on [ShipperKey] in table 'DimShipper'
ALTER TABLE [dbo].[DimShipper]
ADD CONSTRAINT [PK_DimShipper]
    PRIMARY KEY CLUSTERED ([ShipperKey] ASC);
GO

-- Creating primary key on [DateKey] in table 'DimDate'
ALTER TABLE [dbo].[DimDate]
ADD CONSTRAINT [PK_DimDate]
    PRIMARY KEY CLUSTERED ([DateKey] ASC);
GO

-- Creating primary key on [CategoryKey] in table 'DimCategory'
ALTER TABLE [dbo].[DimCategory]
ADD CONSTRAINT [PK_DimCategory]
    PRIMARY KEY CLUSTERED ([CategoryKey] ASC);
GO

-- Creating primary key on [ProductKey] in table 'DimProduct'
ALTER TABLE [dbo].[DimProduct]
ADD CONSTRAINT [PK_DimProduct]
    PRIMARY KEY CLUSTERED ([ProductKey] ASC);
GO

-- Creating primary key on [OrderNumber] in table 'FactOrder'
ALTER TABLE [dbo].[FactOrder]
ADD CONSTRAINT [PK_FactOrder]
    PRIMARY KEY CLUSTERED ([OrderNumber] ASC);
GO

-- Creating primary key on [OrderNumber], [ProductKey] in table 'FactOrderDetails'
ALTER TABLE [dbo].[FactOrderDetails]
ADD CONSTRAINT [PK_FactOrderDetails]
    PRIMARY KEY CLUSTERED ([OrderNumber], [ProductKey] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryKey] in table 'DimProduct'
ALTER TABLE [dbo].[DimProduct]
ADD CONSTRAINT [FK_DimCategoryDimProduct]
    FOREIGN KEY ([CategoryKey])
    REFERENCES [dbo].[DimCategory]
        ([CategoryKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimCategoryDimProduct'
CREATE INDEX [IX_FK_DimCategoryDimProduct]
ON [dbo].[DimProduct]
    ([CategoryKey]);
GO

-- Creating foreign key on [CustomerKey] in table 'FactOrder'
ALTER TABLE [dbo].[FactOrder]
ADD CONSTRAINT [FK_DimCustomerFactOrder]
    FOREIGN KEY ([CustomerKey])
    REFERENCES [dbo].[DimCustomer]
        ([CustomerKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimCustomerFactOrder'
CREATE INDEX [IX_FK_DimCustomerFactOrder]
ON [dbo].[FactOrder]
    ([CustomerKey]);
GO

-- Creating foreign key on [EmployeeKey] in table 'FactOrder'
ALTER TABLE [dbo].[FactOrder]
ADD CONSTRAINT [FK_DimEmployeeFactOrder]
    FOREIGN KEY ([EmployeeKey])
    REFERENCES [dbo].[DimEmployee]
        ([EmployeeKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimEmployeeFactOrder'
CREATE INDEX [IX_FK_DimEmployeeFactOrder]
ON [dbo].[FactOrder]
    ([EmployeeKey]);
GO

-- Creating foreign key on [ShipperKey] in table 'FactOrder'
ALTER TABLE [dbo].[FactOrder]
ADD CONSTRAINT [FK_DimShipperFactOrder]
    FOREIGN KEY ([ShipperKey])
    REFERENCES [dbo].[DimShipper]
        ([ShipperKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimShipperFactOrder'
CREATE INDEX [IX_FK_DimShipperFactOrder]
ON [dbo].[FactOrder]
    ([ShipperKey]);
GO

-- Creating foreign key on [DateKey] in table 'FactOrder'
ALTER TABLE [dbo].[FactOrder]
ADD CONSTRAINT [FK_DimDateFactOrder]
    FOREIGN KEY ([DateKey])
    REFERENCES [dbo].[DimDate]
        ([DateKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimDateFactOrder'
CREATE INDEX [IX_FK_DimDateFactOrder]
ON [dbo].[FactOrder]
    ([DateKey]);
GO

-- Creating foreign key on [OrderNumber] in table 'FactOrderDetails'
ALTER TABLE [dbo].[FactOrderDetails]
ADD CONSTRAINT [FK_OrderNumber]
    FOREIGN KEY ([OrderNumber])
    REFERENCES [dbo].[FactOrder]
        ([OrderNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductKey] in table 'FactOrderDetails'
ALTER TABLE [dbo].[FactOrderDetails]
ADD CONSTRAINT [FK_DimProductFactOrderDetails]
    FOREIGN KEY ([ProductKey])
    REFERENCES [dbo].[DimProduct]
        ([ProductKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimProductFactOrderDetails'
CREATE INDEX [IX_FK_DimProductFactOrderDetails]
ON [dbo].[FactOrderDetails]
    ([ProductKey]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------