CREATE TABLE [dbo].[TestTable] (
    [ID]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (25) NOT NULL,
    [Salary] DATETIME      NOT NULL
);
GO

ALTER TABLE [dbo].[TestTable]
    ADD CONSTRAINT [PK_TestTable_ID] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

