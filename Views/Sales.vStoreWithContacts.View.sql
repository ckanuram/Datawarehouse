USE [AdventureWorks2012]
GO
/****** Object:  View [Sales].[vStoreWithContacts]    Script Date: 7/25/2025 11:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Sales].[vStoreWithContacts] AS 
SELECT 
    s.[BusinessEntityID] 
    ,s.[Name] 
    ,ct.[Name] AS [ContactType] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,pp.[PhoneNumber] 
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress] 
    ,p.[EmailPromotion] 
FROM [Sales].[Store] s
    INNER JOIN [Person].[BusinessEntityContact] bec 
    ON bec.[BusinessEntityID] = s.[BusinessEntityID]
	INNER JOIN [Person].[ContactType] ct
	ON ct.[ContactTypeID] = bec.[ContactTypeID]
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = bec.[PersonID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores (including store contacts) that sell Adventure Works Cycles products to consumers.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'VIEW',@level1name=N'vStoreWithContacts'
GO
