USE [AdventureWorks2012]
GO
/****** Object:  Schema [Person]    Script Date: 7/25/2025 11:43:39 AM ******/
CREATE SCHEMA [Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
