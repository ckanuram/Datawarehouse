USE [AdventureWorks2012]
GO
/****** Object:  Schema [Purchasing]    Script Date: 7/25/2025 11:43:39 AM ******/
CREATE SCHEMA [Purchasing]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to vendors and purchase orders.' , @level0type=N'SCHEMA',@level0name=N'Purchasing'
GO
