CREATE TABLE [dbo].[TestTable2] (
    [ID]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (25) NOT NULL,
    [Salary] DATETIME      NOT NULL
);
GO

ALTER TABLE [dbo].[TestTable2]
    ADD CONSTRAINT [PK_TestTable2_ID] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

